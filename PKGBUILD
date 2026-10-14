# Maintainer: crl <crl18039102576@126.com>

pkgbase=cugraph
pkgname=(cugraph python-pylibcugraph python-cugraph)
pkgver=26.10.00
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
    "fix-cccl35-tuple-upper-bound.patch"
)
sha256sums=('403b96373b8150b6229dc18c149621a8d3d14acb9a51367fa6d441b34d4f0fac'
            'ffd9b9e6d54888ea3ae42381461fe7a8a6f7047c2dff25550d39adaacef1e621'
            'cf9d3bbb9ac0a12c4883059ce23531c3f10886f65c8d2b4559fd7c5193d3940c'
            '4f56e0bb4221923b51497f024905152f8e4009e4f7623d7b064798fb5d9d93e5'
            '2627ff54c6bedfea19d1eaaa66cfdb6e87962d7eb34a4fa9d28afd91b9f6a102')

prepare() {
    cd "$srcdir/$pkgbase-$pkgver"
    patch -p1 "cpp/CMakeLists.txt" < "$srcdir/system-lib.patch"
    patch -p1 "cpp/src/c_api/resource_handle.hpp" < "$srcdir/missing-include.patch"
    patch -p1 "python/pylibcugraph/CMakeLists.txt" < "$srcdir/missing-pkg.patch"
    patch -p1 "python/cugraph/CMakeLists.txt" < "$srcdir/missing-pkg.patch"
    patch -p1 "cpp/src/sampling/sampling_post_processing_impl.cuh" < "$srcdir/fix-cccl35-tuple-upper-bound.patch"
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
