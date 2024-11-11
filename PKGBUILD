# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=chipstar
pkgver=1.2.1
pkgrel=1
pkgdesc='Tool for compiling and running HIP/CUDA on SPIR-V via OpenCL or Level Zero APIs'
arch=('x86_64')
url='https://github.com/CHIP-SPV/chipStar/'
license=('MIT')
depends=('level-zero-loader' 'opencl-icd-loader' 'python' 'spirv-llvm-translator' 'spirv-tools')
makedepends=('git' 'cmake' 'clang' 'llvm' 'level-zero-headers' 'python-yaml' 'vim')
options=('!emptydirs')
source=("git+https://github.com/CHIP-SPV/chipStar.git#tag=v${pkgver}"
        'git+https://github.com/CHIP-SPV/HIP.git'
        'git+https://github.com/CHIP-SPV/hip-testsuite.git'
        'git+https://github.com/CHIP-SPV/ROCm-Device-Libs.git'
        'git+https://github.com/CHIP-SPV/HIPCC.git'
        'git+https://github.com/CHIP-SPV/hip-tests.git'
        'git+https://github.com/CHIP-SPV/H4I-MKLShim.git'
        'git+https://github.com/CHIP-SPV/H4I-HipBLAS.git'
        'git+https://github.com/CHIP-SPV/H4I-HipFFT.git')
sha256sums=('84ae11e4330c151fc79121ebf6064425df6f0e4f1d77ae40bbfff58f40ced92d'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
    git -C chipStar submodule init
    
    local _submodule
    for _submodule in HIP hip-testsuite HIPCC hip-tests H4I-{MKLShim,Hip{BLAS,FFT}}
    do
        git -C chipStar config --local "submodule.${_submodule}.url" "${srcdir}/${_submodule}"
    done
    
    git -C chipStar config --local submodule.bitcode/ROCm-Device-Libs.url "${srcdir}/ROCm-Device-Libs"
    git -C chipStar -c protocol.file.allow='always' submodule update
}

build() {
    export CFLAGS+=' -ffat-lto-objects'
    export CXXFLAGS+=' -ffat-lto-objects'
    
    # note: does not compile with 'None' build type
    cmake -B build -S chipStar \
        -G 'Unix Makefiles' \
        -DCMAKE_BUILD_TYPE:STRING='Release' \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DBUILD_TESTING:BOOL='OFF' \
        -DCHIP_BUILD_SAMPLES:BOOL='OFF' \
        -DCHIP_BUILD_TESTS:BOOL='OFF' \
        -Wno-dev
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -D -m644 chipStar/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -d -m755 "${pkgdir}/usr/share/chipstar"
    mv "${pkgdir}/usr/cmake"/* "${pkgdir}/usr/lib/cmake"
    mv "${pkgdir}/usr/bin/.hipVersion" "${pkgdir}/usr/share/chipstar/hipVersion"
    mv "${pkgdir}/usr/share/.hipInfo" "${pkgdir}/usr/share/chipstar/hipInfo"
    rm -r "${pkgdir}/usr/include"/{CL,spdlog}
    chmod a+r "${pkgdir}/usr/bin/spirv-extractor"
}
