# Maintainer: crl <crl18039102576@126.com>

pkgbase=kvikio
pkgname=(kvikio python-kvikio)
pkgver=26.08.00
pkgrel=1
pkgdesc="KvikIO - High Performance File IO"
url="https://github.com/rapidsai/kvikio"
arch=('x86_64')
license=('Apache-2.0')
depends=('libgcc' 'libstdc++' 'cuda' 'nvtx' 'bs-thread-pool')
makedepends=('cmake' 'ninja')
source=("$url/archive/refs/tags/v$pkgver.tar.gz" "system-lib.patch" "missing-pkg.patch")
sha256sums=('4708891cef35e1a2b56404e920500239e29ec444630ed47d601ebd0bfefb898b'
            'a0a32613cd4d7ebda16b48d4d4bce508b1ada051c13cf893ab0d4cc72f0494f6'
            'c5166d9c012055d2c1aa0d688b80b6fb586759c3f0746b10674e9d08d4f43bb2')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    patch -p1 cpp/CMakeLists.txt < "$srcdir/system-lib.patch"
    patch -p1 python/kvikio/CMakeLists.txt < "$srcdir/missing-pkg.patch"
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
