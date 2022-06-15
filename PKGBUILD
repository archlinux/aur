pkgname=mingw-w64-vulkan-tools
pkgver=1.3.217
pkgrel=1
arch=(any)
url="https://www.khronos.org/vulkan/"
pkgdesc="Vulkan Utilities and Tools (mingw-w64)"
license=('custom')
depends=(mingw-w64-vulkan-icd-loader)
makedepends=(mingw-w64-cmake python mingw-w64-vulkan-headers mingw-w64-glslang mingw-w64-spirv-tools mingw-w64-wine)
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/KhronosGroup/Vulkan-Tools/archive/v${pkgver}.tar.gz")
sha256sums=('09e1ae38c4546ca709dae788562f25f2bdd9ed7f401bd9e03abc29233a552a0f')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
  cd "${srcdir}"/Vulkan-Tools-${pkgver}
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake -DBUILD_CUBE=ON -DBUILD_VULKANINFO=ON -DBUILD_ICD=OFF \
      -DGLSLANG_INSTALL_DIR=/usr/${_arch} -DGLSLANG_VALIDATOR=/usr/bin/${_arch}-glslangValidator \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}"/Vulkan-Tools-${pkgver}/build-${_arch}
    make DESTDIR="${pkgdir}" install
    ${_arch}-strip --strip-unneeded "${pkgdir}/usr/${_arch}/bin/"*.exe
  done
}
