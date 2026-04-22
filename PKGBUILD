# Maintainer: develOseven <devel.oseven@gmail.com>
# Credits: Patrick Northon <northon_patrick3@yahoo.ca>

_pkgname=vulkan-utility-libraries
pkgname=mingw-w64-${_pkgname}
_dirname=Vulkan-Utility-Libraries
pkgver=1.4.341
pkgrel=1
pkgdesc='Vulkan Utility Libraries (mingw-w64)'
arch=(any)
url='https://www.khronos.org/vulkan/'
groups=('mingw-w64-vulkan-devel')
license=('Apache-2.0')
makedepends=(mingw-w64-cmake git mingw-w64-vulkan-headers ninja)
depends=(mingw-w64-crt)
options=(!buildflags staticlibs !strip)
source=(git+https://github.com/KhronosGroup/Vulkan-Utility-Libraries.git#tag=vulkan-sdk-${pkgver}.0)

_srcdir="${_dirname}"
_architectures='i686-w64-mingw32 x86_64-w64-mingw32'
_flags=(
  -Wno-dev
  -DCMAKE_BUILD_TYPE=Release
  -DCMAKE_C_FLAGS_RELEASE='-DNDEBUG'
  -DUSE_MASM=OFF )

build() {
  for _arch in ${_architectures}; do
    ${_arch}-cmake -G Ninja -S "${_srcdir}/" -B "build-${_arch}" "${_flags[@]}" -DBUILD_TESTS=OFF
    cmake --build "build-${_arch}"
  done
}

package() {
  for _arch in ${_architectures}; do
    DESTDIR="${pkgdir}" cmake --install "build-${_arch}"
    ${_arch}-strip -g "${pkgdir}/usr/${_arch}/lib/"*.a
  done
}
sha256sums=('e3e09eb9efaa90c16a36fcbd5f50b7cad07855215aa9c045774949d5f89de97d')
