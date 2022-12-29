pkgname=mingw-w64-mesa
pkgver=22.3.1
pkgrel=1
pkgdesc="An open-source implementation of the OpenGL specification (mingw-w64)"
arch=('any')
url="https://www.mesa3d.org/"
license=("custom")
makedepends=('mingw-w64-meson' 'mingw-w64-cmake' 'python-mako')
depends=('mingw-w64-llvm' 'mingw-w64-vulkan-icd-loader' 'mingw-w64-dlfcn')
options=('staticlibs' '!strip' '!buildflags')
validpgpkeys=('8703B6700E7EE06D7A39B8D6EDAE37B02CEB490D'  # Emil Velikov <emil.l.velikov@gmail.com>
              '946D09B5E4C9845E63075FF1D961C596A7203456'  # Andres Gomez <tanty@igalia.com>
              'E3E8F480C52ADD73B278EE78E1ECBE07D7D70895'  # Juan Antonio Suárez Romero (Igalia, S.L.) <jasuarez@igalia.com>
              'A5CC9FEC93F2F837CB044912336909B6B25FADFA'  # Juan A. Suarez Romero <jasuarez@igalia.com>
              '71C4B75620BC75708B4BDB254C95FAAB3EB073EC'  # Dylan Baker <dylan@pnwbakers.com>
              '57551DE15B968F6341C248F68D8E31AFC32428A6') # Eric Engestrom <eric@engestrom.ch>
source=(https://mesa.freedesktop.org/archive/mesa-${pkgver}.tar.xz{,.sig})
sha256sums=('3c9cd611c0859d307aba0659833386abdca4c86162d3c275ba5be62d16cf31eb'
            'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}"/mesa-${pkgver}
}

build() {
  cd "${srcdir}"/mesa-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-meson build-${_arch} -Dgallium-drivers=swrast,zink -Dvulkan-drivers=swrast -Db_lto=false -Degl=disabled -Dshared-glapi=enabled -Dgles1=enabled -Dgles2=enabled -Dosmesa=true -Dvulkan-icd-dir=bin --includedir=include/mesa
    ninja -C build-${_arch} ${MAKEFLAGS}
  done
}

package() {
  cd "${srcdir}"/mesa-${pkgver}
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" ninja -C build-${_arch} install
    rm -r "$pkgdir"/usr/${_arch}/lib
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
}
