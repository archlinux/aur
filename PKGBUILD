# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>

pkgname=('cutlass' 'python-cutlass')
pkgver=3.2.2
pkgrel=3
pkgdesc='CUDA Templates for Linear Algebra Subroutines'
arch=('x86_64')
url='https://github.com/NVIDIA/cutlass'
license=('BSD-3-Clause')
groups=('nvidia')
depends=('cuda' 'cudnn')
makedepends=('cmake' 'git' 'ninja' 'python-setuptools' 'python-build'
             'python-installer' 'python-wheel')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/NVIDIA/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
        'cutlass.diff')
sha256sums=('aaa9719eb806b168695b34893faf4854bb6bc9e09f63f2d36772aaf35a8516e5' 'SKIP')

prepare() {
    cd cutlass-$pkgver
    patch -p1 -i ../cutlass.diff
}

build() {
    # export CUTLASS_NVCC_ARCHS=70,75,80,86,89,90,90a
    export PATH="/opt/cuda/bin:$PATH"
    cmake -S $pkgname-$pkgver -B $pkgname-$pkgver/build -G Ninja \
        -DCUTLASS_NVCC_ARCHS=86 \
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
