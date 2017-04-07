pkgname=mingw-w64-sdl_gfx
pkgver=2.0.26
pkgrel=1
pkgdesc="SDL Graphic Primitives (mingw-w64)"
arch=(any)
url="http://www.ferzkopp.net/joomla/software-mainmenu-14/4-ferzkopps-linux-software/19-sdlgfx"
license=("LGPL")
makedepends=(mingw-w64-configure)
depends=(mingw-w64-sdl)
options=(staticlibs !strip !buildflags)
source=("http://www.ferzkopp.net/Software/SDL_gfx-2.0/SDL_gfx-${pkgver}.tar.gz")
md5sums=('0b3b5ab5f9e7d10f1faf14d4255db6ba')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/SDL_gfx-${pkgver}"
  for _arch in ${_architectures}; do
    [ $_arch = "x86_64-w64-mingw32" ] && confflags="--disable-mmx"
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure $confflags
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/SDL_gfx-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}

