#!/bin/sh

export WINEPREFIX="$HOME/.local/share/4nec2/prefix"
export WINEARCH="win32"

# install dependencies if they're not present
if [ ! -d "$WINEPREFIX" ]; then
    echo "running first-time setup of the wine prefix; this might take a while"
    wineboot -u
    winetricks vb6run dx8vb msflxgrd
fi

wine "$pkgdir/opt/4nec2/exe/4nec2.exe"
