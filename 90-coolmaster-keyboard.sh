#!/bin/bash
#
# This script sets default settings for a coolmaster dominator
# keyboard.

# source the config
CONFIG="/etc/default/coolmaster_keyboard"
source "$CONFIG"

# errors and warnings. an error is simply a fatal warning
warn(){
    echo "coolmaster-keyboard: WARN: $@" 1>&2
}
error(){
    echo "coolmaster-keyboard: ERROR: $@" 1>&2
    exit 1
}

# LED backlight setting, santize inputs first.
BACKLIGHT=${BACKLIGHT,,}
BACKLIGHT=${BACKLIGHT//[[:blank:]]/}
case $BACKLIGHT in
  on|off)
    xset led $BACKLIGHT
    ;;
  *)
    warn "invalid backlight setting in $CONFIG"
    ;;
esac

