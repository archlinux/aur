#!/bin/bash
export WINEPREFIX="$HOME/.86box/wine"

if [ ! -d "$HOME"/.86box ] ; then
  mkdir -p "$HOME"/.86box/wine || exit 1
  ln -s /usr/share/86box/86Box.exe "$HOME"/.86box/86Box.exe || exit 1
  ln -s /usr/share/86box/discord_game_sdk.dll "$HOME"/.86box/discord_game_sdk.dll || exit 1
  ln -s /usr/share/86box/freetype.dll "$HOME"/.86box/freetype.dll || exit 1
  ln -s /usr/share/86box/gsdll32.dll "$HOME"/.86box/gsdll32.dll || exit 1
  ln -s /usr/share/86box/libfluidsynth.dll "$HOME"/.86box/libfluidsynth.dll || exit 1
fi

if [ ! -f "$HOME"/.cemu/wine/drive_c/windows/syswow64/vcruntime140.dll ]; then
  if [ -n "`whereis zenity|grep bin`" ]; then
    zenity --info  --title '86Box' --text 'Installing wine dependencies.\n\nThe process may take a few minutes'
  fi
  winetricks -q vcrun2017
  winetricks settings win7
fi
cd ~/.86box
wine 86Box.exe "$@"
