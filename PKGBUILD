pkgname=mingw-w64-blosc
pkgver=1.16.3
pkgrel=1
pkgdesc="A blocking, shuffling and loss-less compression library. (mingw-w64)"
url="http://blosc.org/"
license=('BSD')
arch=('any')
depends=('mingw-w64-zstd' 'mingw-w64-snappy')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/Blosc/c-blosc/archive/v${pkgver}.tar.gz")
sha256sums=('bec56cb0956725beb93d50478e918aca09f489f1bfe543dbd3087827a7344396')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/c-blosc-${pkgver}"
  
  sed -i 's|#include "win32/pthread.h"|#include <pthread.h>|g' blosc/blosc.c blosc/shuffle.c
  sed -i 's|#include "win32/pthread.c"||g' blosc/blosc.c

  sed -i 's|DESTINATION ${lib_dir}|LIBRARY DESTINATION ${lib_dir} ARCHIVE DESTINATION ${lib_dir} RUNTIME DESTINATION bin|g' blosc/CMakeLists.txt
}

build() {
  cd "$srcdir/c-blosc-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DPREFER_EXTERNAL_LZ4="ON" \
      -DPREFER_EXTERNAL_ZLIB="ON" \
      -DPREFER_EXTERNAL_SNAPPY="ON" \
      -DPREFER_EXTERNAL_ZSTD="ON" \
      -DBUILD_TESTS="OFF" \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/c-blosc-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
