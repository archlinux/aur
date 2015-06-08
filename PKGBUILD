pkgname=mingw-w64-sdl_ttf
pkgver=2.0.11
pkgrel=6
pkgdesc="A library that allows you to use TrueType fonts in your SDL applications (mingw-w64)"
arch=(any)
url="http://libsdl.org/projects/SDL_ttf"
license=("zlib")
depends=(mingw-w64-crt mingw-w64-sdl mingw-w64-freetype mingw-w64-bzip2)
makedepends=(mingw-w64-configure)
options=(staticlibs !strip !buildflags)
source=("$url/release/SDL_ttf-$pkgver.tar.gz")
md5sums=('61e29bd9da8d245bc2471d1b2ce591aa')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/SDL_ttf-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure \
      --disable-sdltest \
      --with-freetype-prefix=/usr/${_arch}
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/SDL_ttf-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
