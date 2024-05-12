# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=qupath-bin
_pkgname=QuPath
pkgver=0.5.1
pkgrel=1
pkgdesc='Bioimage analysis & digital pathology'
arch=('x86_64')
url='https://qupath.github.io'
license=('GPL-3.0-or-later')
depends=(
  glib2
  libxml2
  sqlite
)
makedepends=('gendesk')
optdepends=(
  'ttf-droid: font for CJK characters'
)
provides=(qupath=${pkgver})
conflicts=(qupath)
source=(
    "${pkgname}-${pkgver}.tar.xz::https://github.com/qupath/qupath/releases/download/v${pkgver//_/-}/${_pkgname}-v${pkgver//_/-}-Linux.tar.xz"
)
sha512sums=('4c274f2c3362751b6bdad1ad92b2dd8c3469c4deb038332a679742c55eba269831168a0c3d8a627d751a8fc340a7553979494ab839f15f146dc633a756e62025')

prepare() {
  echo "Creating desktop file"
  gendesk -f -n --pkgname ${_pkgname} \
    --pkgdesc "${pkgdesc}" \
    --categories "Graphics;MedicalSoftware;Science;" \
    --icon "${_pkgname}" \
    --exec "qupath"
}
package() {
  install -d "${pkgdir}/opt" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/pixmaps"
  cp -a "${srcdir}/${_pkgname}-v${pkgver}-Linux/${_pkgname}" "${pkgdir}/opt/${_pkgname}"
  find "${pkgdir}/opt/${_pkgname}" -type f -name "*.png" -exec cp -vf {} "${pkgdir}/usr/share/pixmaps/${_pkgname}.png" \;
  ln -s "/opt/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/qupath"
  find "${pkgdir}/opt/${_pkgname}" -name "*.so*" -exec chmod 0755 {} \;
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
# vim:set ts=2 sw=2 et:
