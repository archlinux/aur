# Maintainer: jazztickets <jazztickets at gmail dot com>
pkgname=mingw-w64-sdl2_ttf
pkgver=2.22.0
pkgrel=1
pkgdesc="A library that allows you to use TrueType fonts in your SDL applications (Version 2) (mingw-w64)"
arch=(any)
url="http://libsdl.org"
license=("MIT")
depends=(mingw-w64-sdl2)
makedepends=(mingw-w64-configure)
options=(staticlibs !strip !buildflags)
source=("https://github.com/libsdl-org/SDL_ttf/releases/download/release-${pkgver}/SDL2_ttf-${pkgver}.tar.gz")
sha256sums=('d48cbd1ce475b9e178206bf3b72d56b66d84d44f64ac05803328396234d67723')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/SDL2_ttf-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    LDFLAGS="-lssp" ${_arch}-configure ..
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

