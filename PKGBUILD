# Maintainer: crl <crl18039102576@126.com>

pkgbase=libcudf
pkgname=(libcudf python-pylibcudf)
pkgver=26.02.01
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
    '4ee6bc2f41e0406e1c0e9c40e08e42580dfb2173bea4ad94d3d1af8f6b3f0166'
    '565ea2d0c080a97e990091ef3d695d7e8a16d041cb8475a43a6aa7f6e346738b'
    'cbe0e91241bb6394b1f45218c048833d67d5d4d2c875c2ae894c0f48a56ee9e7'
    '496341c903486a9fef4fcd52ebbd0cbf33b5e1d6113279cdbc22771cfbcd91ea'
    '9c5c21ce596e3ec7dc0831ae2c5ab71d733f4ddcb917ea8c4d55e7c02dd40baa'
)

prepare() {
    cd "$srcdir/cudf-$pkgver"
    patch -p1 "cpp/cmake/Modules/ConfigureCUDA.cmake" < "$srcdir/cuda-flags.patch"
    patch -p1 "cpp/CMakeLists.txt" < "$srcdir/system-lib.patch"
    patch -p1 "python/pylibcudf/CMakeLists.txt" < "$srcdir/missing-pkg.patch"
    patch -p1 "cpp/src/jit/row_ir.hpp" < "$srcdir/missing-include.patch"
}


build() {
    cd "$srcdir/cudf-$pkgver"
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
    rm "$pkgdir/usr/lib/pkgconfig" -r
    rm "$pkgdir/usr/lib/cmake/zstd" -r
    rm "$pkgdir/usr/lib/libzstd.a"
    rm "$pkgdir/usr/include/zstd.h"
    rm "$pkgdir/usr/include/zstd_errors.h"
    rm "$pkgdir/usr/include/zdict.h"
    rm "$pkgdir/usr/lib/libroaring.a"
    rm "$pkgdir/usr/include/roaring" -r
    rm "$pkgdir/usr/lib/cmake/roaring" -r
}

package_python-pylibcudf() {
    depends+=('libcudf' 'python' 'python-rmm')
    cd "$srcdir/cudf-$pkgver/python/pylibcudf"
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm "$pkgdir/usr/lib/python3.14/site-packages/include" -rf
    rm "$pkgdir/usr/lib/python3.14/site-packages/lib" -rf
}
