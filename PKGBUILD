# Contributor: Andrew Sun <adsun701@gmail.com>

pkgname=lib32-mpfr
_pkgbasename=mpfr
_pkgver=4.1.0
_patchver=13
pkgrel=1
pkgver=${_pkgver}.p${_patchver}
pkgdesc='Multiple-precision floating-point library'
arch=(x86_64)
url='https://www.mpfr.org/'
license=(LGPL)
depends=('lib32-gmp')
makedepends=('autoconf-archive' 'gcc-multilib')
source=(
    "https://www.mpfr.org/mpfr-$_pkgver/mpfr-$_pkgver.tar.xz"
    patches.diff
)
sha256sums=(
    '0c98a3f1732ff6ca4ea690552079da9c597872d30e96ec28414ee23c95558a7f'
    '75af77904037442fcd3061a4fee2394194716c542e96989dcfac2445c842daf1'
)

prepare() {
  cd "${srcdir}/${_pkgbasename}-${_pkgver}"

  patch -p1 < "$srcdir"/patches.diff
  autoreconf -fiv
}

build() {
  cd "${srcdir}/${_pkgbasename}-${_pkgver}"
  
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
  cd "${srcdir}/${_pkgbasename}-${_pkgver}"
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
  rm -f "${pkgdir}/usr/lib32/"*.py
}
