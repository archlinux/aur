# Maintainer: crl <crl18039102576@126.com>

pkgbase=ucxx
pkgname=(ucxx python-ucxx)
pkgver=0.51.00
pkgrel=1
pkgdesc="UCXX is an object-oriented C++ interface for UCX, with native support for Python bindings."
url="https://github.com/rapidsai/ucxx"
arch=('x86_64')
license=('BSD-3-Clause')
depends=('rmm')
makedepends=('cuda' 'python-setuptools' 'cmake' 'python-scikit-build-core' 'python-rapids-build-backend' 'ninja' 'cython')
source=(
    "$url/archive/refs/tags/v$pkgver.tar.gz" 
    "system-lib.patch"
    "missing-pkg.patch"
    "missing-pkg-py.patch"
)
sha256sums=('6b24b1c4bfedb5cbcf8b6684386a752c7b01e81b9c2fbc6064b0e4ef2fb46f5f'
            '0652a81976fa893f49facbd6206b95435e16d6341ef73563159686fc8e1d20cc'
            'c67de52077f6c9e5be639bf39f3a10d7e3f91acbc275cdf0df47b00261d41044'
            '033dcabf8fca36c7658a375688182d6ce157327f4075c16e61679cd89d68a09e')

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
        -DUCXX_ENABLE_CCCL=ON \
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
