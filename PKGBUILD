# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-graphics-compiler-git
pkgver=1.0.15136.0.r195.g29f439cf2
_llvmmaj=14
_llvmver="${_llvmmaj}.0.5"
pkgrel=1
epoch=1
pkgdesc='Intel Graphics Compiler for OpenCL (git version)'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT' 'custom')
depends=('gcc-libs' 'zlib')
makedepends=('git' 'cmake' 'python' 'python-mako')
provides=('intel-graphics-compiler' "intel-opencl-clang=${_llvmmaj}.0.0")
conflicts=('intel-graphics-compiler' 'intel-opencl-clang')
options=('!emptydirs' '!lto')
source=('git+https://github.com/intel/intel-graphics-compiler.git'
        'git+https://github.com/intel/vc-intrinsics.git'
        "git+https://github.com/KhronosGroup/SPIRV-LLVM-Translator.git#branch=llvm_release_${_llvmmaj}0"
        "git+https://github.com/intel/opencl-clang.git#branch=ocl-open-${_llvmmaj}0"
        "git+https://github.com/llvm/llvm-project.git#tag=llvmorg-${_llvmver}"
        'git+https://github.com/KhronosGroup/SPIRV-Tools.git#branch=main'
        'git+https://github.com/KhronosGroup/SPIRV-Headers.git#branch=main')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    ln -sf intel-graphics-compiler igc
    ln -sf ../../../SPIRV-LLVM-Translator llvm-project/llvm/projects/llvm-spirv
    ln -sf ../../../opencl-clang llvm-project/llvm/projects/opencl-clang
}

pkgver() {
    git -C intel-graphics-compiler describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^igc\.//'
}

build() {
    export CXXFLAGS+=" -I ${srcdir}/SPIRV-LLVM-Translator/include" #-Wno-error=odr -Wno-error=stringop-overflow="
    export CXXFLAGS+=' -Wno-error=restrict -Wno-error=deprecated-declarations'
    EMAIL='someone@archlinux.org' \
    cmake -B build -S intel-graphics-compiler \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_INSTALL_LIBDIR='lib' \
        -DIGC_OPTION__ARCHITECTURE_TARGET='Linux64' \
        -DIGC_OPTION__CLANG_MODE='Source' \
        -DIGC_OPTION__LLD_MODE='Source' \
        -DIGC_OPTION__LLVM_PREFERRED_VERSION="${_llvmver}" \
        -DIGC_OPTION__LLVM_MODE='Source' \
        -DIGC_OPTION__LINK_KHRONOS_SPIRV_TRANSLATOR='OFF' \
        -DIGC_OPTION__SPIRV_TOOLS_MODE='Source' \
        -DIGC_OPTION__VC_INTRINSICS_MODE='Source' \
        -DCCLANG_FROM_SYSTEM='OFF' \
        -DINSTALL_GENX_IR='ON' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 igc/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/include"/opencl-c{,-base}.h "${pkgdir}/usr/include/igc"
    mv "${pkgdir}/usr/lib/igc/NOTICES.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
    rm "${pkgdir}/usr/bin/lld"
    
    # additional files for opencl-clang
    install -D -m644 opencl-clang/common_clang.h -t "${pkgdir}/usr/include/cclang"
    install -D -m644 opencl-clang/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-opencl-clang"
    ln -s "libopencl-clang.so.${_llvmmaj}" "${pkgdir}/usr/lib/libopencl-clang.so"
}
