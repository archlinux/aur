pkgname=mingw-w64-sdl2_gfx
pkgver=1.0.4
pkgrel=1
pkgdesc="SDL graphics drawing primitives and other support functions (Version 2)mingw-w64)"
arch=(any)
url="http://www.ferzkopp.net/wordpress/2016/01/02/sdl_gfx-sdl2_gfx/"
license=(zlib)
depends=(mingw-w64-sdl2)
makedepends=(mingw-w64-configure)
options=(staticlibs !strip !buildflags)
source=("https://www.ferzkopp.net/Software/SDL2_gfx/SDL2_gfx-${pkgver}.tar.gz")
sha512sums=('81a100d3c8c3a7c6bd37a23f1290ff10685f8e62fbecd83b0086aae4edc721483e2153cd4219fbd9168f115eea0ea6b25f9be375faf5761f0babdfb1b52fe482')

_architectures="i686-w64-mingw64 x86_64-w64-mingw64"

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
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
