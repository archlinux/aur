pkgname=mingw-w64-qtkeychain-qt5
pkgver=0.13.2
pkgrel=1
pkgdesc='Provides support for secure credentials storage (mingw-w64)'
arch=(any)
url='https://github.com/frankosterfeld/qtkeychain'
license=(BSD)
arch=('any')
depends=('mingw-w64-qt5-tools')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://github.com/frankosterfeld/qtkeychain/archive/v$pkgver.tar.gz")
sha256sums=('20beeb32de7c4eb0af9039b21e18370faf847ac8697ab3045906076afbc4caa5')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "$srcdir/qtkeychain-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir/qtkeychain-${pkgver}/build-${_arch}"
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
