# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=lib32-mpfr
_pkgbasename=mpfr
pkgver=4.0.2
pkgrel=1
pkgdesc='Multiple-precision floating-point library'
arch=(x86_64)
url='https://www.mpfr.org/'
license=(LGPL)
depends=('lib32-gmp')
makedepends=('gcc-multilib')
source=(https://www.mpfr.org/mpfr-$pkgver/mpfr-${pkgver}.tar.xz)
sha256sums=('1d3be708604eae0e42d578ba93b390c2a145f17743a744d8f3f8c2ad5855a38a')

prepare() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
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
    --with-gmp-include=/usr/lib32/gmp \
    --with-gmp-lib=/usr/lib32 \
    --enable-thread-safe --enable-shared
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
  rm -f "${pkgdir}/usr/lib32/"*.py
}
