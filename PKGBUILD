# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=lib32-libcap-ng
_pkgbasename=libcap-ng
pkgver=0.7.10
pkgrel=1
pkgdesc='Library making programming with POSIX capabilities easier than traditional libcap (32-bit)'
url='https://people.redhat.com/sgrubb/libcap-ng/'
arch=('x86_64')
license=('LGPL2.1')
depends=('lib32-glibc' 'libcap-ng')
makedepends=('gcc-multilib')
source=(${_pkgbasename}-${pkgver}.tar.gz::https://github.com/stevegrubb/libcap-ng/archive/v${pkgver}.tar.gz)
sha512sums=('371dc1c1f6e2999ef4b4173e12338e9a794e9f48bd5ce8fb4d0c05884cff277ecf24f51e4b300487f9b5f52d93de7eeb1542ebb49c82226d06dd44fa76092367')

prepare() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  autoreconf -fiv
}

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export LDFLAGS+=' -m32'
  ./configure \
    --prefix=/usr \
    --libdir=/usr/lib32 \
    --enable-static=no \
    --without-python \
    --without-python3
  make
}

check() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make check
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
