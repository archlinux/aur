# Maintainer: crl <crl18039102576@126.com>

pkgbase=libcudf
pkgname=(libcudf python-pylibcudf)
pkgver=25.06.00
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
    "missing-pkg.patch")
sha256sums=(
    '4fdcac02be1e0022643a1cd2afa9bae6091bb7d7525cdf0edb9d481bca737fa2'
    '565ea2d0c080a97e990091ef3d695d7e8a16d041cb8475a43a6aa7f6e346738b'
    '32fac59e66a87cbdaec3bb6fd146820da3a4786f13ab7c70e968be0af170850a'
    '8ca709d703becf7f4668f14163980c3fe5980d08d4a21d53cc46139037b907c1'
)

_delete_file() {
    local file="$1"
    local real_file

    if [ ! -e "$file" ]; then
        return 0
    fi

    while [ -L "$file" ]; do
        real_file=$(readlink -f "$file")
        rm -f "$file" || return 1
        file="$real_file"
    done

    rm -f "$file" || return 1

    return 0
}

prepare() {
    cd "$srcdir/cudf-$pkgver"
    patch -p1 "cpp/cmake/Modules/ConfigureCUDA.cmake" < "$srcdir/cuda-flags.patch"
    patch -p1 "cpp/CMakeLists.txt" < "$srcdir/system-lib.patch"
    patch -p1 "python/pylibcudf/CMakeLists.txt" < "$srcdir/missing-pkg.patch"
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
    cd "$srcdir/cudf-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
    rm "$pkgdir/usr/lib/pkgconfig" -r
    rm "$pkgdir/usr/lib/cmake/zstd" -r
    rm "$pkgdir/usr/lib/cmake/nvcomp" -rf
    rm "$pkgdir/usr/include/nvcomp" -rf
    rm "$pkgdir/usr/include/nvcomp_export.h" -f
    rm "$pkgdir/usr/lib/libzstd.a"
    rm "$pkgdir/usr/include/zstd.h"
    rm "$pkgdir/usr/include/zstd_errors.h"
    rm "$pkgdir/usr/include/zdict.h"
    rm "$pkgdir/usr/lib/libnvcomp_static.a" -f
    rm "$pkgdir/usr/lib/libnvcomp_cpu_static.a" -f
    rm "$pkgdir/usr/lib/libnvcomp_device_static.a" -f

    _delete_file "$pkgdir/usr/lib/libnvcomp.so"
    _delete_file "$pkgdir/usr/lib/libnvcomp_cpu.so"
}

package_python-pylibcudf() {
    depends+=('libcudf' 'python' 'python-rmm')
    cd "$srcdir/cudf-$pkgver/python/pylibcudf"
    python -m installer --destdir="$pkgdir" dist/*.whl
    rm "$pkgdir/usr/lib/python3.13/site-packages/include" -rf
    rm "$pkgdir/usr/lib/python3.13/site-packages/lib" -rf
}
