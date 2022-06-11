# Maintainer: Dominik Adrian Grzywak <starterx4 at gmail dot com>
# Contributor: Andrew Sun <adsun701@gmail.com>

pkgname=lib32-jemalloc
_pkgbasename=jemalloc
pkgver=5.3.0
pkgrel=1
pkgdesc='General-purpose scalable concurrent malloc implementation (32-bit)'
arch=('x86_64')
url='http://jemalloc.net/'
license=('BSD')
depends=('lib32-glibc')
makedepends=('clang' 'lib32-clang')
options=('!lto')
provides=('libjemalloc.so')
optdepends=("${_pkgbasename}")
source=("https://github.com/jemalloc/jemalloc/releases/download/${pkgver}/${_pkgbasename}-${pkgver}.tar.bz2")
sha256sums=('2db82d1e7119df3e71b7640219b6dfe84789bc0537983c3b7ac4f7189aecfeaa')

build() {
  cd "${srcdir}/${_pkgbasename}-${pkgver}"
  
  # FS#71745: GCC-built jemalloc causes telegram-desktop to crash a lot. The reason is still not clear.
  export CC='clang -m32'
  export CXX='clang++ -m32'
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
