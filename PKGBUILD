# Maintainer: crl <crl18039102576@126.com>

pkgbase=libcudf
pkgname=(libcudf libcudf-streaming python-pylibcudf)
pkgver=26.10.00
pkgrel=1
pkgdesc="cuDF - GPU DataFrame Library"
url="https://github.com/NVIDIA/cudf"
arch=('x86_64')
license=('Apache-2.0')
depends=('cuda' 'rmm' 'nvtx3' 'dlpack' 'kvikio' 'zstd' 'rapids-logger' 'nvcomp')
makedepends=('cuda' 'python-setuptools' 'cmake' 'python-scikit-build-core' 'python-rapids-build-backend' 'ninja' 'cython' 'cucollections' 'rapidsmpf')
_rtcx_url=https://github.com/rapidsai/librtcx
_rtcx_commit=a9f63f8cdd4b0b41a2d88a9f705576a61b4222ec
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz"
    "$_rtcx_url/archive/$_rtcx_commit.tar.gz"
    "system-lib.patch" 
    "missing-pkg.patch"
    "fix-bs-thread-pool.patch"
    "fix-rtcx-include.patch"
    "fix-cudf-include.patch"
    "fix-int128-overload.patch"
    "fix-cython33-signatures.patch"
    "streaming-lib.patch"
)
sha256sums=('bfd7789bdea61ed92666ca059003fcb1b107cd1ba7dd241a1887e3c510d2d8da'
            'f00adc2b2b71cc78f659db27b546b41bfb29fc095af48db93bbd5e318ed80eea'
            '8aaca96cf35ed3c4a94687ee68a8a137679c0710e4388c92c8f5c182c8f48dbb'
            '496341c903486a9fef4fcd52ebbd0cbf33b5e1d6113279cdbc22771cfbcd91ea'
            '26e18df681c5e30aad6579350e829b68023bc2789a04c14b2afa31950563cad3'
            'd312f9f20483ef2643123bb7d095a192781fe907dbcdc8160ffc7941023d7c03'
            'c94b494b451298352cefe13861ccea65fd60c0c5456b3f004660cbfdd2947c56'
            '42c5ba486b6c43db90bcd6d5271dcd95243113c844a2150a28364bb093d2a16d'
            'cd9881175257cfdb3c24d9e1b5960c72caaa97c655baebbd2d4d0e9fb2893700'
            'dec1c893dd0573f4eb9442e2549e1b17f1336ccba487dfe3f17af6ba71376683')

prepare() {
    cd "$srcdir/cudf-$pkgver"
    ln -srfT "$srcdir/librtcx-$_rtcx_commit" cpp/librtcx
    #patch -p1 "cpp/cmake/Modules/ConfigureCUDA.cmake" < "$srcdir/cuda-flags.patch"
    patch -p1 "cpp/CMakeLists.txt" < "$srcdir/system-lib.patch"
    patch -p1 "python/pylibcudf/CMakeLists.txt" < "$srcdir/missing-pkg.patch"
    patch -p1 "cpp/cmake/Modules/AddFragment.cmake" < "$srcdir/fix-bs-thread-pool.patch"
    patch -p1 "cpp/librtcx/include/rtcx/embed.hpp" < "$srcdir/fix-rtcx-include.patch"
    patch -p1 "cpp/include/cudf/ast/expressions.hpp" < "$srcdir/fix-cudf-include.patch"
    patch -p1 "cpp/src/io/statistics/typed_statistics_chunk.cuh" < "$srcdir/fix-int128-overload.patch"
    patch -p0 < "$srcdir/fix-cython33-signatures.patch"
    patch -p1 "cpp/libcudf_streaming/CMakeLists.txt" < "$srcdir/streaming-lib.patch"
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

    export cudf_DIR="$srcdir/cudf-$pkgver/build"
    cmake -B build_streaming -S cpp/libcudf_streaming \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CUDA_ARCHITECTURES='native' \
        -DBUILD_TESTS=OFF \
        -DBUILD_BENCHMARKS=OFF \
        -DBUILD_EXAMPLES=OFF \
        -G Ninja
    cmake --build build_streaming

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

package_libcudf-streaming() {
    depends+=('libcudf' 'rapidsmpf' 'ucxx')
    pkgdesc="cuDF Streaming - GPU-accelerated streaming data processing (C++)"

    cd "$srcdir/cudf-$pkgver"
    DESTDIR="$pkgdir" cmake --install build_streaming
}

package_python-pylibcudf() {
    depends+=('libcudf' 'python' 'python-rmm')
    cd "$srcdir/cudf-$pkgver/python/pylibcudf"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
