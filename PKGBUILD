# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=terminalpp
pkgver=0.8.0
pkgrel=1
pkgdesc='Minimalist, fast, cross-platform terminal emulator'
arch=('x86_64')
url='https://terminalpp.com'
license=('MIT')
depends=('libxft' 'hicolor-icon-theme' 'gcc-libs')
makedepends=('gcc8' 'imagemagick' 'cloc' 'cmake' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/terminalpp/terminalpp/archive/v${pkgver}.tar.gz")
sha256sums=('f3153676f17404589c0299a726b7f36de2a8183b4e497d02133a0e547b72fd56')

prepare() {
  cd "${pkgname}-${pkgver}"
  sed -i "4s|.*|Icon=terminalpp.png|" resources/terminalpp.desktop
  sed -i "9s|.*|Comment=$pkgdesc|" resources/terminalpp.desktop
}

build() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build/release
  cd build/release
  cmake ../.. -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=gcc-8 -DCMAKE_CXX_COMPILER=g++-8
  cmake --build .
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/build/release/terminalpp/terminalpp" "${pkgdir}/usr/bin/terminalpp"
  for i in 32 48 64 128 256 512; do
    install -Dm644 resources/icons/icon_${i}x${i}.png "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/terminalpp.png"
  done
  install -Dm644 resources/icons/icon_256x256.png "${pkgdir}/usr/share/pixmaps/terminalpp.png"
  gendesk -f -n --pkgname "${pkgname}" \
          --pkgdesc "$pkgdesc" \
          --name "Terminal++" \
          --comment "$pkgdesc" \
          --exec "${pkgname}" \
          --categories 'System;TerminalEmulator' \
          --icon "${pkgname}"
  install -Dm644 terminalpp.desktop -t "${pkgdir}/usr/share/applications/"
}
# vim:set ts=2 sw=2 et:
