# Maintainer: crl <crl18039102576@126.com>

pkgbase=cuml
pkgname=(libcuml python-cuml)
pkgver=25.10.00
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
    "missing-include2.patch"
    "missing-pkg.patch"
)
sha256sums=(
    '470844b85f89bf4afab8cd05cd69a8769fdcf2c1e6b82e687f21bf2cf948b9ec'
    '7bc3fa6f1f21222afe100eb7a8ee57b948bf1b03eb7f944c6663d019f42e1ae3'
    'a876fafc0102dcaa43d331ec496e0a8f3f0af03071e0a691414a38219c384909'
    'e292e24a4dc3de5d0a723d61249cc547bbbdf2d3e42ee05885af54a06c07d520'
    '3740890159c6b92f3158dd7cd48418c862b5a5ac99d3cfb072aa37978be763ac'
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
    depends+=('python' 'python-pylibraft' 'python-cuvs' 'treelite' 'python-treelite' 'libcuml' 'python-scikit-learn')
    cd "$srcdir/$pkgbase-$pkgver/python/cuml"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
