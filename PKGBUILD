# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=('cutlass' 'python-cutlass')
pkgver=3.3.0
pkgrel=1
pkgdesc='CUDA Templates for Linear Algebra Subroutines'
arch=('x86_64')
url='https://github.com/NVIDIA/cutlass'
license=('BSD-3-Clause')
groups=()
depends=('cuda' 'cudnn')
makedepends=('cmake' 'git' 'ninja' 'pybind11' 'python-build'
             'python-installer' 'python-setuptools' 'python-wheel')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/NVIDIA/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        'cutlass.diff')
sha256sums=('99876de94a04d0b9cdee81d4f29659bde1426b416926aef4d9a3a3a7869511a3'
            'SKIP')

prepare() {
    cd cutlass-$pkgver
    patch -p1 -i ../cutlass.diff
}

build() {
    export PATH="/opt/cuda/bin:$PATH"
    cmake -S $pkgname-$pkgver -B $pkgname-$pkgver/build -G Ninja \
        -DCUTLASS_NVCC_ARCHS=70,75,80,86,89,90,90a \
        -DCUTLASS_ENABLE_GTEST_UNIT_TESTS=OFF \
        -DCUTLASS_ENABLE_TESTS=OFF \
        -DCUTLASS_ENABLE_CUBLAS=ON \
        -DCUTLASS_ENABLE_CUDNN=ON \
        -DCUTLASS_ENABLE_EXAMPLES=OFF \
        -DCUTLASS_INSTALL_TESTS=OFF \
        -DCUTLASS_UNITY_BUILD_ENABLED=ON
    cmake --build $pkgname-$pkgver/build

    # Make python-pycute wheel.
    cd $srcdir/$pkgname-$pkgver/python
    rm -rf build *.egg-info
    python setup_pycute.py bdist_wheel

    # Make python-cutlass-library wheel.
    cd $srcdir/$pkgname-$pkgver/python
    rm -rf build *.egg-info
    python setup_library.py bdist_wheel

    # Make python-cutlass wheel.
    cd $srcdir/$pkgname-$pkgver/python
    rm -rf build *.egg-info
    python -m build -nw .
}

package_cutlass() {
    cmake --install $srcdir/$pkgname-$pkgver/build --prefix $pkgdir/usr
    install -Dm644 \
        $srcdir/$pkgname-$pkgver/LICENSE.txt \
        $pkgdir/usr/share/licenses/$pkgname/LICENSE
    rm -rfv $pkgdir/usr/test
}

package_python-cutlass() {
    pkgdesc='Python interface to cutlass library'
    arch=('any')
    url='https://github.com/NVIDIA/cutlass'
    license=('BSD-3-Clause')
    groups=('nvidia')
    depends=('python-pydot' 'python-scikit-build' 'python-treelib')
    optdepends=()

    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        cutlass-$pkgver/python/dist/pycute-*.whl

    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        cutlass-$pkgver/python/dist/cutlass_library-*.whl

    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        cutlass-$pkgver/python/dist/cutlass-*.whl
}
