# Maintainer: Butui Hu <hot123tea123@gmail.com>

pkgname=qupath-bin
_pkgname=QuPath
pkgver=0.3.0
pkgrel=1
pkgdesc='Bioimage analysis & digital pathology'
arch=('x86_64')
url='https://qupath.github.io'
license=('GPL3')
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
    "${pkgname}-${pkgver}.tar.xz::https://github.com/qupath/qupath/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_/-}-Linux.tar.xz"
)
sha512sums=('3050814ec431860c93552666af56ceafa6cc6693d71b535df596496992a7b34575e7931306792bd9c1ff14688947b73d941f321504b919bc24be07ba57e8fa50')

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
  cp -a "${srcdir}/${_pkgname}" "${pkgdir}/opt/${_pkgname}"
  find "${pkgdir}/opt/${_pkgname}" -type f -name "*.png" -exec cp -vf {} "${pkgdir}/usr/share/pixmaps/${_pkgname}.png" \;
  ln -s "/opt/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/qupath"
  chmod 0755 "${pkgdir}/opt/QuPath/bin/QuPath" "${pkgdir}/opt/QuPath/bin/QuPath.sh"
  find "${pkgdir}/opt/${_pkgname}" -name "*.so*" -exec chmod 0755 {} \;
  # find "${pkgdir}/opt/${_pkgname}" -name "*.so.*" -exec chmod 0755 {} \;
  install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
}
# vim:set ts=2 sw=2 et:

