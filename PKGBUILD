# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=noter
pkgver=0.3.alpha
_pkgver=0.3-alpha
pkgrel=1
pkgdesc="Simple Serial Port Terminal. It allows communication with serial ports, and some hex to text and text to hex utilities"
arch=('x86_64')
url='https://github.com/doquen/noter'
license=('MIT')
depends=('qt5-serialport'
         'libssh'
         'qt5-declarative')
makedepends=('qt5-base' 'imagemagick' 'gendesk')
source=("${pkgname}-${_pkgver}.tar.gz::https://github.com/doquen/noter/archive/v${_pkgver}.tar.gz")
sha256sums=('11cc88563e414dd1724be8f6ad133b0986ed0a5caf2b5d277ef79a32654091e6')

build() {
  cd "${pkgname}-${_pkgver}"
  rm -rf build
  mkdir -p build
  cd build
  qmake PREFIX=/usr ..
  make
}

package() {
  cd "${pkgname}-${_pkgver}/build"
  install -Dm755 NoTer "${pkgdir}/usr/bin/noter"
  install -Dm644 ../LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  convert -verbose ../NoTer.ico noter.png
  install -Dm644 noter.png "${pkgdir}/usr/share/pixmaps/noter.png"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "Noter" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'Utility;Application;' \
          --icon "${pkgname}"
  install -Dm644 "${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}