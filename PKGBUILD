# Maintainer: SneakySnake <radiantstatue@gmail.com>
# Submit issues/pull requests at https://github.com/crumblingstatue/aur-mingw-w64-sdl2

pkgname=mingw-w64-sdl2
pkgver=2.0.7
pkgrel=1
pkgdesc='A library for portable low-level access to a video framebuffer, audio output, mouse, and keyboard (Version 2) (mingw-w64)'
license=('MIT')
url='http://libsdl.org'

arch=('any')
_archs=('i686-w64-mingw32' 'x86_64-w64-mingw32')
depends=()
makedepends=('mingw-w64-configure')
source=("${url}/release/SDL2-${pkgver}.tar.gz")
sha256sums=('ee35c74c4313e2eda104b14b1b86f7db84a04eeab9430d56e001cea268bf4d5e')
options=(staticlibs !strip !buildflags)

build() {
  cd "${srcdir}/SDL2-${pkgver}"
  for _arch in ${_archs[@]}; do
    unset LDFLAGS
    mkdir build-${_arch} -p
    pushd build-${_arch}
    ${_arch}-configure --enable-render-d3d=no
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
    rm   "${pkgdir}/usr/${_arch}/share" -r
    ln -s         "/usr/${_arch}/bin/sdl2-config" \
         "${pkgdir}/usr/bin/${_arch}-sdl2-config"
    popd
  done
}
