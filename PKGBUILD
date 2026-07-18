pkgname=mingw-w64-spirv-tools
pkgver=1.4.350.1
pkgrel=1
pkgdesc="API and commands for processing SPIR-V modules (mingw-w64)"
arch=("any")
url="https://github.com/KhronosGr2oup/SPIRV-Tools"
license=("Apache")
depends=("mingw-w64-crt")
makedepends=("mingw-w64-cmake" "mingw-w64-spirv-headers" "git" "make" "python")
options=("!strip" "!buildflags" "staticlibs")
source=("https://github.com/KhronosGroup/SPIRV-Tools/archive/refs/tags/vulkan-sdk-${pkgver}.tar.gz")
sha512sums=("97732eccca2292e80c1c2ca3d1a24fdd89ec342a4c312cb06949b29033c70b4ac3abc1551d8dacafe843e3719e4e160d4dd153195f7483584f40a646ecb74905")

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

build() {
    cd SPIRV-Tools-vulkan-sdk-${pkgver}
    for _arch in ${_architectures}; do
        ${_arch}-cmake \
        -DCMAKE_BUILD_TYPE=Release \
        -DSPIRV_SKIP_EXECUTABLES=ON \
        -DSPIRV_SKIP_TESTS=ON \
        -DSPIRV_WERROR=OFF \
        -DSPIRV-Headers_SOURCE_DIR=/usr/${_arch} \
        -B build-${_arch} -S .
        make -C build-${_arch}
    done
}

package() {
    for _arch in ${_architectures}; do
        cd "${srcdir}/SPIRV-Tools-vulkan-sdk-${pkgver}/build-${_arch}"
        make DESTDIR="${pkgdir}" install
        ${_arch}-strip -g "${pkgdir}"/usr/${_arch}/lib/*.a
        ${_arch}-strip --strip-unneeded "${pkgdir}"/usr/${_arch}/bin/*.dll
    done
}
