pkgname=mingw-w64-sdl
pkgver=1.2.15
pkgrel=6
pkgdesc="A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (mingw-w64)"
arch=(any)
url="http://libsdl.org"
license=("LGPL")
depends=(mingw-w64-crt)
makedepends=(mingw-w64-configure)
options=(staticlibs !strip !buildflags)
source=("$url/release/SDL-$pkgver.tar.gz")
md5sums=('9d96df8417572a2afb781a7c4c811a85')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}/SDL-${pkgver}"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  install -d "$pkgdir/usr/bin"
  for _arch in ${_architectures}; do
    cd "${srcdir}/SDL-${pkgver}/build-${_arch}"
    make DESTDIR="$pkgdir" install
    chmod a-x "$pkgdir"/usr/${_arch}/lib/*.dll.a
    rm -r "$pkgdir/usr/${_arch}/share"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a 
    ln -s "/usr/${_arch}/bin/sdl-config" "$pkgdir/usr/bin/${_arch}-sdl-config"
  done
}
