# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-graphics-compiler-git
pkgver=1.0.5964.r58.g51b88fca
pkgrel=1
epoch=1
pkgdesc='Intel Graphics Compiler for OpenCL (git version)'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT' 'custom')
depends=('gcc-libs' 'zlib')
makedepends=('git' 'cmake' 'python')
provides=('intel-graphics-compiler' 'spirv-llvm-translator' 'intel-opencl-clang')
conflicts=('intel-graphics-compiler' 'spirv-llvm-translator' 'intel-opencl-clang')
options=('!emptydirs')
source=('git+https://github.com/intel/intel-graphics-compiler.git'
        'git+https://github.com/intel/vc-intrinsics.git'
        'git+https://github.com/KhronosGroup/SPIRV-LLVM-Translator.git#branch=llvm_release_100'
        'git+https://github.com/intel/opencl-clang.git#branch=ocl-open-100'
        'git+https://github.com/llvm/llvm-project.git#tag=llvmorg-10.0.0'
        'git+https://github.com/intel/llvm-patches.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    ln -sf intel-graphics-compiler igc
    ln -sf ../../../SPIRV-LLVM-Translator llvm-project/llvm/projects/llvm-spirv
    ln -sf ../../../opencl-clang llvm-project/llvm/projects/opencl-clang
    ln -sf llvm-patches llvm_patches
}

pkgver() {
    git -C intel-graphics-compiler describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^igc\.//'
}

build() {
    cmake -B build -S igc \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DIGC_OPTION__ARCHITECTURE_TARGET='Linux64' \
        -DINSTALL_GENX_IR='ON' \
        -DCCLANG_FROM_SYSTEM='OFF' \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="${pkgdir}" install
    install -D -m644 igc/LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    mv "${pkgdir}/usr/include"/opencl-c{,-base}.h "${pkgdir}/usr/include/igc"
    mv "${pkgdir}/usr/lib/igc/NOTICES.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
    
    # additional files for spirv-llvm-translator and opencl-clang
    cp -dr --no-preserve='ownership' build/IGC/VectorCompiler/spirv-install/include/LLVMSPIRVLib "${pkgdir}/usr/include"
    install -D -m644 build/IGC/VectorCompiler/spirv-install/lib/libSPIRVDLL.so -t "${pkgdir}/usr/lib"
    install -D -m644 build/IGC/VectorCompiler/spirv-install/lib/pkgconfig/*.pc -t "${pkgdir}/usr/lib/pkgconfig"
    install -D -m644 build/IGC/llvm/src/llvm/projects/opencl-clang/common_clang.h -t "${pkgdir}/usr/include/cclang"
    install -D -m644 SPIRV-LLVM-Translator/LICENSE.TXT "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-spirv-llvm-translator"
    install -D -m644 opencl-clang/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-opencl-clang"
    sed -i 's|\(prefix=\).*|\1/usr|' "${pkgdir}/usr/lib/pkgconfig/LLVMSPIRVLib.pc"
}
