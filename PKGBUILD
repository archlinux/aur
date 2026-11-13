# Maintainer: crl <crl18039102576@126.com>

pkgbase=cuopt
pkgname=(cuopt python-cuopt)
pkgver=26.10.01
pkgrel=1
pkgdesc="NVIDIA cuOpt is an open-source GPU-accelerated optimization engine delivering near real-time solutions for complex decision-making challenges."
url="https://github.com/NVIDIA/cuopt"
arch=('x86_64')
license=('Apache-2.0')
depends=('cuda' 'rmm' 'libraft' 'argparse' 'cudss>=1.0' 'protobuf')
makedepends=('cuda' 'python-setuptools' 'python-build' 'python-installer' 'cmake' 'python-scikit-build-core' 'python-rapids-build-backend' 'ninja' 'cython' 'gcc')
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz" 
    "system-lib.patch"
    "missing-pkg.patch"
    "fix-nvcc-dependent-value-type.patch"
    "cudss-1.0.patch"
)
sha256sums=('d247b4d19bd284cc80b6e215a7e800beabf3804f05025c37f6a64f4ff3ccafd3'
            '6cdead3b18e784c5b8654239be1bdb02862d4c37d5d4c2798f6d111c8ccb7829'
            '162f42f35f0727f68f3890f454749e04f129b023c06e0fdf99122b1d4de3ca0c'
            'cdc0181943c79531760ec98346b86b75e90ae2332d821bc4d7187ae8dd3fb77a'
            '9933407d154a9f24f640214bc065a8326a3baf8ba71a73f0f72404b669ee632f')

prepare() {
    cd "$srcdir/$pkgbase-$pkgver"
    patch -p1 "cpp/CMakeLists.txt" < "$srcdir/system-lib.patch"
    patch -p1 "python/cuopt/CMakeLists.txt" < "$srcdir/missing-pkg.patch"
    patch -p1 < "$srcdir/cudss-1.0.patch"
    #patch -p1 < "$srcdir/fix-nvcc-dependent-value-type.patch"
}


build() {
    cd "$srcdir/$pkgbase-$pkgver"
    export CXXFLAGS+=" -DCCCL_IGNORE_DEPRECATED_STREAM_REF_HEADER -Wno-error=cpp"
    export CUDAFLAGS+=" -DCCCL_IGNORE_DEPRECATED_STREAM_REF_HEADER -Wno-error=cpp -Wno-error=maybe-uninitialized"
    cmake -B build -S cpp \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CUDA_HOST_COMPILER=g++ \
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
    
    #rm "$pkgdir/usr/lib/cmake/papilo" -rf
    #rm "$pkgdir/usr/include/papilo" -rf
    #rm "$pkgdir/usr/lib/libpapilo-core.a" -rf
}

package_python-cuopt() {
    depends+=('python' 'python-cupy' 'python-cudf' 'python-numpy' 'python-rmm' 'python-raft-dask' 'cuopt')
    cd "$srcdir/$pkgbase-$pkgver/python/cuopt"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
