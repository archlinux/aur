# Maintainer: crl <crl18039102576@126.com>

pkgbase=cuopt
pkgname=(cuopt python-cuopt)
pkgver=25.12.00
pkgrel=1
pkgdesc="NVIDIA cuOpt is an open-source GPU-accelerated optimization engine delivering near real-time solutions for complex decision-making challenges."
url="https://github.com/NVIDIA/cuopt"
arch=('x86_64')
license=('Apache-2.0')
depends=('cuda' 'rmm' 'libraft' 'argparse' 'cudss')
makedepends=('cuda' 'python-setuptools' 'cmake' 'python-scikit-build-core' 'python-rapids-build-backend' 'ninja' 'cython' 'gcc')
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz" 
    "system-lib.patch"
    "missing-pkg.patch"
)
sha256sums=(
    'f2a5a26ce349fff4da0608a5ebce836620db16e14a88462984fae7cae763f467'
    '30a0152c5e7ea633260154cb00964013bca28042f029ab356d0c039be9ab1edb'
    '7a1084085c7fbbae7a29bb542c69d0d1a4dd9b7fe00f003726e2051819a20791'
)

prepare() {
    cd "$srcdir/$pkgbase-$pkgver"
    patch -p1 "cpp/CMakeLists.txt" < "$srcdir/system-lib.patch"
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

    rm "$srcdir/$pkgbase-$pkgver/python/cuopt/cuopt/linear_programming/build" -rf

    cd "$srcdir/$pkgbase-$pkgver/python/cuopt"
    export cuopt_DIR="$srcdir/$pkgbase-$pkgver/build"
    python -m build --wheel --no-isolation --skip-dependency-check

    cd "$srcdir/$pkgbase-$pkgver/python/cuopt/cuopt/linear_programming"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package_cuopt() {
    cd "$srcdir/$pkgbase-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
    
    rm "$pkgdir/usr/lib/cmake/papilo" -rf
    rm "$pkgdir/usr/include/papilo" -rf
    rm "$pkgdir/usr/lib/libpapilo-core.a" -rf
}

package_python-cuopt() {
    depends+=('python' 'python-cupy' 'python-cudf' 'python-numpy' 'python-rmm' 'python-raft-dask' 'cuopt')
    cd "$srcdir/$pkgbase-$pkgver/python/cuopt"
    python -m installer --destdir="$pkgdir" dist/*.whl

    cd "$srcdir/$pkgbase-$pkgver/python/cuopt/cuopt/linear_programming"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
