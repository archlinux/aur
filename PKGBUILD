# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: Dave Kleinschmidt <dave.f.kleinschmidt at gmail dot com>
# Contributor: Frikilinux <frikilinux at gmail dot com>
# Contributor: Surefire <surefire at cryptomile.net>

pkgname=gnome-shell-extension-appindicator-git
pkgver=21+2+g7863517
pkgrel=1
epoch=1
pkgdesc="Integrates AppIndicators into GNOME Shell."
arch=('any')
url="https://github.com/ubuntu/gnome-shell-extension-appindicator"
license=('GPL')
makedepends=('git')
depends=('gnome-shell')
optdepends=(
  'libappindicator-gtk2: support GTK+2 applications'
  'libappindicator-gtk3: support GTK+3 applications'
  'libappindicator-sharp: support .net applications'
)
source=(
  "${pkgname}::git+https://github.com/ubuntu/gnome-shell-extension-appindicator.git"
  '6091a31f4cb8732252279e802c8ec9f1c3891b38.patch'
)
sha512sums=('SKIP'
            'fb3375e505b030b9264cf5636468c20248cdfc967746b1f8b284b9769a678ffbad9f5e52b5481961d4dc142517c5b709a500781f50763d15d882f66ac4c9f7b8')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd "${pkgname}"
  patch -Np1 -i "${srcdir}/6091a31f4cb8732252279e802c8ec9f1c3891b38.patch"
}

package() {
  cd "${pkgname}"
  # Locate the extension.
  local _extname="$(grep -Po '(?<="uuid": ")[^"]*' metadata.json)"
  local _destdir="${pkgdir}/usr/share/gnome-shell/extensions/${_extname}"

  # Copy extension files into place.
  install -Dm644 -t "${_destdir}"                          ./*.js metadata.json
  install -Dm644 -t "${_destdir}/interfaces-xml"           ./interfaces-xml/*.xml
  install -Dm644 -t "${pkgdir}/usr/share/glib-2.0/schemas" ./interfaces-xml/*.xml
}
