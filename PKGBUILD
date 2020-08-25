# Maintainer: Andrew Sun <adsun701 at gmail dot com>

pkgname=lib32-libcap-ng
_pkgbasename=libcap-ng
pkgver=0.7.11
pkgrel=1
pkgdesc='Library making programming with POSIX capabilities easier than traditional libcap (32-bit)'
url='https://people.redhat.com/sgrubb/libcap-ng/'
arch=('x86_64')
license=('LGPL2.1')
depends=('lib32-glibc' 'libcap-ng')
makedepends=('gcc-multilib')
source=(https://github.com/stevegrubb/libcap-ng/archive/v${pkgver}/${_pkgbasename}-${pkgver}.tar.gz)
sha512sums=('ad2f07df90b730831fda87f2f8ad889602ac627d63dbdb5db8a39af6ad65a0b3e08eb37ea99cf5604a16f0b526ae3f847e03493663f66178590a8c6dfadae4eb')

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
