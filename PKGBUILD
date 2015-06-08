pkgname=mingw-w64-sdl2_gfx
pkgver=1.0.0
pkgrel=2
pkgdesc="SDL Graphic Primitives (Version 2) (mingw-w64)"
arch=(any)
url="http://www.ferzkopp.net/joomla/software-mainmenu-14/4-ferzkopps-linux-software/19-sdlgfx"
license=("zlib")
depends=(mingw-w64-sdl2)
makedepends=(mingw-w64-configure)
options=(staticlibs !strip !buildflags)
source=("http://www.ferzkopp.net/Software/SDL2_gfx/SDL2_gfx-${pkgver}.tar.gz")
md5sums=('f008cc117cb901aec6bf5c2f0b11f7ea')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/SDL2_gfx-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    sed -i "s/deplibs_check_method=.*/deplibs_check_method=pass_all/g" libtool
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/SDL2_gfx-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
