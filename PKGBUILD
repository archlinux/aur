pkgname=mingw-w64-verdict
pkgver=1.4.1
pkgrel=1
pkgdesc="Compute quality functions of 2 and 3-dimensional regions (mingw-w64)"
arch=('any')
url="https://github.com/sandialabs/verdict"
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/sandialabs/verdict/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('26fa583265cb2ced2e9b30ed26260f6c9f89c3296221d96ccd5e7bfeec219de7')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd $srcdir/verdict-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DVERDICT_ENABLE_TESTING=OFF ..
    make
    popd
  done
}

package ()
{
  for _arch in ${_architectures}; do
    cd "$srcdir/verdict-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
