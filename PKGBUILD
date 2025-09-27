# Maintainer: Marco Julian Solanki <aur@solanki.mozmail.com>

pkgname='adaptivecpp-git'
pkgver=25.02.0.r109.g8810d85
pkgrel=1
pkgdesc='A modern, community-driven platform for C++-based heterogeneous programming models targeting CPUs and GPUs from all major vendors.'
arch=('x86_64')
url='https://github.com/AdaptiveCpp/AdaptiveCpp'
license=('BSD-2-Clause')
provides=('opencl-headers')
conflicts=('adaptivecpp')
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')
_llvm_version_major=19

depends=(
    "clang${_llvm_version_major}"
    'cuda'
    'gcc-libs'
    'glibc'
    'hip-runtime-amd'
    'level-zero-loader'
    "llvm${_llvm_version_major}-libs"
    'numactl'
    'nvidia-utils'
    'ocl-icd'
    'python'
)
makedepends=(
    'boost'
    'cmake'
    'doxygen'
    'git'
    'level-zero-headers'
    "lld${_llvm_version_major}"
    "llvm${_llvm_version_major}"
    'openmp'
    'rocm-llvm'
)


pkgver() {
    cd "${pkgname}" && git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cmake -Wno-dev \
        -B build \
        -S "${pkgname}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_SKIP_INSTALL_RPATH=YES \
        -DLLVM_ROOT="/usr/lib/llvm${_llvm_version_major}" \
        -DCUDAToolkit_ROOT=/opt/cuda \
        -DROCM_PATH=/opt/rocm \
        -DACPP_LLD_PATH="/usr/lib/llvm${_llvm_version_major}/bin/lld" \
        -DACPP_COMPILER_FEATURE_PROFILE=full \
        -DWITH_CUDA_BACKEND=ON \
        -DWITH_ROCM_BACKEND=ON \
        -DWITH_LEVEL_ZERO_BACKEND=ON \
        -DWITH_OPENCL_BACKEND=ON \

    cmake --build build --parallel $(nproc)
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    cd "${pkgdir}" && ln -svr usr/lib/hipSYCL/llvm-to-backend/*.so usr/lib
}
