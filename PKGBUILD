pkgname=mingw-w64-lzo
pkgver=2.09
pkgrel=1
pkgdesc="Portable lossless data compression library (mingw-w64)"
arch=(any)
url="http://www.oberhumer.com/opensource/lzo/"
license=("GPL")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-crt)
options=(staticlibs !strip !buildflags)
source=("http://www.oberhumer.com/opensource/lzo/download/lzo-${pkgver}.tar.gz")
md5sums=('c7ffc9a103afe2d1bba0b015e7aa887f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/lzo-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
		${_arch}-configure \
			--target=${_arch}
		make
    #${_arch}-gcc -shared src/*.o -o src/liblzo2-0.dll -Xlinker --out-implib -Xlinker src/liblzo2.dll.a
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/lzo-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    #install -Dm644 src/liblzo2-0.dll "${pkgdir}"/usr/${_arch}/bin/liblzo2-0.dll
    #install -m644 src/liblzo2.dll.a "${pkgdir}"/usr/${_arch}/lib/liblzo2.dll.a
    rm -r "$pkgdir/usr/${_arch}/share"
    find "$pkgdir/usr/${_arch}" -name '*.dll' -exec ${_arch}-strip --strip-unneeded {} \;
    find "$pkgdir/usr/${_arch}" -name '*.a' -o -name '*.dll' | xargs ${_arch}-strip -g
  done
}
