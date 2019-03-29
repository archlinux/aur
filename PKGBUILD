# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=intel-opencl-clang-git
pkgver=7.0.1.r1.gd29e1fa
pkgrel=1
pkgdesc='A wrapper library around clang than can compile OpenCL C kernels to SPIR-V modules (git version)'
arch=('x86_64')
url='https://github.com/intel/opencl-clang/'
license=('custom')
depends=('clang')
makedepends=('git' 'cmake' 'llvm' 'spirv-llvm-translator')
provides=('intel-opencl-clang' 'opencl-clang-git')
conflicts=('intel-opencl-clang' 'opencl-clang-git')
replaces=('opencl-clang-git')
source=('git+https://github.com/intel/opencl-clang.git#branch=ocl-open-70')
sha256sums=('SKIP')

pkgver() {
    cd opencl-clang
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd opencl-clang
    
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
    cd opencl-clang
    
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
