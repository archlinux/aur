pkgname=mingw-w64-sdl2_ttf
pkgver=2.0.12
pkgrel=7
pkgdesc="A library that allows you to use TrueType fonts in your SDL applications (Version 2) (mingw-w64)"
arch=(any)
url="http://libsdl.org"
license=("MIT")
depends=(mingw-w64-sdl2 mingw-w64-freetype mingw-w64-bzip2)
makedepends=(mingw-w64-configure)
options=(staticlibs !strip !buildflags)
source=("http://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-$pkgver.tar.gz")
md5sums=('79787216b56cb4707f39d538f2225e00')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/SDL2_ttf-${pkgver}"
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
    cd "${srcdir}/SDL2_ttf-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
