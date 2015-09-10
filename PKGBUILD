# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Kuba Serafinowski <zizzfizzix(at)gmail(dot)com>
# Contributor: Daichi Shinozaki <dsdseg@gmail.com>
# Contributor: skydrome <skydrome@i2pmail.org>
# Contributor: MTsoul

pkgname=websocketpp
pkgver=0.6.0
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
makedepends=('cmake' 'boost' 'boost-libs' 'scons')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/zaphoyd/${pkgname}/archive/${pkgver}.tar.gz)
sha512sums=('55dbb8d1666ae0d35d4b46ec2c375c9d3d66f57a473f526175a63bc147279c12bd8e605e5812a68ef45d8b6f51f4cfd6e61a1b971d223b5dc6e5528a6937fef8')

build() {
  cd ${pkgname}-${pkgver}
  WSPP_ENABLE_CPP11=1 \
    BOOST_LIBS=/usr/lib \
    BOOST_INCLUDES=/usr/include/boost \
    scons "${MAKEFLAGS}"
  (cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  )
}

check() {
  cd ${pkgname}-${pkgver}
  WSPP_ENABLE_CPP11=1 \
    BOOST_LIBS=/usr/lib \
    BOOST_INCLUDES=/usr/include/boost \
    scons test
}

package() {
  cd ${pkgname}-${pkgver}
  make -C build DESTDIR="${pkgdir}" install
  install -Dm 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 readme.md "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:
