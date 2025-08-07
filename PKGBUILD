# Maintainer: crl <crl18039102576@126.com>

pkgbase=cuopt
pkgname=(cuopt python-cuopt)
pkgver=25.08.00
pkgrel=1
pkgdesc="NVIDIA cuOpt is an open-source GPU-accelerated optimization engine delivering near real-time solutions for complex decision-making challenges."
url="https://github.com/NVIDIA/cuopt"
arch=('x86_64')
license=('Apache-2.0')
depends=('cuda' 'rmm' 'libraft' 'argparse')
makedepends=('cuda' 'python-setuptools' 'cmake' 'python-scikit-build-core' 'python-rapids-build-backend' 'ninja' 'cython' 'gcc')
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz" 
    "system-lib.patch"
    "missing-include1.patch"
    "missing-include2.patch"
    "missing-pkg.patch"
)
sha256sums=(
    'fdcfebc71b1dde2139f509e94f8603b340a182dc18d86389e02f62d9e300c741'
    'b96f17301f1af5708a5aedd885f706fa0bb2421c376eeba3471194fb75c2c25e'
    'fa94538b93f81b600211960ca177cff9d4a5f844ad7e2b58831ccef1b39e2997'
    '6bd66d35a773657c1a167e03439461c980cc68eade5f52d2a9220a1422761412'
    '610ba3039ace086041cf0f8cc75fcbc61f38a7a68a3d076e45a23849f812f43d'
)

prepare() {
    cd "$srcdir/$pkgbase-$pkgver"
    patch -p1 "cpp/CMakeLists.txt" < "$srcdir/system-lib.patch"
    patch -p1 "cpp/src/linear_programming/solver_settings.cu" < "$srcdir/missing-include1.patch"
    patch -p1 "cpp/include/cuopt/routing/distance_engine/waypoint_matrix.hpp" < "$srcdir/missing-include2.patch"
    patch -p1 "python/cuopt/CMakeLists.txt" < "$srcdir/missing-pkg.patch"
}


build() {
    cd "$srcdir/$pkgbase-$pkgver"
    cmake -B build -S cpp \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CUDA_ARCHITECTURES="native" \
        -DBUILD_TESTS=OFF \
        -DFETCH_RAPIDS=OFF \
        -DCMAKE_CUDA_LINEINFO=OFF \
        -DBUILD_BENCHMARKS=OFF \
        -G Ninja
    cmake --build build

    cd "$srcdir/$pkgbase-$pkgver/python/cuopt"
    export cuopt_DIR="$srcdir/$pkgbase-$pkgver/build"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package_cuopt() {
    cd "$srcdir/$pkgbase-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
}

package_python-cuopt() {
    depends+=('python' 'python-cupy' 'python-cudf' 'python-numpy' 'python-rmm' 'python-raft-dask' 'cuopt')
    cd "$srcdir/$pkgbase-$pkgver/python/cuopt"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
