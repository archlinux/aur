# Maintainer: SneakySnake <radiantstatue@gmail.com>
# Submit issues/pull requests at https://github.com/crumblingstatue/aur-mingw-w64-sdl2

pkgname=mingw-w64-sdl2
pkgver=2.0.4
pkgrel=1
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 2) (mingw-w64)"
arch=(any)
url="http://libsdl.org"
license=("MIT")
depends=(mingw-w64-libdbus)
makedepends=(mingw-w64-configure)
options=(staticlibs !strip !buildflags)
source=("http://libsdl.org/release/SDL2-${pkgver}.tar.gz")
md5sums=('44fc4a023349933e7f5d7a582f7b886e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/SDL2-${pkgver}"
  for _arch in ${_architectures}; do
    unset LDFLAGS
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure --enable-render-d3d=no
    make
    popd
  done
}

package() {
  install -d "$pkgdir"/usr/bin
  for _arch in ${_architectures}; do
    cd "${srcdir}/SDL2-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
    rm -r "$pkgdir"/usr/${_arch}/share
    ln -s /usr/${_arch}/bin/sdl2-config "$pkgdir"/usr/bin/${_arch}-sdl2-config
  done
}
