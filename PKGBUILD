# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=opencl-clang-git
pkgver=r54.6257ffe
pkgrel=2
pkgdesc='A wrapper library around clang than can compile OpenCL C kernels to SPIR-V modules (git version)'
arch=('x86_64')
url='https://github.com/intel/opencl-clang/'
license=('custom')
depends=('clang')
makedepends=('git' 'cmake' 'llvm')
provides=('opencl-clang')
conflicts=('opencl-clang')
source=('git+https://github.com/intel/opencl-clang.git#branch=ocl-open-70'
        'git+https://github.com/KhronosGroup/SPIRV-LLVM-Translator.git#branch=llvm_release_70'
        'LICENSE-opencl-clang'::'https://raw.githubusercontent.com/intel/opencl-clang/d487d2ee07e59c8ed09eee9f193516335bd90280/LICENSE')
sha256sums=('SKIP'
            'SKIP'
            'd476f6b9b9cf324481b1b8bd1a5d84dc42c9ae0870b0e2458eceaa2a57b8d7bf')

prepare() {
    mkdir -p build build_spirv
    
    ln -sf opencl-clang common_clang
    ln -sf SPIRV-LLVM-Translator llvm-spirv
}

pkgver() {
    cd opencl-clang
    
    # git, no tags available
    printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    # llvm-spirv
    cd build_spirv
    cmake \
        -DCMAKE_INSTALL_PREFIX='install' \
        -DCMAKE_POSITION_INDEPENDENT_CODE='ON' \
        -DCMAKE_BUILD_TYPE='Release' \
        -Wno-dev \
        ../llvm-spirv
    make
    make install
    
    # opencl-clang
    cd "${srcdir}/build"
    cmake \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DCOMMON_CLANG_LIBRARY_NAME='opencl_clang' \
        -DLLVMSPIRV_INCLUDED_IN_LLVM='OFF' \
        -DSPIRV_TRANSLATOR_DIR='../build_spirv/install' \
        -DLLVM_NO_DEAD_STRIP='ON' \
        -Wno-dev \
        ../common_clang
    make
}

package() {
    cd build
    
    make DESTDIR="$pkgdir" install
    
    # provide libcommon_clang.so
    local _sover
    _sover="$(find -L "$pkgdir" -type f -name 'libopencl_clang.so.*' | head -n1)"
    _sover="${_sover##*/}"
    _sover="${_sover##*.}"
    ln -s libopencl_clang.so "${pkgdir}/usr/lib/libcommon_clang.so"
    ln -s "libopencl_clang.so.${_sover}" "${pkgdir}/usr/lib/libcommon_clang.so.${_sover}"
    
    install -D -m644 "${srcdir}/LICENSE-opencl-clang" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
