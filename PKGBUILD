pkgname=mingw-w64-sdl_net
pkgver=1.2.8
pkgrel=5
pkgdesc="A small sample cross-platform networking library (mingw-w64)"
arch=('any')
url="http://libsdl.org/projects/SDL_net"
license=("zlib")
depends=('mingw-w64-sdl')
makedepends=('mingw-w64-configure')
options=('staticlibs' '!strip' '!buildflags')
source=("$url/release/SDL_net-$pkgver.tar.gz")
md5sums=('20e64e61d65662db66c379034f11f718')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}/SDL_net-${pkgver}"
  sed -i "s|#include <winsock.h>|#include <winsock2.h>|g" SDLnetsys.h
}

build() {
  cd "${srcdir}/SDL_net-${pkgver}"
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
}
