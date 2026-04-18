pkgname=mingw-w64-minizip
pkgver=1.3.2
pkgrel=1
pkgdesc='Mini zip and unzip based on zlib (mingw-w64)'
url='https://www.zlib.net/'
license=(Zlib)
arch=('any')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
depends=('mingw-w64-zlib')
source=(https://github.com/madler/zlib/releases/download/v$pkgver/zlib-$pkgver.tar.xz{,.asc})
sha256sums=('d7a0654783a4da529d1bb793b7ad9c3318020af77667bcae35f95d0e42a792f3' 'SKIP')
validpgpkeys=('5ED46A6721D365587791E2AA783FCD8E58BCAFBA')  # Mark Adler <madler@alumni.caltech.edu>

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"


prepare() {
  cd "$srcdir"/zlib-${pkgver}/contrib/minizip
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
    # https://github.com/madler/zlib/pull/229
    rm "$pkgdir/usr/${_arch}/include/minizip/crypt.h"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
