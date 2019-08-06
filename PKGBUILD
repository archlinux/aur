# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=lib32-jemalloc
_pkgbasename=jemalloc
pkgver=5.2.1
pkgrel=1
pkgdesc='General-purpose scalable concurrent malloc implementation (32-bit)'
arch=('x86_64')
url='http://jemalloc.net/'
license=('BSD')
depends=('lib32-gcc-libs' "${_pkgbasename}")
makedepends=('gcc-multilib')
source=("https://github.com/jemalloc/jemalloc/releases/download/${pkgver}/${_pkgbasename}-${pkgver}.tar.bz2")
sha256sums=('34330e5ce276099e2e8950d9335db5a875689a4c6a56751ef3b1d8c537f887f6')

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
