# Maintainer: crl <crl18039102576@126.com>

pkgbase=cugraph
pkgname=(cugraph python-pylibcugraph python-cugraph)
pkgver=25.06.00
pkgrel=1
pkgdesc="cuGraph - RAPIDS Graph Analytics Library"
url="https://github.com/rapidsai/cugraph"
arch=('x86_64')
license=('Apache-2.0')
depends=('cuda' 'libraft')
makedepends=('cuda' 'python-setuptools' 'cmake' 'python-scikit-build-core' 'python-rapids-build-backend' 'ninja' 'cython')
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz" 
    "system-lib.patch"
    "missing-include.patch"
    "missing-pkg.patch"
)
sha256sums=(
    '40a6df1b3f33b892ebab6e276d9e1a6b7797eb61420cdce52c0b9890710fb130'
    'SKIP'
    'SKIP'
    'SKIP'
)

prepare() {
    cd "$srcdir/$pkgbase-$pkgver"
    patch -p1 "cpp/CMakeLists.txt" < "$srcdir/system-lib.patch"
    patch -p1 "cpp/src/c_api/resource_handle.hpp" < "$srcdir/missing-include.patch"
    patch -p1 "python/pylibcugraph/CMakeLists.txt" < "$srcdir/missing-pkg.patch"
    patch -p1 "python/cugraph/CMakeLists.txt" < "$srcdir/missing-pkg.patch"
}


build() {
    cd "$srcdir/$pkgbase-$pkgver"
    cmake -B build -S cpp \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CUDA_ARCHITECTURES="native" \
        -DCUGRAPH_COMPILE_RAFT_LIB=OFF \
        -DBUILD_TESTS=OFF \
        -G Ninja
    cmake --build build -j 10

    cd "$srcdir/$pkgbase-$pkgver/python/pylibcugraph"
    export cugraph_DIR="$srcdir/$pkgbase-$pkgver/build"
    python -m build --wheel --no-isolation --skip-dependency-check

    cd "$srcdir/$pkgbase-$pkgver/python/cugraph"
    export cugraph_DIR="$srcdir/$pkgbase-$pkgver/build"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package_cugraph() {
    cd "$srcdir/$pkgbase-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
}

package_python-pylibcugraph() {
    depends+=('python' 'cugraph')
    cd "$srcdir/$pkgbase-$pkgver/python/pylibcugraph"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

package_python-cugraph() {
    depends+=('python' 'cugraph' 'python-pylibcugraph' 'python-dask-cudf' 'python-dask-cuda'
        'python-pylibcudf' 'python-rmm' 'python-raft-dask')
    cd "$srcdir/$pkgbase-$pkgver/python/cugraph"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
