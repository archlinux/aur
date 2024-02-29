pkgname=mingw-w64-sdl2
pkgver=2.30.0
pkgrel=1
pkgdesc='A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 2) (mingw-w64)'
license=('MIT')
url='http://libsdl.org'

arch=('any')
_archs=('i686-w64-mingw32' 'x86_64-w64-mingw32')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
source=("${url}/release/SDL2-${pkgver}.tar.gz")
sha256sums=('36e2e41557e0fa4a1519315c0f5958a87ccb27e25c51776beb6f1239526447b0')
options=(staticlibs '!strip' '!buildflags')

build() {
  export MINGW_LDFLAGS="-s"
  cd "${srcdir}/SDL2-${pkgver}"
  for _arch in ${_archs[@]}; do
    mkdir build-${_arch} -p
    pushd build-${_arch}
    ${_arch}-configure
    make
    popd
  done
}

package() {
  cd "${srcdir}/SDL2-${pkgver}"

  install -d "${pkgdir}"/usr/bin

  for _arch in ${_archs[@]}; do
    pushd build-${_arch}
    make DESTDIR="${pkgdir}" install
    find "${pkgdir}/usr/${_arch}/bin" -name "*.dll" -exec ${_arch}-strip --strip-unneeded {} \;
    find "${pkgdir}/usr/${_arch}/lib" -name "*.a"   -exec ${_arch}-strip -g {} \;
    cp "${pkgdir}/usr/${_arch}/lib/libSDL2.a" "${pkgdir}/usr/${_arch}/lib/libSDL2-static.a"
    ln -s "/usr/${_arch}/bin/sdl2-config" "${pkgdir}/usr/bin/${_arch}-sdl2-config"
    popd
  done
}
