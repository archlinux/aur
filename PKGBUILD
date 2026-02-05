# Maintainer: crl <crl18039102576@126.com>

pkgbase=cuvs
pkgname=(libcuvs python-cuvs)
pkgver=25.12.00
pkgrel=2
pkgdesc="cuVS - a library for vector search and clustering on the GPU"
url="https://github.com/rapidsai/cuvs"
arch=('x86_64')
license=('Apache-2.0')
depends=('cuda' 'rmm' 'libraft' 'dlpack')
makedepends=('cuda' 'python-setuptools' 'cmake' 'python-scikit-build-core' 'python-rapids-build-backend' 'ninja' 'cython')
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz" 
    "system-lib.patch"
    "missing-pkg.patch"
    "system-dlpack.patch"
    "missing-include.patch"
)
sha256sums=(
    '808caed1882584e58595dff9a9bcd58435414dcb38d1949dbd0a77cc6209bf1d'
    'd0b3c866682c68b624e7e39743eed196723be3182f1f946e24b51e4c7c7cd112'
    '4781db2b3b552e1bcae18a7ca80ba094c66fb5ad33f588423fb2c1f51331743c'
    '4391f34eab05396af8a6c6dac3cf918ae4fe0200c7a302052225be22950d820b'
    '052865d777b4404ae68bd1272af301484adb70a8d9ab989287e2c59102011ac8'
)

prepare() {
    cd "$srcdir/$pkgbase-$pkgver"
    patch -p1 "cpp/CMakeLists.txt" < "$srcdir/system-lib.patch"
    patch -p1 "c/CMakeLists.txt" < "$srcdir/system-dlpack.patch"
    patch -p1 "cpp/include/cuvs/util/file_io.hpp" < "$srcdir/missing-include.patch"
    patch -p1 "python/cuvs/CMakeLists.txt" < "$srcdir/missing-pkg.patch"
}


build() {
    cd "$srcdir/$pkgbase-$pkgver"
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
