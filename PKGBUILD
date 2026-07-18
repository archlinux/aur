pkgname=mingw-w64-zlib
pkgver=1.3.2
pkgrel=2
pkgdesc="Compression library implementing the deflate compression method found in gzip and PKZIP (mingw-w64)"
arch=('any')
license=(Zlib)
depends=(mingw-w64-crt)
makedepends=(mingw-w64-cmake)
url="https://www.zlib.net/"
options=(!strip !buildflags staticlibs)
source=(https://github.com/madler/zlib/releases/download/v$pkgver/zlib-$pkgver.tar.xz{,.asc})
sha256sums=('d7a0654783a4da529d1bb793b7ad9c3318020af77667bcae35f95d0e42a792f3' 'SKIP')
validpgpkeys=('5ED46A6721D365587791E2AA783FCD8E58BCAFBA')  # Mark Adler <madler@alumni.caltech.edu>

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd zlib-${pkgver}
  # keep original zlib1.dll runtime name
  echo 'set_target_properties(zlib PROPERTIES RUNTIME_OUTPUT_NAME zlib1 PREFIX "")' >> CMakeLists.txt
}

build() {
  cd zlib-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DZLIB_BUILD_TESTING=OFF -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package () {
  cd zlib-${pkgver}
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --install build-${_arch}
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    ln -vrs "$pkgdir"/usr/${_arch}/lib/libzs.a "$pkgdir"/usr/${_arch}/lib/libz.a
  done
}
