#!/bin/bash

if [ -n "${GNOME_DESKTOP_SESSION_ID-}" ] ; then
  # just in case DESKTOP_SESSION wasn't properly set
  _check=gnome
else
  _check="${DESKTOP_SESSION-}"
fi

case "${_check}" in
  gnome|gnome-*|*/gnome|*/gnome-*)
    if [ x"$GTK_CSD" = x"0" ] ; then
      unset GTK_CSD
    fi
    ;;
  *)
    if [ -z "$GTK_CSD" ] ; then
      GTK_CSD=0
    fi
    export GTK_CSD
    if [ x"$GTK_CSD"x = x"0"x ] ; then
      export LD_PRELOAD="/usr/lib/libgtk3-nocsd.so.0${LD_PRELOAD:+:$LD_PRELOAD}"
    fi
    ;;
esac

unset _check
