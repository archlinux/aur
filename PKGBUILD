# Maintainer: Marco Julian Solanki <aur@solanki.mozmail.com>

pkgname='adaptivecpp'
pkgver=24.06.0
pkgrel=1
pkgdesc='A modern, community-driven platform for C++-based heterogeneous programming models targeting CPUs and GPUs from all major vendors.'
arch=('x86_64')
url='https://github.com/AdaptiveCpp/AdaptiveCpp'
license=('BSD-2-Clause')
conflicts=('adaptivecpp-git')
source=("${pkgname}::git+${url}.git#tag=v${pkgver}")
sha512sums=('SKIP')

depends=(
    'cuda'
    'gcc-libs'
    'glibc'
    'hip-runtime-amd'
    'level-zero-loader'
    'llvm-libs'
    'nvidia-utils'
    'ocl-icd'
    'python'
    'spirv-tools'
)
makedepends=(
    'boost'
    'cmake'
    'doxygen'
    'git'
    'level-zero-headers'
    'llvm'
    'openmp'
    'rocm-llvm'
)


build() {
    cmake -Wno-dev \
        -B build \
        -S "${pkgname}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -DCMAKE_SKIP_INSTALL_RPATH=YES \
        -DWITH_SSCP_COMPILER=ON \
        -DWITH_STDPAR_COMPILER=ON \
        -DWITH_ACCELERATED_CPU=ON \
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
