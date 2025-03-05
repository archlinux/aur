pkgname=mingw-w64-sdl2_image
pkgver=2.8.8
pkgrel=1
pkgdesc="SDL2 image libraries (mingw-w64)"
arch=(any)
url="https://github.com/libsdl-org/SDL_image"
license=("MIT")
depends=(mingw-w64-crt mingw-w64-sdl2 mingw-w64-libtiff mingw-w64-libjpeg-turbo mingw-w64-libwebp mingw-w64-libpng)
makedepends=(mingw-w64-configure)
options=(staticlibs !strip !buildflags)
source=("https://github.com/libsdl-org/SDL_image/releases/download/release-$pkgver/SDL2_image-$pkgver.tar.gz")
sha256sums=('2213b56fdaff2220d0e38c8e420cbe1a83c87374190cba8c70af2156097ce30a')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/SDL2_image-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --disable-sdltest
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/SDL2_image-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
