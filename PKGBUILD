# Maintainer: Caltlgin Stsodaat <contact@fossdaily.xyz>

pkgname='qvge'
pkgver=0.6.2
pkgrel=1
pkgdesc='Qt Visual Graph Editor'
arch=('x86_64')
url='https://github.com/ArsMasiuk/qvge'
license=('MIT')
depends=('hicolor-icon-theme' 'qt5-svg' 'qt5-x11extras')
makedepends=('imagemagick' 'setconf')
optdepends=('graphviz: auto-layout of graphs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('e68b7eab74dc978838b35fdb0d1e65b042e66decbfe3dee58c944142f18d758e')

build() {
  cd "${pkgname}-${pkgver}/src"
  qmake-qt5 -r
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${pkgname}"

  for i in 16 22 24 32 48 64 96 128 256; do
    convert 'icon.png' -resize "${i}x${i}" "${srcdir}/icon${i}.png"
    install -Dvm644 "${srcdir}/icon${i}.png" "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${pkgname}.png"
  done

  install -Dvm755 "src/bin/${pkgname}app" -t "${pkgdir}/usr/bin"

  cd "src/${pkgname}app/linux"
  setconf -u "${pkgname}.desktop" 'Icon' "${pkgname}"
  install -Dvm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dvm644 "${pkgname}.appdata.xml" -t "${pkgdir}/usr/share/metainfo"
  install -Dvm644 'application-xgr.xml' -t "${pkgdir}/usr/share/mime/application"
}

# vim: ts=2 sw=2 et:
