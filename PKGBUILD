# Maintainer: Simon Legner <Simon.Legner@gmail.com>
# Contributor: bartus <arch-user-repoᘓbartus.33mail.com>
# Contributor: Rafael Fontenelle <rafaelff@gnome.org>
pkgname=odadrawingsexplorer
_pkgname=ODADrawingsExplorer
pkgver=21.7.0.0
pkgrel=1
pkgdesc="Application for the visualization of CAD drawing files (supersedes Teigha Viewer)"
arch=('x86_64')
url="https://www.opendesign.com/guestfiles/oda_drawings_explorer"
license=('custom')
depends=('qt5-base' 'libxfixes' 'libgl' 'libxkbcommon-x11' 'bash' 'hicolor-icon-theme')
replaces=('teighaviewer-qt5')
source=("${pkgname}-x86_64-${pkgver}.deb::https://download.opendesign.com/guestfiles/${_pkgname}/${_pkgname}_QT5_lnxX64_7.2dll.deb")
sha256sums=('0fdbaf35732b4551abd8933e7cc014b82c9c6c6f1d5e214ec1788e03f0c1f3ea')

prepare() {
  rm -rf ${pkgname}-${pkgver}
  mkdir ${pkgname}-${pkgver}
  tar xf data.tar.xz -C ${pkgname}-${pkgver}
}

package() {
  cd ${pkgname}-${pkgver}

  # libs
  for file in $(ls "usr/bin/${_pkgname}_${pkgver}/"); do
    install -Dm755 "usr/bin/${_pkgname}_${pkgver}/${file}" "${pkgdir}/usr/lib/${pkgname}/${file}"
  done

  # binary
  install -Dm755 "usr/bin/$_pkgname" "${pkgdir}/usr/bin/${pkgname}"
  sed -e "s#usr/bin/${_pkgname}_${pkgver}#usr/lib/${pkgname}#" -i "${pkgdir}/usr/bin/${pkgname}"

  # desktop item
  install -Dm644 usr/share/applications/${_pkgname}_${pkgver}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  sed -e "s#/$_pkgname#/${pkgname}#" -i "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # hicolor icons
  for icon in $(find usr/share/icons -type f); do
    install -Dm644 ${icon} "${pkgdir}/${icon}"
  done
}
