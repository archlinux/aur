# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=websocketpp-git
_gitname=websocketpp
pkgver=0.8.2.1709.1b11fd3
pkgrel=1
pkgdesc='C++/Boost Asio based websocket client/server library'
url='http://www.zaphoyd.com/websocketpp/'
arch=('any')
license=('BSD')
optdepends=(
  'openssl: TLS socket component support'
  'asio: alternative asio transport support'
  'boost: non C++11 environments support'
  'boost-libs: non C++11 environments support'
)
makedepends=('git' 'cmake' 'boost' 'boost-libs')
provides=('websocketpp')
conflicts=('websocketpp')
source=(${pkgname}::git+https://github.com/zaphoyd/${_gitname})
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|cut -dv -f2|cut -d- -f1)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  sed 's|"${WEBSOCKETPP_BOOST_LIBS}"|${WEBSOCKETPP_BOOST_LIBS}|g' -i CMakeLists.txt
}

build() {
  cd ${pkgname}
  cmake \
    -B build \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DENABLE_CPP11=ON \
    -DBUILD_TESTS=ON
  make -C build
}

check() {
  cd ${pkgname}
  make -C build test
}

package() {
  cd ${pkgname}
  make -C build DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 readme.md -T "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
