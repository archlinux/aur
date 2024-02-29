pkgname=mingw-w64-verdict
pkgver=1.4.2
pkgrel=1
pkgdesc="Compute quality functions of 2 and 3-dimensional regions (mingw-w64)"
arch=('any')
url="https://github.com/sandialabs/verdict"
license=('BSD')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-cmake')
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/sandialabs/verdict/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('225c8c5318f4b02e7215cefa61b5dc3f99e05147ad3fefe6ee5a3ee5b828964b')

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
    rm -r "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
