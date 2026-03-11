# Maintainer: crl <crl18039102576@126.com>

pkgbase=cuopt
pkgname=(cuopt python-cuopt)
pkgver=26.02.00
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
    '4dd647cddf0c674548a0ffd4598ab3684a609f173f2defa325cceb67beeffa1c'
    'bc77344200404f4e139a64a611412fa9c8aa69354c4fac46173257dc245a37bf'
    '0d7efedb556324377fd1f5a6d8508ae1a168e67139fcc4c8af91f2af1aedb93b'
)

prepare() {
    cd "$srcdir/$pkgbase-$pkgver"
    patch -p1 "cpp/CMakeLists.txt" < "$srcdir/system-lib.patch"
    patch -p1 "python/cuopt/CMakeLists.txt" < "$srcdir/missing-pkg.patch"
}


build() {
    cd "$srcdir/$pkgbase-$pkgver"
    export CXXFLAGS+=" -DCCCL_IGNORE_DEPRECATED_STREAM_REF_HEADER"
    export CUDAFLAGS+=" -DCCCL_IGNORE_DEPRECATED_STREAM_REF_HEADER"
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
