# Maintainer: Andrew Sun <adsun701@gmail.com>

_pkgname=fstrm
pkgname=lib32-${_pkgname}
pkgver=0.4.0
pkgrel=1
pkgdesc="A C implementation of the Frame Streams data transport protocol (32-bit)"
arch=('x86_64')
url="https://github.com/farsightsec/fstrm"
license=('Apache')
depends=('lib32-libevent')
makedepends=('lib32-gcc-libs')
source=(${_pkgname}-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('2c84ff059d5850078d3d85927fd2e8f8a1cbe76bcf91cb125cfbbbd89ec5afc0')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  autoreconf -fiv
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgname}-${pkgver}"
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32
  make
}

check() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make -k check
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
