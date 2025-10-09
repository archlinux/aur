# Maintainer: crl <crl18039102576@126.com>

pkgbase=cugraph
pkgname=(cugraph python-pylibcugraph python-cugraph)
pkgver=25.10.00
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
    "cuda-compile.cmake"
)
sha256sums=(
    'caab5b66a2429587970618d50b889f5101d58f044ac98c117f7d7b6822a40188'
    '6019d799a70152c2bca96475b63535fbaeb512d9aae24e1a3ebe8d39d0c59ce1'
    'cf9d3bbb9ac0a12c4883059ce23531c3f10886f65c8d2b4559fd7c5193d3940c'
    'b759943003c8351ec3358f935521fccec2b2e898f44b09ad00eb9f6aa226e3be'
    '981f331cf8adb39ef25aff0c4e77f65e0732c45316a54abfa0ac4c9142d59c8d'
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
