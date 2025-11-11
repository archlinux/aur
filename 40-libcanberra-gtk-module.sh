#!/bin/sh

case "${DESKTOP_SESSION-}" in
  gnome*) # Done by gnome-settings-daemon
  ;;
  *)
    # Extra check in case DESKTOP_SESSION is not set correctly
    if [ -z "${GNOME_DESKTOP_SESSION_ID-}" ]; then
      GTK_MODULES="${GTK_MODULES:+$GTK_MODULES:}canberra-gtk-module"
      export GTK_MODULES
    fi
  ;;
esac
