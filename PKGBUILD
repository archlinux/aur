pkgname=mingw-w64-mesa
pkgver=20.0.0
pkgrel=1
pkgdesc="An open-source implementation of the OpenGL specification (mingw-w64)"
arch=('any')
url="https://www.mesa3d.org/"
license=("custom")
makedepends=('mingw-w64-meson' 'python-mako')
depends=('mingw-w64-dlfcn' 'mingw-w64-llvm')
options=('staticlibs' '!strip' '!buildflags')
validpgpkeys=(71C4B75620BC75708B4BDB254C95FAAB3EB073EC  # Dylan Baker <dylan@pnwbakers.com>
              A5CC9FEC93F2F837CB044912336909B6B25FADFA) # Juan A. Suarez Romero <jasuarez@igalia.com>
source=(https://mesa.freedesktop.org/archive/mesa-${pkgver}.tar.xz{,.sig})
sha256sums=('bb6db3e54b608d2536d4000b3de7dd3ae115fc114e8acbb5afff4b3bbed04b34'
            'SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare () {
  cd "${srcdir}"/mesa-${pkgver}
}

build() {
  cd "${srcdir}"/mesa-${pkgver}
  for _arch in ${_architectures}; do
    ${_arch}-meson build-${_arch}
    ninja -C build-${_arch}
  done
}

package() {
  cd "${srcdir}"/mesa-${pkgver}
  for _arch in ${_architectures}; do
    install -d "$pkgdir"/usr/${_arch}/bin
    install -m755 build-${_arch}/src/gallium/targets/libgl-gdi/opengl32.dll "$pkgdir"/usr/${_arch}/bin
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
}
