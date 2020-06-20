# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=terminalpp-git
pkgver=0.6.0.r131.gdcc11e8
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
  mkdir -p build/release
  cd build/release
  cmake ../.. -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_COMPILER=gcc-8 -DCMAKE_CXX_COMPILER=g++-8 -DPACKAGE_INSTALL=terminalpp
  cmake --build . --target packages
  cmake ../.. -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_COMPILER=gcc-8 -DCMAKE_CXX_COMPILER=g++-8 -DPACKAGE_INSTALL=tpp-ropen
  cmake --build . --target packages
  cmake ../.. -DCMAKE_BUILD_TYPE=release -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_C_COMPILER=gcc-8 -DCMAKE_CXX_COMPILER=g++-8 -DPACKAGE_INSTALL=tpp-bypass
  cmake --build . --target packages
  make
}

package() {
  cd terminalpp/build/release
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/terminalpp/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
# vim:set ts=2 sw=2 et: