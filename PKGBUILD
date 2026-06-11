# Maintainer: crl <crl18039102576@126.com>

pkgbase=libcudf
pkgname=(libcudf python-pylibcudf)
pkgver=26.06.01
pkgrel=1
pkgdesc="cuDF - GPU DataFrame Library"
url="https://github.com/rapidsai/cudf"
arch=('x86_64')
license=('Apache-2.0')
depends=('cuda' 'rmm' 'nvtx3' 'dlpack' 'kvikio' 'zstd' 'rapids-logger' 'nvcomp')
makedepends=('cuda' 'python-setuptools' 'cmake' 'python-scikit-build-core' 'python-rapids-build-backend' 'ninja' 'cython' 'cucollections')
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz"
    "cuda-flags.patch"
    "system-lib.patch" 
    "missing-pkg.patch"
    "missing-include.patch"
)
sha256sums=(
    'f22f06286d9a332bc7b4e399bbd2b105471240c95297ad21daee17255bc2f0f6'
    '565ea2d0c080a97e990091ef3d695d7e8a16d041cb8475a43a6aa7f6e346738b'
    'a4e305ca3c946240c215f7191134301a592af98c6d0fec70cd6a7d211fa1528c'
    '496341c903486a9fef4fcd52ebbd0cbf33b5e1d6113279cdbc22771cfbcd91ea'
    '9c5c21ce596e3ec7dc0831ae2c5ab71d733f4ddcb917ea8c4d55e7c02dd40baa'
)

prepare() {
    cd "$srcdir/cudf-$pkgver"
    #patch -p1 "cpp/cmake/Modules/ConfigureCUDA.cmake" < "$srcdir/cuda-flags.patch"
    patch -p1 "cpp/CMakeLists.txt" < "$srcdir/system-lib.patch"
    patch -p1 "python/pylibcudf/CMakeLists.txt" < "$srcdir/missing-pkg.patch"
    patch -p1 "cpp/src/jit/row_ir.hpp" < "$srcdir/missing-include.patch"
}


build() {
    cd "$srcdir/cudf-$pkgver"
    export CXXFLAGS="$CXXFLAGS -DCCCL_IGNORE_DEPRECATED_STREAM_REF_HEADER"
    export CUDAFLAGS="$CUDAFLAGS -DCCCL_IGNORE_DEPRECATED_STREAM_REF_HEADER"
    cmake -B build -S cpp \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CUDA_ARCHITECTURES='native' \
        -DCUDA_WARNINGS_AS_ERRORS=OFF \
        -DBUILD_TESTS=OFF \
        -DCUDF_BUILD_TESTUTIL=OFF \
        -DCUDF_BUILD_STREAMS_TEST_UTIL=OFF \
        -G Ninja
    cmake --build build


    cd "$srcdir/cudf-$pkgver/python/pylibcudf"
    export CMAKE_CUDA_ARCHITECTURES='native'
    export cudf_DIR="$srcdir/cudf-$pkgver/build"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package_libcudf() {
    depends+=('cucollections')

    cd "$srcdir/cudf-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
}

package_python-pylibcudf() {
    depends+=('libcudf' 'python' 'python-rmm')
    cd "$srcdir/cudf-$pkgver/python/pylibcudf"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
