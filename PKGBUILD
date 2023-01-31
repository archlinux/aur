pkgname=mingw-w64-vulkan-tools
pkgver=1.3.240
pkgrel=1
arch=(any)
url="https://www.khronos.org/vulkan/"
pkgdesc="Vulkan Utilities and Tools (mingw-w64)"
license=('custom')
depends=(mingw-w64-vulkan-icd-loader)
makedepends=(mingw-w64-cmake python mingw-w64-vulkan-headers mingw-w64-glslang mingw-w64-spirv-tools mingw-w64-wine)
options=('!buildflags' 'staticlibs' '!strip')
source=("https://github.com/KhronosGroup/Vulkan-Tools/archive/v${pkgver}.tar.gz")
sha256sums=('cca1080198eacf0cd247c700f8c5f961456440909c692fd2160042e94ba35317')

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
