# Maintainer: crl <crl18039102576@126.com>

pkgbase=cuvs
pkgname=(libcuvs python-cuvs)
pkgver=25.08.00
pkgrel=1
pkgdesc="cuVS - a library for vector search and clustering on the GPU"
url="https://github.com/rapidsai/cuvs"
arch=('x86_64')
license=('Apache-2.0')
depends=('cuda' 'rmm' 'libraft')
makedepends=('cuda' 'python-setuptools' 'cmake' 'python-scikit-build-core' 'python-rapids-build-backend' 'ninja' 'cython')
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz" 
    "system-lib.patch"
    "missing-pkg.patch"
)
sha256sums=(
    '38dc89b05989844c9facfae166a9d5dd0ebd09e392b76407912a837b2227b6b4'
    'dc8245ff88d62801e2212a03ff79a60d3597002367e770027330550580dc56f0'
    '09b82b02629e3abf276efba7932d537706e2b7ba9b3f955ba62088bc771d34f0'
)

prepare() {
    cd "$srcdir/$pkgbase-$pkgver"
    patch -p1 "cpp/CMakeLists.txt" < "$srcdir/system-lib.patch"
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
    depends+=('dlpack')
    cd "$srcdir/$pkgbase-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
}

package_python-cuvs() {
    depends+=('libcuvs' 'python-pylibraft')
    cd "$srcdir/$pkgbase-$pkgver/python/cuvs"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
