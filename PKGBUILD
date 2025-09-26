# Maintainer: Your Name <your.email@example.com>
pkgname=cuda-demux
pkgver=1.0.0
pkgrel=1
pkgdesc="High-performance GPU-accelerated tool for demultiplexing Illumina sequencing data"
arch=('x86_64')
url="https://github.com/mmorri/cuda-demux"
license=('MIT')
depends=('cuda>=11.0' 'zlib' 'gcc-libs' 'glibc')
makedepends=('cmake>=3.16' 'git' 'cuda>=11.0')
optdepends=('cuda-12.0: Support for newer CUDA toolkit')
source=("${pkgname}-${pkgver}::git+https://github.com/mmorri/cuda-demux.git#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"

    # Create build directory
    mkdir -p build
    cd build

    # Configure with CMake
    cmake .. \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DENABLE_FETCH_TINYXML2=ON

    # Build
    make -j$(nproc)
}

package() {
    cd "${pkgname}-${pkgver}/build"

    # Install binary
    install -Dm755 cuda-demux "${pkgdir}/usr/bin/cuda-demux"

    # Install documentation
    cd ..
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}