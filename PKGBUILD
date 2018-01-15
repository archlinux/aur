pkgname=websocketpp-git-dev
_gitname=websocketpp
pkgver=0.7.0.1685.19cad99
pkgrel=1
pkgdesc='C++/Boost Asio based websocket client/server library, Develop branch'
url='http://www.zaphoyd.com/websocketpp/'
arch=('any')
license=('BSD')
optdepends=(
  'openssl: TLS socket component support'
  'asio: alternative asio transport support'
  'boost: non C++11 environments support'
  'boost-libs: non C++11 environments support'
)
makedepends=('git' 'cmake' 'boost' 'boost-libs' 'scons')
provides=('websocketpp')
conflicts=('websocketpp')
source=(${pkgname}::git+https://github.com/zaphoyd/${_gitname}#branch=develop)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|cut -dv -f2|cut -d- -f1)" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${pkgname}
  WSPP_ENABLE_CPP11=1 \
    BOOST_LIBS=/usr/lib \
    BOOST_INCLUDES=/usr/include/boost \
    scons "${MAKEFLAGS}"
  (cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  )
}

check() {
  cd ${pkgname}
  WSPP_ENABLE_CPP11=1 \
    BOOST_LIBS=/usr/lib \
    BOOST_INCLUDES=/usr/include/boost \
    scons test
}

package() {
  cd ${pkgname}
  make -C build DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 readme.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}
