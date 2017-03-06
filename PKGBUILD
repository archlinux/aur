pkgname=mingw-w64-lzo
pkgver=2.10
pkgrel=1
pkgdesc="Portable lossless data compression library (mingw-w64)"
arch=(any)
url="http://www.oberhumer.com/opensource/lzo"
license=("GPL")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt)
options=(staticlibs !strip !buildflags)
source=("http://www.oberhumer.com/opensource/lzo/download/lzo-${pkgver}.tar.gz")
sha1sums=('4924676a9bae5db58ef129dc1cebce3baa3c4b5d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/lzo-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
		${_arch}-configure \
			--target=${_arch}
		make
		${_arch}-gcc $CFLAGS -fpic -I../include/lzo -o minilzo/minilzo.o -c ../minilzo/minilzo.c
		${_arch}-ar rcs libminilzo.a minilzo/minilzo.o
		${_arch}-gcc -shared -o libminilzo-0.dll -Wl,--out-implib,libminilzo.dll.a minilzo/minilzo.o
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/lzo-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    install -m644 libminilzo-0.dll "$pkgdir/usr/${_arch}/bin"
    install -m644 libminilzo.dll.a "$pkgdir/usr/${_arch}/lib"
    install -m644 libminilzo.a "$pkgdir/usr/${_arch}/lib"
    install -p -m644 ../minilzo/minilzo.h "$pkgdir/usr/${_arch}/include/lzo"
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
