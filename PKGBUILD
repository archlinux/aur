# Maintainer: crl <crl18039102576@126.com>

pkgbase=kvikio
pkgname=(kvikio python-kvikio)
pkgver=26.04.00
pkgrel=1
pkgdesc="KvikIO - High Performance File IO"
url="https://github.com/rapidsai/kvikio"
arch=('x86_64')
license=('Apache-2.0')
depends=('libgcc' 'libstdc++' 'cuda' 'nvtx3' 'bs-thread-pool')
makedepends=('cmake' 'ninja')
source=("$url/archive/refs/tags/v$pkgver.tar.gz" "system-lib.patch")
sha256sums=(
    'ed072af5eadea1cc90eccd0bc55e7569877ca66193c2e45a605ec70a2e3d433d'
    '5378e3fddc94fe0685554595b349fda8d5659eefa55ce41780fe2ed813b75298'
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
    depends+=(kvikio)
    cd "$srcdir/$pkgbase-$pkgver/python/kvikio"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
