# Maintainer: crl <crl18039102576@126.com>

pkgbase=cuvs
pkgname=(libcuvs python-cuvs)
pkgver=25.10.00
pkgrel=1
pkgdesc="cuVS - a library for vector search and clustering on the GPU"
url="https://github.com/rapidsai/cuvs"
arch=('x86_64')
license=('Apache-2.0')
depends=('cuda' 'rmm' 'libraft')
makedepends=('cuda' 'python-setuptools' 'cmake' 'python-scikit-build-core' 'python-rapids-build-backend' 'ninja' 'cython')
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz" 
    "system-lib.patch"
    "missing-pkg.patch"
)
sha256sums=(
    '4bfe4f07ce430261ad03618d200ecc061f18fc03915037f425cde8f820312511'
    '50365355e85bf3b6ead903f39aa2cb82667d2b4f9172d95b903bd85c77b395dd'
    '4781db2b3b552e1bcae18a7ca80ba094c66fb5ad33f588423fb2c1f51331743c'
)

prepare() {
    cd "$srcdir/$pkgbase-$pkgver"
    patch -p1 "cpp/CMakeLists.txt" < "$srcdir/system-lib.patch"
    patch -p1 "python/cuvs/CMakeLists.txt" < "$srcdir/missing-pkg.patch"
}


build() {
    cd "$srcdir/$pkgbase-$pkgver"
    cmake -B build -S cpp \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CUDA_ARCHITECTURES="native" \
        -DBUILD_TESTS=OFF \
        -DCUVS_COMPILE_DYNAMIC_ONLY=ON \
        -G Ninja
    cmake --build build

    cd "$srcdir/$pkgbase-$pkgver/python/cuvs"
    export cuvs_DIR="$srcdir/$pkgbase-$pkgver/build"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package_libcuvs() {
    depends+=('dlpack')
    cd "$srcdir/$pkgbase-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
}

package_python-cuvs() {
    depends+=('libcuvs' 'python-pylibraft')
    cd "$srcdir/$pkgbase-$pkgver/python/cuvs"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
