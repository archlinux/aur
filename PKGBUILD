# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=terminalpp-git
pkgver=0.7.2.r2.ge4d24de
pkgrel=1
pkgdesc='Minimalist, fast, cross-platform terminal emulator'
arch=('x86_64')
url='https://terminalpp.com'
provides=('terminalpp')
license=('MIT')
depends=('libxft' 'hicolor-icon-theme')
makedepends=('gcc8' 'imagemagick' 'cloc' 'git')
source=("terminalpp::git+https://github.com/terminalpp/terminalpp")
sha256sums=('SKIP')

pkgver() {
  cd terminalpp
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd terminalpp
  rm -rf build/release
  mkdir -p build/release
  cd build/release
  cmake ../.. -DCMAKE_BUILD_TYPE=Release -DCMAKE_C_COMPILER=gcc-8 -DCMAKE_CXX_COMPILER=g++-8
  cmake --build .
}

package() {
  cd terminalpp/build/release/
  install -Dm755 terminalpp/terminalpp "${pkgdir}/usr/bin/terminalpp"
  install -Dm644 "${srcdir}"/terminalpp/resources/terminalpp.desktop -t "${pkgdir}/usr/share/applications"
  for i in 64 48 128 256; do
    install -Dm644 "${srcdir}/terminalpp/resources/icons/icon_${i}x${i}.png" \
     "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/terminalpp.png"
  done
  install -Dm644 "${srcdir}/terminalpp/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et: