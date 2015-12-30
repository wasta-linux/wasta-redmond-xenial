#!/bin/bash

# ==============================================================================
# wasta-redmond-postinst.sh
#
#   This script is automatically run by the postinst configure step on
#       installation of wasta-core-wily.  It can be manually re-run, but is
#       only intended to be run at package installation.
#
#   2015-11-14 rik: initial script
#
# ==============================================================================

# ------------------------------------------------------------------------------
# Check to ensure running as root
# ------------------------------------------------------------------------------
#   No fancy "double click" here because normal user should never need to run
if [ $(id -u) -ne 0 ]
then
	echo
	echo "You must run this script with sudo." >&2
	echo "Exiting...."
	sleep 5s
	exit 1
fi

# ------------------------------------------------------------------------------
# Initial Setup
# ------------------------------------------------------------------------------

echo
echo "*** Script Entry: wasta-redmond-postinst.sh"
echo

# ------------------------------------------------------------------------------
# Dconf / Gsettings Default Value adjustments
# ------------------------------------------------------------------------------
echo
echo "*** Updating dconf / gsettings default values"
echo

# recompile gnome-shell extension schemas that we have placed overrides in.
# gnomenu not recompiled because only do that when we activate
#   wasta-gnome-redmond
glib-compile-schemas \
    /usr/share/gnome-shell/extensions/TaskBar@zpydr/schemas/

# MAIN System schemas not recompiled because only do that when we activate
#   wasta-gnome-redmond

# ------------------------------------------------------------------------------
# Finished
# ------------------------------------------------------------------------------
echo
echo "*** Script Exit: wasta-redmond-postinst.sh"
echo

exit 0
