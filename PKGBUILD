# Maintainer: Andrew Sun <adsun701@gmail.com>

_pkgname=fstrm
pkgname=lib32-${_pkgname}
pkgver=0.5.0
pkgrel=1
pkgdesc="A C implementation of the Frame Streams data transport protocol (32-bit)"
arch=('x86_64')
url="https://github.com/farsightsec/fstrm"
license=('Apache')
depends=('lib32-libevent' 'fstrm')
makedepends=('gcc-multilib' 'lib32-gcc-libs')
source=(${_pkgname}-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ca762fb260176f35af639376cc65c3f13a5f63d1cca42eb5ce87caca8d57c450')

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
  make check || true
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
