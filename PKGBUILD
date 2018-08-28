# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=lib32-jemalloc
_pkgbasename=jemalloc
pkgver=5.1.0
pkgrel=1
pkgdesc='General-purpose scalable concurrent malloc implementation (32-bit)'
arch=('x86_64')
url='http://www.canonware.com/jemalloc/'
license=('BSD')
depends=('lib32-glibc' 'lib32-gcc-libs' "${_pkgbasename}")
source=("https://github.com/jemalloc/jemalloc/releases/download/${pkgver}/${_pkgbasename}-${pkgver}.tar.bz2")
sha256sums=('5396e61cc6103ac393136c309fae09e44d74743c86f90e266948c50f3dbb7268')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export LDFLAGS+=' -m32'
  
  ./configure \
    --enable-autogen \
    --prefix=/usr \
    --libdir=/usr/lib32
  make
}

package() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  make DESTDIR="${pkgdir}" install
  chmod 644 "${pkgdir}/usr/lib32/libjemalloc_pic.a"
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
