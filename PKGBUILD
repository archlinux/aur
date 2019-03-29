# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=intel-opencl-clang
_srcname=opencl-clang
pkgver=7.0.1
pkgrel=2
pkgdesc='A wrapper library around clang that can compile OpenCL C kernels to SPIR-V modules'
arch=('x86_64')
url='https://github.com/intel/opencl-clang/'
license=('custom')
depends=('clang')
makedepends=('git' 'cmake' 'llvm' 'spirv-llvm-translator')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/intel/opencl-clang/archive/v${pkgver}.tar.gz")
sha256sums=('407800aceebebef8deaa1428d4b730a0f74329e0336a96fa1f1dd30a34b952e2')

build() {
    cd "${_srcname}-${pkgver}"
    
    cmake \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DLLVMSPIRV_INCLUDED_IN_LLVM='OFF' \
        -DSPIRV_TRANSLATOR_DIR='/usr' \
        -DLLVM_NO_DEAD_STRIP='ON' \
        -Wno-dev \
        .
        
    make
}

package() {
    cd "${_srcname}-${pkgver}"
    
    make DESTDIR="$pkgdir" install
    
    # provide libopencl_clang.so
    local _sover
    _sover="$(find -L "$pkgdir" -type f -name 'libcommon_clang.so.*' | head -n1)"
    _sover="${_sover##*/}"
    _sover="${_sover##*.}"
    ln -s libcommon_clang.so "${pkgdir}/usr/lib/libopencl_clang.so"
    ln -s "libcommon_clang.so.${_sover}" "${pkgdir}/usr/lib/libopencl_clang.so.${_sover}"
    
    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
