# Maintainer: crl <crl18039102576@126.com>

pkgbase=ucxx
pkgname=(ucxx python-ucxx)
pkgver=0.44.00
pkgrel=1
pkgdesc="UCXX is an object-oriented C++ interface for UCX, with native support for Python bindings."
url="https://github.com/rapidsai/ucxx"
arch=('x86_64')
license=('Apache-2.0')
depends=('rmm')
makedepends=('cuda' 'python-setuptools' 'cmake' 'python-scikit-build-core' 'python-rapids-build-backend' 'ninja' 'cython')
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz" 
    "system-lib.patch"
    "missing-pkg.patch"
    "missing-pkg-py.patch"
)
sha256sums=(
    '79a1f343185f1d4bd0a8d721f53b6b3864cb4c6dfca0909cb6bbb6dea31337e5'
    'SKIP'
    'SKIP'
    'SKIP'
)

prepare() {
    cd "$srcdir/$pkgbase-$pkgver"
    patch -p1 "cpp/CMakeLists.txt" < "$srcdir/system-lib.patch"
    patch -p1 "python/ucxx/CMakeLists.txt" < "$srcdir/missing-pkg.patch"
    patch -p1 "cpp/python/CMakeLists.txt" < "$srcdir/missing-pkg-py.patch"
}


build() {
    cd "$srcdir/$pkgbase-$pkgver"
    cmake -B build -S cpp \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CUDA_ARCHITECTURES="native" \
        -DUCXX_ENABLE_RMM=ON \
        -DBUILD_TESTS=OFF \
        -G Ninja
    cmake --build build

    export ucxx_DIR="$srcdir/$pkgbase-$pkgver/build"
    cmake -B build_python -S cpp/python \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_CUDA_ARCHITECTURES="native" \
        -DFIND_UCXX_CPP=ON \
        -G Ninja
    cmake --build build_python

    cd "$srcdir/$pkgbase-$pkgver/python/ucxx"
    export ucxx_DIR="$srcdir/$pkgbase-$pkgver/build"
    export CMAKE_PREFIX_PATH=CMAKE_PREFIX_PATH:"$srcdir/$pkgbase-$pkgver/build_python"
    export FIND_UCXX_PYTHON="ON"
    python -m build --wheel --no-isolation --skip-dependency-check
}

package_ucxx() {
    cd "$srcdir/$pkgbase-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
}

package_python-ucxx() {
    depends+=('python' 'python-rmm' 'python-numpy' 'python-pynvml' 'ucxx')

    cd "$srcdir/$pkgbase-$pkgver"
    DESTDIR="$pkgdir" cmake --install build_python

    cd "$srcdir/$pkgbase-$pkgver/python/ucxx"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
