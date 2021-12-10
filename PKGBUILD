pkgname=mingw-w64-mesa-git
pkgver=22.0.0_devel.147904.77db4e27b18
pkgrel=1
pkgdesc="An open-source implementation of the OpenGL specification (mingw-w64)"
arch=('any')
url="https://www.mesa3d.org/"
license=("custom")
makedepends=('mingw-w64-meson' 'mingw-w64-cmake' 'python-mako')
depends=('mingw-w64-llvm' 'mingw-w64-vulkan-icd-loader' 'mingw-w64-dlfcn')
provides=('mingw-w64-mesa')
conflicts=('mingw-w64-mesa')
options=('staticlibs' '!strip' '!buildflags')
source=("git+git://anongit.freedesktop.org/mesa/mesa")
sha256sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd mesa
  read -r _ver <VERSION
  echo ${_ver/-/_}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}"/mesa
  for _arch in ${_architectures}; do
    ${_arch}-meson build-${_arch} -Db_lto=false -Dgallium-drivers=swrast,zink -Dvulkan-drivers=swrast
    ninja -C build-${_arch} ${MAKEFLAGS}
  done
}

package() {
  cd "${srcdir}"/mesa
  for _arch in ${_architectures}; do
    install -d "$pkgdir"/usr/${_arch}/bin
    install -m755 build-${_arch}/src/gallium/targets/libgl-gdi/opengl32.dll "$pkgdir"/usr/${_arch}/bin
    install -m755 build-${_arch}/src/gallium/targets/wgl/libgallium_wgl.dll "$pkgdir"/usr/${_arch}/bin
    install -m755 build-${_arch}/src/gallium/targets/lavapipe/vulkan_lvp.dll "$pkgdir"/usr/${_arch}/bin
    install -m644 build-${_arch}/src/gallium/targets/lavapipe/lvp_icd.*.json "$pkgdir"/usr/${_arch}/bin
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
}
