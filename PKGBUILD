pkgname=mingw-w64-sdl2
pkgver=2.0.22
pkgrel=1
pkgdesc='A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 2) (mingw-w64)'
license=('MIT')
url='http://libsdl.org'

arch=('any')
_archs=('i686-w64-mingw32' 'x86_64-w64-mingw32')
depends=('mingw-w64-crt')
makedepends=('mingw-w64-configure')
source=("${url}/release/SDL2-${pkgver}.tar.gz")
sha256sums=('fe7cbf3127882e3fc7259a75a0cb585620272c51745d3852ab9dd87960697f2e')
options=(staticlibs '!strip' '!buildflags')

prepare() {
  cd "${srcdir}/SDL2-${pkgver}"
  sed -i 's:IMPORTED_LOCATION "@libdir@/libSDL2\.so":IMPORTED_LOCATION "@bindir@/SDL2.dll" IMPORTED_IMPLIB "@libdir@/libSDL2.dll.a":' sdl2-config.cmake.in
}

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
    ln -s         "/usr/${_arch}/bin/sdl2-config" "${pkgdir}/usr/bin/${_arch}-sdl2-config"
    popd
  done
}
