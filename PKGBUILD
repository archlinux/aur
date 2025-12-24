# Maintainer: crl <crl18039102576@126.com>

pkgbase=cuml
pkgname=(libcuml python-cuml)
pkgver=25.12.00
pkgrel=1
pkgdesc="cuML - RAPIDS Machine Learning Library"
url="https://github.com/rapidsai/cuml"
arch=('x86_64')
license=('Apache-2.0')
depends=('cuda' 'rmm' 'libraft' 'libcuvs' 'rapidjson' 'cumlprims-mg')
makedepends=('cuda' 'python-setuptools' 'cmake' 'python-scikit-build-core' 'python-rapids-build-backend' 'ninja' 'cython')
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz" 
    "system-lib.patch"
    "missing-include.patch"
    "missing-include2.patch"
    "missing-pkg.patch"
)
sha256sums=(
    '5512ec00f8590879dcbc66a89850a1e47c196857d7b52fafcaf6d350ea5bc490'
    'eef98e4572b886f58500d09854846defe6fc98b67c2ee4832d91a8468d46446c'
    'a876fafc0102dcaa43d331ec496e0a8f3f0af03071e0a691414a38219c384909'
    'e292e24a4dc3de5d0a723d61249cc547bbbdf2d3e42ee05885af54a06c07d520'
    'c0206eeaee662bd58ea8835fb25b0d8777e2522e729c3f8b380beb176ccdd99b'
)

prepare() {
    cd "$srcdir/$pkgbase-$pkgver"
    patch -p1 "cpp/CMakeLists.txt" < "$srcdir/system-lib.patch"
    patch -p1 "cpp/src/common/cumlHandle.hpp" < "$srcdir/missing-include.patch"
    patch -p1 "cpp/include/cuml/ensemble/randomforest.hpp" < "$srcdir/missing-include2.patch"
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
        -DLINK_CUVS=ON \
        -DCUVS_LIB="cuvs::cuvs" \
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
    depends+=('python' 'python-pylibraft' 'python-cuvs' 'treelite' 'python-treelite' 'libcuml' 'python-scikit-learn')
    cd "$srcdir/$pkgbase-$pkgver/python/cuml"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
