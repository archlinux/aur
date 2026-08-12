# Maintainer: crl <crl18039102576@126.com>

pkgbase=cuvs
pkgname=(libcuvs python-cuvs)
pkgver=26.08.00
pkgrel=1
pkgdesc="cuVS - a library for vector search and clustering on the GPU"
url="https://github.com/rapidsai/cuvs"
arch=('x86_64')
license=('Apache-2.0')
depends=('cuda' 'rmm' 'libraft' 'dlpack')
makedepends=('cuda' 'python-setuptools' 'cmake' 'python-scikit-build-core' 'python-rapids-build-backend' 'ninja' 'cython' 'cucollections')
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz" 
    "system-lib.patch"
    "missing-pkg.patch"
    "system-dlpack.patch"
    "missing-include.patch"
    "disable-warning.patch"
    "fix-compile.patch"
    "fix-cuco.patch"
)
sha256sums=('d924b594ba8c0b177353a8346698a88b19b7e64fda622c962b713a9db9aafe7d'
            'd18e7391dfd2a7c4231b65d1fc89ece90d9c5f49e21bcb480cf6166f265b3541'
            '08089b4409698b5aeab59a248b7de325b9e8b9d788e2dcab7e22b88ec5194b0d'
            '4391f34eab05396af8a6c6dac3cf918ae4fe0200c7a302052225be22950d820b'
            '052865d777b4404ae68bd1272af301484adb70a8d9ab989287e2c59102011ac8'
            '926b6540d21e6c964528b0eb235cca26690c7504cf52eed4a8098404b855d880'
            '4a06a07695ef47815dda2d9a2f943440bd538b990ee7b34abf9e438fd006f231'
            'ac118d0eca93b57049ec429e626237f2843d96a75d64e9a13e38f6859df67905')

prepare() {
    cd "$srcdir/$pkgbase-$pkgver"
    patch -p1 "cpp/CMakeLists.txt" < "$srcdir/system-lib.patch"
    patch -p1 "c/CMakeLists.txt" < "$srcdir/system-dlpack.patch"
    patch -p1 "cpp/include/cuvs/util/file_io.hpp" < "$srcdir/missing-include.patch"
    patch -p1 "python/cuvs/CMakeLists.txt" < "$srcdir/missing-pkg.patch"
    patch -p1 "cpp/cmake/modules/ConfigureCUDA.cmake" < "$srcdir/disable-warning.patch"
    patch -p1 "cpp/src/preprocessing/quantize/detail/pq.cuh" < "$srcdir/fix-compile.patch"
    patch -p1 "cpp/src/core/bloom_filter.cu" < "$srcdir/fix-cuco.patch"
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
    # depends+=('dlpack')
    cd "$srcdir/$pkgbase-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
}

package_python-cuvs() {
    depends+=('libcuvs' 'python-pylibraft')
    cd "$srcdir/$pkgbase-$pkgver/python/cuvs"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
