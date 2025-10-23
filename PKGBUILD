# Maintainer: getzze <getzze at gmail dot com>

pkgname=gnome-shell-extension-tophat
_pkgbase=tophat
pkgver=23
pkgrel=2
pkgdesc="View CPU, memory, disk, and network activity in the GNOME top bar (v45 fork)."
arch=(any)
url="https://github.com/fflewddur/tophat"
license=(GPL3)
depends=('gnome-shell>=45')
#makedepends=('git' 'unzip' 'gettext')
source=($_pkgbase::${url}/releases/download/v${pkgver}/tophat@fflewddur.github.io.v${pkgver}.shell-extension.zip)
sha256sums=('57433cf369f980067c8977907606f6174c8a2357cd86152901866254572b5e1f')


package() {
  # Locate the extension.
  cd "$(dirname $(find -name 'metadata.json' -print -quit))"
  _uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json) 
  _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  # Copy extension files into place.
  find -maxdepth 1 \( -iname '*.js*' -or -iname '*.css' -or -iname '*.ui' -or -iname '*.json' \) -exec install -Dm644 -t "${_destdir}" '{}' +
  find -maxdepth 2 \( -iname '*.svg*' \) -exec install -Dm644 -t "${_destdir}/icons" '{}' +
  find -name '*.xml' -exec install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" '{}' +

  cd locale
  for locale in */; do
    install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
  done
}
