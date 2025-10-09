# Maintainer: crl <crl18039102576@126.com>

pkgbase=kvikio
pkgname=(kvikio python-kvikio)
pkgver=25.10.00
pkgrel=1
pkgdesc="KvikIO - High Performance File IO"
url="https://github.com/rapidsai/kvikio"
arch=('x86_64')
license=('Apache-2.0')
depends=('gcc-libs' 'cuda' 'nvtx3' 'bs-thread-pool')
makedepends=('cmake' 'ninja')
source=("$url/archive/refs/tags/v$pkgver.tar.gz" "system-lib.patch")
sha256sums=(
    '1106f576e90cf816a846e207dda3630853ac2033de0785c03ce11e4f9794c116'
    '96723986a190d582c80a4d9008dae99844d06e8fb60b5f92f9e45c77a3b6875e'
)

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 cpp/CMakeLists.txt < "$srcdir/system-lib.patch"
}


build() {
    cd "$srcdir/$pkgname-$pkgver"
    cmake -B build -S cpp \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTS=OFF \
        -DKvikIO_BUILD_EXAMPLES=OFF \
        -DKvikIO_BUILD_BENCHMARKS=OFF \
        -DKvikIO_BUILD_TESTS=OFF \
        -DCMAKE_CUDA_ARCHITECTURES="native" \
        -G Ninja
    cmake --build build

    cd python/kvikio
    export kvikio_DIR="$srcdir/$pkgname-$pkgver/build"
    export CMAKE_CUDA_ARCHITECTURES="native"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package_kvikio() {
    cd "$srcdir/$pkgbase-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
}

package_python-kvikio() {
    cd "$srcdir/$pkgbase-$pkgver/python/kvikio"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
