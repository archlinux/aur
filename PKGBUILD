# Maintainer: crl <crl18039102576@126.com>

pkgbase=cugraph
pkgname=(cugraph python-pylibcugraph python-cugraph)
pkgver=26.06.00
pkgrel=1
pkgdesc="cuGraph - RAPIDS Graph Analytics Library"
url="https://github.com/rapidsai/cugraph"
arch=('x86_64')
license=('Apache-2.0')
depends=('cuda' 'libraft' 'rmm' 'rapids-logger' 'libcuvs')
makedepends=('cuda' 'python-setuptools' 'cmake' 'python-scikit-build-core' 'python-rapids-build-backend' 'ninja' 'cython' 'cucollections')
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz" 
    "system-lib.patch"
    "missing-include.patch"
    "missing-pkg.patch"
)
sha256sums=(
    '82e5d7f1f1a09e6860560e4d0b18802eed8d66f3ca311b696c87c00cf5389c38'
    '70b1699c7439a9aca6b5987e1f5191ea09f2c202d34315c3004aa27d95678352'
    'cf9d3bbb9ac0a12c4883059ce23531c3f10886f65c8d2b4559fd7c5193d3940c'
    '25da2d862c4ceb202e45e5a36d2ce4fa977e45d91757160407c808ac5b6b8054'
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
    export CXXFLAGS="$CXXFLAGS -DCCCL_IGNORE_DEPRECATED_STREAM_REF_HEADER"
    export CUDAFLAGS="$CUDAFLAGS -DCCCL_IGNORE_DEPRECATED_STREAM_REF_HEADER"
    cmake -B build -S cpp \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CUDA_ARCHITECTURES="native" \
        -DCUGRAPH_COMPILE_RAFT_LIB=OFF \
        -DBUILD_TESTS=OFF \
        -G Ninja
    cmake --build build -j 15 # avoid OOM

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
