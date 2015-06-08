pkgname=mingw-w64-sdl_mixer
pkgver=1.2.12
pkgrel=10
pkgdesc="A simple multi-channel audio mixer (mingw-w64)"
arch=(any)
url="http://www.libsdl.org/projects/SDL_mixer"
license=("zlib")
depends=(mingw-w64-crt mingw-w64-sdl mingw-w64-libmikmod mingw-w64-libvorbis mingw-w64-smpeg mingw-w64-flac)
makedepends=(mingw-w64-configure)
options=(staticlibs !strip !buildflags)
source=("http://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-$pkgver.tar.gz")
md5sums=('e03ff73d77a55e3572ad0217131dc4a1')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/SDL_mixer-${pkgver}"
  for _arch in ${_architectures}; do
    export LIBMIKMOD_CONFIG=/usr/${_arch}/bin/libmikmod-config
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/SDL_mixer-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
