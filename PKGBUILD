# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: Alexandre Moine < nobrakal at moine dot org >
# Contributor: Tasos Latsas < tlatsas2000 at gmail dot com >
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: arjan <arjan@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Dany Martineau <dany.luc.martineau at gmail.com}

pkgname=tuxmath
pkgver=2.0.3
pkgrel=6
pkgdesc="An educational math tutorial game starring Tux, the Linux Penguin"
arch=("i686" "x86_64")
url="https://github.com/tux4kids/${pkgname}/"
license=("custom:OFL" "GPL")
depends=("t4kcommon")
options=(!docs)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/tux4kids/${pkgname}/archive/upstream/${pkgver}.tar.gz"
  "0001-src-menu_lan.c-Remove-unused-duplicate-lan_player_in.patch"
  "0002-rename-blits-to-tmblits.patch"
)
sha256sums=(
  "ab91bd6df17eb9377e5608701030bd32110a3588933bf0e4c26b5697fb2a4698"
  "852f82370e323ea34825864c063bd44a5dbd6dd60fb2c52338edbeb0b70fbafe"
  "b5ede8e1a870cd19010890d8ca1867c8eae86c9dc3b78712c44e5e7576c05b91"
)

prepare() {
  cd "${srcdir}/${pkgname}-upstream-${pkgver}"

  patch -Np1 -i "${srcdir}/0001-src-menu_lan.c-Remove-unused-duplicate-lan_player_in.patch"
  patch -Np1 -i "${srcdir}/0002-rename-blits-to-tmblits.patch"
}

build() {
  cd "${srcdir}/${pkgname}-upstream-${pkgver}"

  ./configure \
    --prefix=/usr \
    --localstatedir=/usr/share/games \
    --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${pkgname}-upstream-${pkgver}"

  make DESTDIR="${pkgdir}" install

  # install .desktop file and icons
  install -dm755 "${pkgdir}/usr/share/"{applications,pixmaps}
  install -Dm644 "${srcdir}/${pkgname}-upstream-${pkgver}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/${pkgname}-upstream-${pkgver}/data/images/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"

  # Install doc
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}-upstream-${pkgver}/doc/README" "${pkgdir}/usr/share/doc/${pkgname}/README"

  # install licenses
  install -Dm644 "${srcdir}/${pkgname}-upstream-${pkgver}/doc/OFL" "${pkgdir}/usr/share/licenses/${pkgname}/OFL"
  install -Dm644 "${srcdir}/${pkgname}-upstream-${pkgver}/doc/README_DATA_LICENSES" "${pkgdir}/usr/share/licenses/${pkgname}/DATA_LICENSES"
}
