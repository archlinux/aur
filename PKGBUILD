pkgname=mingw-w64-sdl_net
pkgver=1.2.8
pkgrel=6
pkgdesc="A small sample cross-platform networking library (mingw-w64)"
arch=(x86_64)
url="https://www.libsdl.org/projects/SDL_net/"
license=(custom)
depends=('mingw-w64-sdl')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!strip' '!buildflags')
source=(https://www.libsdl.org/projects/SDL_net/release/SDL_net-$pkgver.tar.gz)
sha256sums=('5f4a7a8bb884f793c278ac3f3713be41980c5eedccecff0260411347714facb4')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd SDL_net-$pkgver
  sed -i "s|#include <winsock.h>|#include <winsock2.h>|g" SDLnetsys.h
}

build() {
  cd SDL_net-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/SDL_net-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
 cd "${srcdir}/SDL_net-${pkgver}"
 install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
