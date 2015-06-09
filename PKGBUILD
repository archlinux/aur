pkgname=mingw-w64-nettle
pkgver=2.7.1
pkgrel=5
pkgdesc="A low-level cryptographic library (mingw-w64)"
arch=(any)
url="http://www.lysator.liu.se/~nisse/nettle"
license=("LGPL")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt mingw-w64-gmp mingw-w64-openssl)
options=(staticlibs !strip !buildflags)
source=("http://www.lysator.liu.se/~nisse/archive/nettle-$pkgver.tar.gz"
        "nettle-2.7.1-remove-ecc-testsuite.patch"
        "nettle-2.7.1-tmpalloc.patch")
md5sums=('003d5147911317931dd453520eb234a5'
         'f3b10a962dae1dbff215adc26a522625'
         'f40dd21708f3b885d948dd573012b39a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/nettle-$pkgver"
  sed 's/ecc-192.c//g' -i Makefile.in
  sed 's/ecc-224.c//g' -i Makefile.in
  patch -p1 -i ../nettle-2.7.1-remove-ecc-testsuite.patch
  patch -p1 -i ../nettle-2.7.1-tmpalloc.patch
}

build() {
  cd "$srcdir/nettle-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/nettle-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    rm -r "$pkgdir/usr/${_arch}/share"
  done
}
