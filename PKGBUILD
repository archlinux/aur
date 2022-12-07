pkgname=mingw-w64-primesieve
pkgver=11.0
pkgrel=1
pkgdesc="Fast prime number generator (mingw-w64)"
url="https://github.com/kimwalisch/primesieve"
license=(BSD)
arch=('any')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/kimwalisch/primesieve/archive/v$pkgver.tar.gz")
sha256sums=('b29a7ec855764ce7474d00be03e1d83209bd097faa3778382dfb73a06866097e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/primesieve-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DWITH_MULTIARCH=OFF ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/primesieve-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    rm -r "$pkgdir"/usr/${_arch}/share
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
