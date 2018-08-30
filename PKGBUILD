# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=mingw-w64-ucl
_pkgname=ucl
pkgver=1.03
pkgrel=1
pkgdesc="Portable lossless data compression library written in ANSI C (mingw-w64)"
arch=('any')
url="https://www.oberhumer.com/opensource/ucl/"
license=('GPL')
makedepends=('mingw-w64-configure')
depends=('mingw-w64-crt')
options=('!strip' '!buildflags' 'staticlibs')
source=("https://www.oberhumer.com/opensource/${_pkgname}/download/${_pkgname}-${pkgver}.tar.gz"
        "ucl-1.03-autoconf-compat.patch"
        "ucl-1.03-missing-macros.patch"
        "ucl-1.03-no-undefined.patch")
sha256sums=('b865299ffd45d73412293369c9754b07637680e5c826915f097577cd27350348'
            '0cbd00a8383c098f98d5b022fcb4fa8d1448501e00221a223be04be0383bafc0'
            'ed5425536d98e2097488001e6e73d2ed93da65050a6fded62435bec077bc594b'
            '56a110aedab800c0a06cf4fd4dcef8f78691a0d091e2f143a2a8f02cfbb4c172')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  
  rm -f acinclude.m4
  rm -f m4/local.m4
  
  patch -Np1 -i "${srcdir}/ucl-1.03-autoconf-compat.patch"
  patch -Np1 -i "${srcdir}/ucl-1.03-missing-macros.patch"
  patch -Np1 -i "${srcdir}/ucl-1.03-no-undefined.patch"
  
  touch ChangeLog
  WANT_AUTOMAKE=latest autoreconf -fiv
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  CFLAGS+=" -std=gnu90 -fPIC"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/${_pkgname}-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
