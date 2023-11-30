# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=cutlass
pkgver=3.2.2
pkgrel=2
pkgdesc='CUDA Templates for Linear Algebra Subroutines'
arch=('x86_64')
url='https://github.com/NVIDIA/cutlass'
license=('Apache')
groups=('nvidia')
depends=('cuda' 'cudnn')
makedepends=('cmake' 'git' 'setuptools' 'python-installer')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/NVIDIA/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aaa9719eb806b168695b34893faf4854bb6bc9e09f63f2d36772aaf35a8516e5')

prepare() {
    export CUTLASS_NVCC_ARCHS=7.0,7.5,8.0,8.6,8.9,9.0
    export CUDACXX=/opt/cuda/bin/nvcc
}

build() {
    cmake -S $pkgname-$pkgver -B $pkgname-$pkgver/build \
        -DCUTLASS_ENABLE_CUBLAS=ON \
        -DCUTLASS_ENABLE_CUDNN=ON \
        -DCUTLASS_ENABLE_EXAMPLES=OFF \
        -DCUTLASS_INSTALL_TESTS=OFF \
        -DCUTLASS_UNITY_BUILD_ENABLED=ON
    cmake --build $pkgname-$pkgver/build
}

package() {
    cmake --install $srcdir/$pkgname-$pkgver/build --prefix $pkgdir/usr
    install -Dm644 \
        $srcdir/$pkgname-$pkgver/LICENSE.txt \
        $pkgdir/usr/share/licenses/$pkgname/LICENSE
    rm -rfv $pkgdir/usr/test
}
