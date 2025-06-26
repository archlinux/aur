# Maintainer: Marco Julian Solanki <aur@solanki.mozmail.com>

pkgname='adaptivecpp-git'
pkgver=25.02.0.r82.g0107b78
pkgrel=1
pkgdesc='A modern, community-driven platform for C++-based heterogeneous programming models targeting CPUs and GPUs from all major vendors.'
arch=('x86_64')
url='https://github.com/AdaptiveCpp/AdaptiveCpp'
license=('BSD-2-Clause')
conflicts=('adaptivecpp')
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')

depends=(
    'cuda'
    'gcc-libs'
    'glibc'
    'hip-runtime-amd'
    'level-zero-loader'
    'llvm-libs'
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
    'lld'
    'llvm'
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
        -DCUDAToolkit_ROOT=/opt/cuda \
        -DROCM_PATH=/opt/rocm \
        -DACPP_COMPILER_FEATURE_PROFILE=full \
        -DACPP_EXPERIMENTAL_LLVM=ON \
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
