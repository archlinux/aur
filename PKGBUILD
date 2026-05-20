# Maintainer: SpeedyTurtle599 <speedyturtle599@gmail.com>

pkgname=umpire-mpi
pkgver=2025.12.0
pkgrel=1
pkgdesc="Application-focused management and coordination of complex hierarchical memory (MPI build)"
arch=('x86_64')
url="https://github.com/LLNL/Umpire"
license=('MIT')
depends=('gcc-libs' 'openmpi')
makedepends=('cmake' 'fmt')
provides=('umpire=2025.12.0')
conflicts=('umpire' 'umpire-cuda')

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
    # To use Clang instead of GCC, export CC=clang CXX=clang++ before calling
    # makepkg, or set them here explicitly.

    cmake -B build -S "Umpire-${pkgver}" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib \
        -DBUILD_SHARED_LIBS=ON \
        -Dfmt_DIR=/usr/lib/cmake/fmt \
        -DENABLE_MPI=ON \
        -DENABLE_OPENMP=ON \
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
