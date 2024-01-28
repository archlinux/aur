# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=nntile
pkgver=1.0.0
pkgrel=1
pkgdesc='A neural network training framework within a task-based parallel programming paradigm'
arch=('x86_64')
url='https://github.com/skolai/nntile'
license=('MIT')
groups=()
depends=('openblas' 'openmpi')
makedepends=('cmake' 'clang' 'ninja' 'hwloc' 'python-build' 'python-installer' 'python-wheel' 'python-setuptools')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
        'python-nntile.diff')
sha256sums=('78ca839f60326984c95e14e2efbedeb03933f0c5f66210a5c5446bd1da23a0fd'
            'SKIP')

prepare() {
    cd NNTile-$pkgver
    patch -p0 -i../python-nntile.diff
}

build() {
    cd $srcdir/NNTile-$pkgver
    export MPICH_CXX=clang++
    cmake -B build/relwithdebinfo -S . -G Ninja \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_CXX_COMPILER=clang++ \
        -DCMAKE_CUDA_ARCHITECTURES=80
    cmake --build build/relwithdebinfo

    # Build python bindings.
    cd build/relwithdebinfo/wrappers/python
    python -m build -nw .
}

package() {
    # Install nntile's binaries.
    cd $srcdir/NNTile-$pkgver
    cmake --install build/relwithdebinfo --prefix $pkgdir/usr

    # Install missing files manually.
    cd $srcdir/NNTile-$pkgver
    install -m 755 -D -t $pkgdir/usr/lib build/relwithdebinfo/libnntile.so

    # Install nntile's python bindings.
    cd $srcdir/NNTile-$pkgver/build/relwithdebinfo/wrappers/python
    python -m installer \
        --compile-bytecode=1 \
        --destdir=$pkgdir \
        dist/nntile-0.0.0-*-*-*.whl
}
