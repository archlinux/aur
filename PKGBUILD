# Maintainer: getzze <getzze at gmail dot com>

pkgname=gnome-shell-extension-tophat
_pkgbase=tophat
pkgver=14
pkgrel=2
pkgdesc="View CPU, memory, disk, and network activity in the GNOME top bar (v45 fork)."
arch=(any)
url="https://github.com/fflewddur/tophat"
license=(GPL3)
depends=('dconf' 'gnome-shell>=45' 'libgtop')
makedepends=('git' 'unzip' 'gettext')
provides=(gnome-shell-extension-tophat)
conflicts=(gnome-shell-extension-tophat)
source=($_pkgbase::${url}/releases/download/v${pkgver}/tophat@fflewddur.github.io.v${pkgver}.shell-extension.zip)
sha256sums=('42b8d44bde45452f8aabb31bf20a849e11be5f69a187fc6574c0695d6a07ef97')


package() {
  # Locate the extension.
  cd "$(dirname $(find -name 'metadata.json' -print -quit))"
  _uuid=$(grep -Po '(?<="uuid": ")[^"]*' metadata.json) 
  _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_uuid}"

  # Copy extension files into place.
  find -maxdepth 1 \( -iname '*.js*' -or -iname '*.css' -or -iname '*.ui' -or -iname '*.json' \) -exec install -Dm644 -t "${_destdir}" '{}' +
  find -maxdepth 2 \( -iname '*.svg*' \) -exec install -Dm644 -t "${_destdir}/icons" '{}' +
  find -name '*.xml' -exec install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas/" '{}' +
  cp -r --no-preserve=ownership,mode lib "${_destdir}/lib"

  cd locale
  for locale in */; do
    install -Dm644 -t "${pkgdir}/usr/share/locale/${locale}/LC_MESSAGES" "${locale}/LC_MESSAGES"/*.mo
  done
}
