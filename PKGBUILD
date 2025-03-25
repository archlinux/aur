pkgname=mingw-w64-mesa-git
pkgver=25.1.0_devel.203318.75d6af03d83
pkgrel=1
pkgdesc="An open-source implementation of the OpenGL specification (mingw-w64)"
arch=('any')
url="https://www.mesa3d.org/"
license=("custom")
makedepends=('mingw-w64-meson' 'mingw-w64-cmake' 'mingw-w64-directx-headers' 'python-mako' 'python-yaml' 'glslang')
depends=('mingw-w64-llvm' 'mingw-w64-vulkan-icd-loader')
provides=('mingw-w64-mesa')
conflicts=('mingw-w64-mesa')
options=('staticlibs' '!strip' '!buildflags')
source=("git+https://gitlab.freedesktop.org/mesa/mesa.git")
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
    ${_arch}-meson build-${_arch} -Db_lto=false -Dgallium-drivers=softpipe,llvmpipe,zink -Dvulkan-drivers=swrast -Degl=enabled -Dgles1=enabled -Dgles2=enabled -Dvulkan-icd-dir=bin --includedir=include/mesa
    ninja -C build-${_arch} ${MAKEFLAGS}
  done
}

package() {
  cd "${srcdir}"/mesa
  for _arch in ${_architectures}; do
    DESTDIR="$pkgdir" ninja -C build-${_arch} install
    rm -r "$pkgdir"/usr/${_arch}/lib
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
  done
}
