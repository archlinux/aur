# Maintainer: José Almeida <jose.afga@gmail.com>

pkgname=openrgb-udev-rules
pkgver=1.1
pkgrel=1
pkgdesc="UDEV rules for OpenRGB Flatpak and Appimage."
url="https://openrgb.org"
license=('GPL2')
arch=('any')
install="${pkgname}.install"

# Main package should already have udev rules
conflicts=('openrgb')

_check_version() {
  local detected_ver

  detected_ver=$($1 --version 2>/dev/null | grep -oE '[0-9]+\.[0-9]+(\.[0-9]+)?' | head -n 1)
  [ "$detected_ver" = "$pkgver" ]
}

# https://openrgb.org/udev.html
build() {
  local rules_file="$srcdir/openrgb-$pkgver.rules"

  # Flatpak
  if _check_version "flatpak run org.openrgb.OpenRGB"; then
    flatpak run org.openrgb.OpenRGB --print-udev-rules > "$rules_file"
  # Try AppImage in $PATH
  elif _check_version "OpenRGB.AppImage" >/dev/null 2>&1; then
    OpenRGB.AppImage --print-udev-rules > "$rules_file"
  # Try some openrgb bin in $PATH
  elif _check_version "openrgb"; then
    openrgb --print-udev-rules > "$rules_file"
  else
    echo 'Error: OpenRGB not found or in a different version (Flatpak or $PATH).'
    return 1
  fi
}

package() {
  # install file
  install -Dm644 "$srcdir/openrgb-$pkgver.rules" "$pkgdir/usr/lib/udev/rules.d/60-openrgb.rules"
}
