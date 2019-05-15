# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>

pkgname=gnome-shell-extension-vitals-git
pkgver=34.r204.gdb5b288
pkgrel=1
pkgdesc="Displays system vitals in a GNOME Shell top bar pop-down."
arch=('any')
url="https://github.com/corecoding/Vitals"
license=('GPL')
depends=('dconf' 'gnome-icon-theme' 'gnome-shell' 'libgtop' 'lm_sensors')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+${url}")
sha512sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^EGO.//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  # Locate the extension.
  cd "$(dirname $(find -name 'metadata.json' -print -quit))"
  _extname=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)
  _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"
  # Copy extension files into place.
  find -maxdepth 1 \( -iname '*.js*' -or -iname '*.css' -or -iname '*.ui' \) -exec install -Dm644 -t "${_destdir}" '{}' +
  find -maxdepth 2 \( -iname '*.svg*' \) -exec install -Dm644 -t "${_destdir}/icons" '{}' +
  find -name '*.xml' -exec install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" '{}' +
  cp -r --no-preserve=ownership,mode helpers "${_destdir}"
  install -Dm644 schemas/gschemas.compiled "${_destdir}/schemas/gschemas.compiled"
  install -Dm644 schemas/prefs.ui "${_destdir}/schemas/prefs.ui"
  cd locale
  for locale in */
    do
      install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
    done
}
