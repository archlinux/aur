# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=intel-graphics-compiler
pkgver=2019.02.25
_srcver="${pkgver//./-}"
pkgrel=1
pkgdesc='Intel Graphics Compiler for OpenCL'
arch=('x86_64')
url='https://github.com/intel/intel-graphics-compiler/'
license=('MIT')
depends=('clang')
makedepends=('git' 'cmake' 'llvm' 'zlib' 'p7zip' 'python-nose' 'python2')
conflicts=('compute-runtime')
options=('!emptydirs')
source=("https://github.com/intel/intel-graphics-compiler/archive/igc_release_${_srcver}.tar.gz"
        'common_clang'::'git+https://github.com/intel/opencl-clang.git#branch=ocl-open-70'
        'llvm-spirv'::'git+https://github.com/KhronosGroup/SPIRV-LLVM-Translator.git#branch=llvm_release_70')
noextract=("igc_release_${_srcver}.tar.gz")
sha256sums=('3a6a3906876aa13262ab2c777f5cd98371f5a44d377eb3e8c2ba2bb317a90532'
            'SKIP'
            'SKIP')

prepare() {
    mkdir -p build_spirv \
             build_opencl_clang \
             build \
             igc/Clang/Prebuilt/linux-ubuntu/Release/64
             
    bsdtar xf "igc_release_${_srcver}.tar.gz" -C igc --strip-components='1'
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
    make llvm-spirv
    make install
    
    # opencl-clang
    cd "${srcdir}/build_opencl_clang"
    cmake \
        -DCOMMON_CLANG_LIBRARY_NAME='opencl_clang' \
        -DLLVMSPIRV_INCLUDED_IN_LLVM='OFF' \
        -DSPIRV_TRANSLATOR_DIR='../build_spirv/install' \
        -DLLVM_NO_DEAD_STRIP='ON' \
        -Wno-dev \
        ../common_clang
    make all
    
    # bundled clang file
    local _clangmaj
    _clangmaj="$(clang --version | head -n1 | awk '{ print $3 }' | awk -F'.' '{ print $1 }')"
    7za a "${srcdir}/igc/Clang/Prebuilt/linux-ubuntu/Release/64/clang.7z" \
        "${srcdir}/build_opencl_clang/libopencl_clang.so."? \
        "${srcdir}/build_opencl_clang/cl_headers/opencl-c.h" \
        "/usr/bin/clang-${_clangmaj}"
    7za rn "${srcdir}/igc/Clang/Prebuilt/linux-ubuntu/Release/64/clang.7z" "clang-${_clangmaj}" clang
    
    # igc
    cd "${srcdir}/build"
    cmake \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DIGC_OPTION__OUTPUT_DIR='../igc-install/Release' \
        -DVME_TYPES_DEFINED='FALSE' \
        -Wno-dev \
        ../igc
    make
    cp -af "${srcdir}/igc/igc-install/Release/clang/linux-ubuntu64/libopencl_clang.so."? \
           "${srcdir}/igc/igc-install/Release/clang/linux-ubuntu64/libcommon_clang64.so"
           
    # license
    sed -n '2,20p' IGC/igc.opencl.h > LICENSE # create file
    sed -i '1,22s/^.\{,3\}//' LICENSE         # erase C comments
}

package() {
    cd build
    
    make DESTDIR="$pkgdir" install
    
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    
    ln -s libcommon_clang64.so "${pkgdir}/usr/lib/libopencl_clang.so"
}
