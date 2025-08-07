# Maintainer: crl <crl18039102576@126.com>

pkgbase=cuml
pkgname=(libcuml python-cuml)
pkgver=25.08.00
pkgrel=1
pkgdesc="cuML - RAPIDS Machine Learning Library"
url="https://github.com/rapidsai/cuml"
arch=('x86_64')
license=('Apache-2.0')
depends=('cuda' 'rmm' 'libraft' 'libcuvs' 'rapidjson')
makedepends=('cuda' 'python-setuptools' 'cmake' 'python-scikit-build-core' 'python-rapids-build-backend' 'ninja' 'cython')
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz" 
    "system-lib.patch"
    "missing-include.patch"
    "missing-pkg.patch"
)
sha256sums=(
    'c40e6738633ae0feb6284888b1a844e536d3eb9f7abf24df1fa5c874d0c1c302'
    '4f166f88bd018ba552c78fc26e146f96b1fb78afa7a0eab2aa81c78835e9830f'
    'a876fafc0102dcaa43d331ec496e0a8f3f0af03071e0a691414a38219c384909'
    '53d5e9008bcc303034ea3bc4cf2f3f511c6adb6a9224a606385f6fb5c2e5f537'
)

prepare() {
    cd "$srcdir/$pkgbase-$pkgver"
    patch -p1 "cpp/CMakeLists.txt" < "$srcdir/system-lib.patch"
    patch -p1 "cpp/src/common/cumlHandle.hpp" < "$srcdir/missing-include.patch"
    patch -p1 "python/cuml/CMakeLists.txt" < "$srcdir/missing-pkg.patch"
}


build() {
    cd "$srcdir/$pkgbase-$pkgver"
    cmake -B build -S cpp \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CUDA_ARCHITECTURES="native" \
        -DBUILD_CUML_TESTS=OFF \
        -DBUILD_CUML_MG_TESTS=OFF \
        -DBUILD_PRIMS_TESTS=OFF \
        -DBUILD_CUML_EXAMPLES=OFF \
        -DBUILD_CUML_BENCH=OFF \
        -DENABLE_CUMLPRIMS_MG=OFF \
        -DLINK_CUVS=ON \
        -DCUVS_LIB="cuvs::cuvs" \
        -DSINGLEGPU=ON \
        -G Ninja
    cmake --build build

    cd "$srcdir/$pkgbase-$pkgver/python/cuml"
    export cuml_DIR="$srcdir/$pkgbase-$pkgver/build"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package_libcuml() {
    cd "$srcdir/$pkgbase-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
}

package_python-cuml() {
    depends+=('python' 'python-pylibraft' 'python-cuvs' 'python-treelite' 'libcuml' 'python-scikit-learn')
    cd "$srcdir/$pkgbase-$pkgver/python/cuml"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
