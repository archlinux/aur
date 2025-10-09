# Maintainer: crl <crl18039102576@126.com>

pkgbase=ucxx
pkgname=(ucxx python-ucxx)
pkgver=0.46.00
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
    '29d04707a7650ccef6482e6a0aeadafa72f2e149d65886c4653255d456fc66b1'
    'efc9079c1463270d0c4b1ec2b0b2c24a9c77ade14dccbbe528017ed07ec52c09'
    'ea0613fc6785021571f0f10363e6bf72b6afdfd7d603cb20ca9d8868c9971ec5'
    'aff4c0a03dd50e2edf41a6a39119857772904e1c34f0f898c2b0b8bef7141517'
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
    depends+=('python' 'python-rmm' 'python-numpy' 'python-nvidia-ml-py' 'ucxx')

    cd "$srcdir/$pkgbase-$pkgver"
    DESTDIR="$pkgdir" cmake --install build_python

    cd "$srcdir/$pkgbase-$pkgver/python/ucxx"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
