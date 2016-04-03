pkgname=mingw-w64-sdl2_net
pkgver=2.0.1
pkgrel=1
pkgdesc="A small sample cross-platform networking library (Version 2) (mingw-w64)"
arch=('any')
url="http://libsdl.org"
license=("MIT")
depends=('mingw-w64-sdl2')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!strip' '!buildflags')
source=("http://www.libsdl.org/projects/SDL_net/release/SDL2_net-$pkgver.tar.gz")
md5sums=('5c1d9d1cfa63301b141cb5c0de2ea7c4')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/SDL2_net-${pkgver}"
  sed -i "s|#include <winsock.h>|#include <winsock2.h>|g" SDLnetsys.h
}

build() {
  cd "${srcdir}/SDL2_net-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --disable-sdltest
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/SDL2_net-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
