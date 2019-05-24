# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=lib32-jemalloc
_pkgbasename=jemalloc
pkgver=5.2.0
pkgrel=2
pkgdesc='General-purpose scalable concurrent malloc implementation (32-bit)'
arch=('x86_64')
url='http://jemalloc.net/'
license=('BSD')
depends=('lib32-glibc' "${_pkgbasename}")
makedepends=('gcc-multilib')
source=("https://github.com/jemalloc/jemalloc/releases/download/${pkgver}/${_pkgbasename}-${pkgver}.tar.bz2")
sha256sums=('74be9f44a60d2a99398e706baa921e4efde82bf8fd16e5c0643c375c5851e3b4')

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
