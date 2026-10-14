# Maintainer: crl <crl18039102576@126.com>

pkgbase=cuvs
pkgname=(libcuvs python-cuvs)
pkgver=26.10.00
pkgrel=1
pkgdesc="cuVS - a library for vector search and clustering on the GPU"
url="https://github.com/NVIDIA/cuvs"
arch=('x86_64')
license=('Apache-2.0')
depends=('cuda' 'rmm' 'libraft' 'dlpack' 'kvikio')
makedepends=('cuda' 'python-setuptools' 'cmake' 'python-scikit-build-core' 'python-rapids-build-backend' 'ninja' 'cython' 'cucollections')
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz" 
    "system-lib.patch"
    "missing-pkg.patch"
    "system-dlpack.patch"
    "missing-include.patch"
    "disable-warning.patch"
)
sha256sums=('cb00ebb793d4832cc2fb8ce8e3ad90d56bf5197dad9a911e464c0d2733d8989c'
            '9825a0b62797856b166a1fb60f940497263bf04aef891d0f1be3c6e31c0b60fa'
            '39dc828373f8583ca29e13eeafb68230a95deaba5a682b1aa0c732a8830e727f'
            '4391f34eab05396af8a6c6dac3cf918ae4fe0200c7a302052225be22950d820b'
            '052865d777b4404ae68bd1272af301484adb70a8d9ab989287e2c59102011ac8'
            '926b6540d21e6c964528b0eb235cca26690c7504cf52eed4a8098404b855d880')

prepare() {
    cd "$srcdir/$pkgbase-$pkgver"
    patch -p1 "cpp/CMakeLists.txt" < "$srcdir/system-lib.patch"
    patch -p1 "c/CMakeLists.txt" < "$srcdir/system-dlpack.patch"
    patch -p1 "cpp/include/cuvs/util/file_io.hpp" < "$srcdir/missing-include.patch"
    patch -p1 "python/cuvs/CMakeLists.txt" < "$srcdir/missing-pkg.patch"
    patch -p1 "cpp/cmake/modules/ConfigureCUDA.cmake" < "$srcdir/disable-warning.patch"
}


build() {
    cd "$srcdir/$pkgbase-$pkgver"
    CXX_FLAGS+=" -DCCCL_IGNORE_DEPRECATED_STREAM_REF_HEADER"
    CUDA_FLAGS="-DCCCL_IGNORE_DEPRECATED_STREAM_REF_HEADER"
    cmake -B build -S cpp \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CUDA_ARCHITECTURES="native" \
        -DBUILD_TESTS=OFF \
        -DCUVS_COMPILE_DYNAMIC_ONLY=ON \
        -G Ninja
    cmake --build build

    cd "$srcdir/$pkgbase-$pkgver/python/cuvs"
    export cuvs_DIR="$srcdir/$pkgbase-$pkgver/build"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package_libcuvs() {
    depends+=('dlpack')
    cd "$srcdir/$pkgbase-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
    rm -rf "$pkgdir/usr/include/rtcx"
    rm -rf "$pkgdir/usr/include/zdict.h"
    rm -rf "$pkgdir/usr/include/zstd.h"
    rm -rf "$pkgdir/usr/include/zstd_errors.h"
    rm -rf "$pkgdir/usr/lib/pkgconfig"
    rm -rf "$pkgdir/usr/lib/librtcx.a"
    rm -rf "$pkgdir/usr/lib/libzstd.a"
    rm -rf "$pkgdir/usr/lib/cmake/rtcx"
    rm -rf "$pkgdir/usr/lib/cmake/zstd"
    rm -rf "$pkgdir/usr/share"
}

package_python-cuvs() {
    depends+=('libcuvs' 'python-pylibraft')
    cd "$srcdir/$pkgbase-$pkgver/python/cuvs"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
