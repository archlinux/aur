pkgname=mingw-w64-gmp
pkgver=6.2.1
pkgrel=1
pkgdesc="A free library for arbitrary precision arithmetic (mingw-w64)"
arch=(any)
url="http://gmplib.org"
license=("LGPL3")
depends=(mingw-w64-crt)
makedepends=(mingw-w64-configure)
options=(staticlibs !strip !buildflags)
source=(https://gmplib.org/download/gmp/gmp-$pkgver.tar.lz{,.sig})
validpgpkeys=('343C2FF0FBEE5EC2EDBEF399F3599FF828C67298')   # Niels Möller <nisse@lysator.liu.se>
sha256sums=('2c7f4f0d370801b2849c48c9ef3f59553b5f1d3791d070cffb04599f9fc67b41'
            'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/gmp-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --enable-cxx \
      --disable-static
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/gmp-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    rm -r "$pkgdir/usr/${_arch}/share"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a 
  done
}


