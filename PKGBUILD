# Maintainer: Alex S. shantanna_at_hotmail_dot_com>

pkgname=display-mode-switcher
_pkgname=dispswitch
pkgver=0.1
pkgrel=1
pkgdesc="The simple application to switch the display with one click between single and dual mode"
arch=('any')
url="http://aur.archlinux.org/packages/display-mode-switcher/"
license=('BSD')
depends=('gnome-shell')

package() {
  msg2 "Creating launcher..."
  cd "${srcdir}" || exit
  cat > "${srcdir}/Display mode switcher.desktop" << EOF
#!/usr/bin/env xdg-open
[Desktop Entry]
Type=Application
Name=Display mode switcher
Comment=The simple program to switch the display with one klick betwin single and dual mode
Exec=/usr/bin/${_pkgname}
Icon=preferences-desktop-display
Terminal=false
Categories=GNOME;GTK;Settings;HardwareSettings;
EOF
  install -Dm644 Display\ mode\ switcher.desktop "${pkgdir}/usr/share/applications/Display mode switcher.desktop"

  msg2 "Creating application..."
  cat > "${srcdir}/${_pkgname}" << 'EOF'
#!/bin/sh

prim_disp=$(xrandr | grep '\<connected primary\>' | awk 'NR==1 { print $1 }')
sec_disp=$(xrandr | grep '\<connected\>' | sed '/primary/d' | awk 'NR==1 { print $1 }')

if [ ! "$sec_disp" ]; then
  notify-send "No additional display(s) connected"
else
  case $@ in
  -on|-ON)
    xrandr --output $sec_disp --right-of $prim_disp --auto
    notify-send "Multi-display mode is ON"
    ;;
  -off|-OFF)
    xrandr --output $sec_disp --off
    notify-send "Multi-display mode is OFF"
    ;;
  *)
    if [ "$#" -eq "0" ] && [ ! "`xrandr | grep -E "$sec_disp connected [[:digit:]]"`" ]; then
      xrandr --output $sec_disp --right-of $prim_disp --auto
      notify-send "Multi-display mode is ON"
    elif [ "$#" -eq "0" ] && [ "`xrandr | grep -E "$sec_disp connected [[:digit:]]"`" ]; then
      xrandr --output $sec_disp --off
      notify-send "Multi-display mode is OFF"
    fi
    ;;
  esac
fi
exit 0
EOF
  install -Dm755 ${_pkgname} "${pkgdir}/usr/bin/${_pkgname}"
  chmod +x "${pkgdir}/usr/bin/${_pkgname}"
}
