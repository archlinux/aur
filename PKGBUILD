pkgname=mingw-w64-libcuba
pkgver=4.2.2
pkgrel=1
pkgdesc='A library for multidimensional numerical integration (mingw-w64)'
arch=('any')
url="https://feynarts.de/cuba/"
license=(LGPL-3.0-or-later)
makedepends=('mingw-w64-configure')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://feynarts.de/cuba/Cuba-$pkgver.tar.gz")
sha256sums=('8d9f532fd2b9561da2272c156ef7be5f3960953e4519c638759f1b52fe03ed52')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "$srcdir/Cuba-$pkgver"
  sed -i "/MasterExit/d" src/common/Fork.c

  # gcc 15: false' is a keyword with '-std=c23' onwards
  sed -i "/typedef enum/d" src/common/stddecl.h
  sed -i "27i#include <stdbool.h>" src/common/stddecl.h
}

build() {
  cd "$srcdir/Cuba-$pkgver"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    cp ../cuba.h .
    ${_arch}-configure ..
    make -j1
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/Cuba-$pkgver/build-${_arch}
    make DESTDIR="$pkgdir" install -j1
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
