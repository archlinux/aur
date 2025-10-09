# Maintainer: crl <crl18039102576@126.com>

pkgbase=libcudf
pkgname=(libcudf python-pylibcudf)
pkgver=25.10.00
pkgrel=1
pkgdesc="cuDF - GPU DataFrame Library"
url="https://github.com/rapidsai/cudf"
arch=('x86_64')
license=('Apache-2.0')
depends=('cuda' 'rmm' 'nvtx3' 'dlpack' 'kvikio' 'zstd' 'rapids-logger' 'nvcomp')
makedepends=('cuda' 'python-setuptools' 'cmake' 'python-scikit-build-core' 'python-rapids-build-backend' 'ninja' 'cython')
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz"
    "cuda-flags.patch"
    "system-lib.patch" 
    "missing-pkg.patch"
    "missing-include.patch"
)
sha256sums=(
    '110c01acb24c94a005d6337e27c273e80109d38354e0e3b9fab5a432de5ee97d'
    '565ea2d0c080a97e990091ef3d695d7e8a16d041cb8475a43a6aa7f6e346738b'
    'e084172285cd947e8f6e84e0f3c5868c683adc57420b53bfb62798b85e674478'
    '2958c6575d6aad29fb344f5d85c36975c8d7ba2d7a38a8ec1114679f67bd194f'
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
}

package_python-pylibcudf() {
    depends+=('libcudf' 'python' 'python-rmm')
    cd "$srcdir/cudf-$pkgver/python/pylibcudf"
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm "$pkgdir/usr/lib/python3.13/site-packages/include" -rf
    rm "$pkgdir/usr/lib/python3.13/site-packages/lib" -rf
}
