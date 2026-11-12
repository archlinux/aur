pkgname=mingw-w64-minizip
pkgver=1.4
pkgrel=1
pkgdesc='Mini zip and unzip based on zlib (mingw-w64)'
url='https://www.zlib.net/'
license=(Zlib)
arch=('any')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
depends=('mingw-w64-zlib')
source=(https://github.com/madler/zlib/releases/download/v$pkgver/zlib-$pkgver.tar.xz{,.asc})
sha256sums=('4f11c512053d7bab8d9e9b89bde3575add3e4c50a383b42ef6cb837035fc5a7c'
            'SKIP')
validpgpkeys=('5ED46A6721D365587791E2AA783FCD8E58BCAFBA')  # Mark Adler <madler@alumni.caltech.edu>

_architectures=${MINGW_W64_ARCHS:-x86_64-w64-mingw32}


prepare() {
  cd "$srcdir"/zlib-${pkgver}/contrib/minizip
  # keep original libminizip-1.dll runtime name
  echo 'set_target_properties(libminizip PROPERTIES RUNTIME_OUTPUT_NAME minizip-1)' >> CMakeLists.txt
}


build() {
  cd zlib-${pkgver}/contrib/minizip
  for _arch in ${_architectures}; do
    ${_arch}-cmake -DMINIZIP_BUILD_TESTING=OFF -DCMAKE_INSTALL_INCLUDEDIR=include/minizip -B build-${_arch} .
    cmake --build build-${_arch}
  done
}

package () {
  cd zlib-${pkgver}/contrib/minizip
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --install build-${_arch}
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
