pkgname=mingw-w64-sdl2_ttf
pkgver=2.0.15
pkgrel=1
pkgdesc="A library that allows you to use TrueType fonts in your SDL applications (Version 2) (mingw-w64)"
arch=(any)
url="http://libsdl.org"
license=("MIT")
depends=(mingw-w64-sdl2 mingw-w64-freetype2 mingw-w64-bzip2)
makedepends=(mingw-w64-configure)
options=(staticlibs !strip !buildflags)
source=("http://www.libsdl.org/projects/SDL_ttf/release/SDL2_ttf-$pkgver.tar.gz")
sha256sums=('a9eceb1ad88c1f1545cd7bd28e7cbc0b2c14191d40238f531a15b01b1b22cd33')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}/SDL2_ttf-${pkgver}"
  # missing from archive ??
  curl -fSsLO http://hg.libsdl.org/SDL_ttf/raw-file/a86a6db70990/SDL2_ttfConfig.cmake
}

build() {
  cd "${srcdir}/SDL2_ttf-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure ..
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

