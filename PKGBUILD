# Maintainer: SpeedyTurtle599 <speedyturtle599@gmail.com>

pkgname=umpire-cuda
pkgver=2025.12.0
pkgrel=1
pkgdesc="Application-focused management and coordination of complex hierarchical memory (CUDA+MPI build)"
arch=('x86_64')
url="https://github.com/LLNL/Umpire"
license=('MIT')
depends=('gcc-libs' 'cuda' 'openmpi')
makedepends=('cmake' 'fmt' 'gcc15')
provides=('umpire=2025.12.0')
conflicts=('umpire' 'umpire-mpi')

# Submodule commits pinned to v2025.12.0.
# blt and camp are LLNL-specific and not available as system packages.
# fmt is provided by the system 'fmt' package (makedepend above).
_blt_commit=e346c776b27493aa058fac5c7afc9a09bb6014bd
_camp_commit=a8caefa9f4c811b1a114b4ed2c9b681d40f12325

source=(
    "umpire-${pkgver}.tar.gz::https://github.com/LLNL/Umpire/archive/refs/tags/v${pkgver}.tar.gz"
    "blt-${_blt_commit}.tar.gz::https://github.com/LLNL/blt/archive/${_blt_commit}.tar.gz"
    "camp-${_camp_commit}.tar.gz::https://github.com/LLNL/camp/archive/${_camp_commit}.tar.gz"
)
sha256sums=(
    '04f59c1e84d50a0fe2b165e136ebc3aba928d134449a419acc5a920e83cf0dcf'
    'f810cf1d6081ccf1ba0454f09d3a7bbf76f270df717a4f61180ba54a577d6323'
    '6449e5d9a0d96b9ab26ab64ffc969a06b90443e8d913fd47eebb285b11da5289'
)

prepare() {
    local _srcdir="Umpire-${pkgver}"

    # Place submodule sources where the build system expects them.
    # The blt and camp submodules are not included in GitHub release tarballs
    # and must be supplied separately.
    rm -rf "${_srcdir}/blt"
    mv "blt-${_blt_commit}" "${_srcdir}/blt"

    rm -rf "${_srcdir}/src/tpl/umpire/camp"
    mv "camp-${_camp_commit}" "${_srcdir}/src/tpl/umpire/camp"

}

build() {
    # Arch Linux installs the CUDA toolkit to /opt/cuda.
    export PATH="/opt/cuda/bin:${PATH}"

    # nvcc 13.2 supports GCC up to version 15. GCC 16 (the Arch default) uses
    # C++20/23 constructs in its standard headers that nvcc's frontend cannot
    # parse. Drive the entire build with GCC 15 so host headers and ABI are
    # consistent throughout.
    export CC=/usr/bin/gcc-15
    export CXX=/usr/bin/g++-15

    # CUDA architectures: 'native' detects the GPU(s) present at build time
    # (requires CMake >= 3.24 and an NVIDIA GPU in the build machine).
    # To target specific compute capabilities instead, replace 'native' with a
    # semicolon-separated list, e.g. '70;80;90' for Volta, Ampere, and Hopper.
    local _cuda_archs="${CUDA_ARCHITECTURES:-native}"

    # To use Clang as the host compiler (recommended for newer CUDA versions),
    # export CC=clang CXX=clang++ before calling makepkg and remove or adjust
    # the CMAKE_CUDA_HOST_COMPILER line below.

    cmake -B build -S "Umpire-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DBUILD_SHARED_LIBS=ON \
        -DCMAKE_CUDA_COMPILER=/opt/cuda/bin/nvcc \
        -DCMAKE_CUDA_HOST_COMPILER="${CXX}" \
        -DCMAKE_CUDA_ARCHITECTURES="${_cuda_archs}" \
        -Dfmt_DIR=/usr/lib/cmake/fmt \
        -DENABLE_CUDA=ON \
        -DENABLE_MPI=ON \
        -DENABLE_OPENMP=ON \
        -DUMPIRE_ENABLE_DEVICE_ALLOCATOR=ON \
        -DENABLE_TESTS=OFF \
        -DENABLE_BENCHMARKS=OFF \
        -DENABLE_EXAMPLES=OFF \
        -DENABLE_DOCS=OFF \
        -DUMPIRE_ENABLE_TOOLS=OFF \
        -DUMPIRE_ENABLE_C=OFF

    cmake --build build
}

package() {
    DESTDIR="${pkgdir}" cmake --install build
    install -Dm644 "Umpire-${pkgver}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
