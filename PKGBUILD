# Maintainer: crl <crl18039102576@126.com>

pkgbase=libcudf
pkgname=(libcudf python-pylibcudf)
pkgver=26.08.00
pkgrel=1
pkgdesc="cuDF - GPU DataFrame Library"
url="https://github.com/rapidsai/cudf"
arch=('x86_64')
license=('Apache-2.0')
depends=('cuda' 'rmm' 'nvtx3' 'dlpack' 'kvikio' 'zstd' 'rapids-logger' 'nvcomp')
makedepends=('cuda' 'python-setuptools' 'cmake' 'python-scikit-build-core' 'python-rapids-build-backend' 'ninja' 'cython' 'cucollections')
_rtcx_url=https://github.com/rapidsai/librtcx
_rtcx_commit=efad266c1fd9de6d8486c6ba71bfa74df063eb1f
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz"
    "$_rtcx_url/archive/$_rtcx_commit.tar.gz"
    "cuda-flags.patch"
    "system-lib.patch" 
    "missing-pkg.patch"
    "fix-bs-thread-pool.patch"
    "fix-cuco.patch"
    "fix-rtcx-include.patch"
)
sha256sums=('949b2821660bfdd68409c024ada47132776a14cdc09f642c9efc0b4ac0ea2998'
            '8283d55fd07e2da87629709eb77fdbd78aceded6f289a7900799145587a1efc1'
            '565ea2d0c080a97e990091ef3d695d7e8a16d041cb8475a43a6aa7f6e346738b'
            'e749ac2e0414c063e3fa2087413b4de16bd5d0407759bd0109d33e548f10b126'
            '496341c903486a9fef4fcd52ebbd0cbf33b5e1d6113279cdbc22771cfbcd91ea'
            '26e18df681c5e30aad6579350e829b68023bc2789a04c14b2afa31950563cad3'
            'cc9ff917306eb372c12b0ab78bd8955bbe639662b1c2422701f1422403ec6320'
            'd312f9f20483ef2643123bb7d095a192781fe907dbcdc8160ffc7941023d7c03')

prepare() {
    cd "$srcdir/cudf-$pkgver"
    ln -srfT "$srcdir/librtcx-$_rtcx_commit" cpp/librtcx
    #patch -p1 "cpp/cmake/Modules/ConfigureCUDA.cmake" < "$srcdir/cuda-flags.patch"
    patch -p1 "cpp/CMakeLists.txt" < "$srcdir/system-lib.patch"
    patch -p1 "python/pylibcudf/CMakeLists.txt" < "$srcdir/missing-pkg.patch"
    patch -p1 "cpp/cmake/Modules/AddFragment.cmake" < "$srcdir/fix-bs-thread-pool.patch"
    patch -p0 < "$srcdir/fix-cuco.patch"
    patch -p1 "cpp/librtcx/embed.hpp" < "$srcdir/fix-rtcx-include.patch"
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
    rm "$pkgdir/usr/lib/librtcx.a"
}

package_python-pylibcudf() {
    depends+=('libcudf' 'python' 'python-rmm')
    cd "$srcdir/cudf-$pkgver/python/pylibcudf"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
