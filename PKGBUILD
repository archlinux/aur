# Maintainer: Daniel Bermond <dbermond@archlinux.org>

pkgname=intel-opencl-clang-git
pkgver=11.0.0.r16.g65d5b66
_llvmver=11.1.0
pkgrel=1
pkgdesc='Wrapper library around clang that can compile OpenCL C kernels to SPIR-V modules (git version)'
arch=('x86_64')
url='https://github.com/intel/opencl-clang/'
license=('custom')
depends=('clang' 'llvm-libs')
makedepends=('git' 'cmake' 'llvm' 'spirv-llvm-translator')
provides=('intel-opencl-clang' 'opencl-clang-git')
conflicts=('intel-opencl-clang' 'opencl-clang-git')
replaces=('opencl-clang-git')
source=("git+https://github.com/intel/opencl-clang.git#branch=ocl-open-${_llvmver%%.*}0")
sha256sums=('SKIP')

pkgver() {
    git -C opencl-clang describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cmake -B build -S opencl-clang \
        -DCMAKE_INSTALL_PREFIX:PATH='/usr' \
        -DLLVMSPIRV_INCLUDED_IN_LLVM='OFF' \
        -DSPIRV_TRANSLATOR_DIR='/usr' \
        -DLLVM_NO_DEAD_STRIP='ON' \
        -DPREFERRED_LLVM_VERSION="$_llvmver" \
        -Wno-dev
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install
    install -D -m644 opencl-clang/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
