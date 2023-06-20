# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=cutlass
pkgver=3.1.0
pkgrel=1
pkgdesc='CUDA Templates for Linear Algebra Subroutines'
arch=('x86_64')
url='https://github.com/NVIDIA/cutlass'
license=('Apache')
groups=()
depends=('cuda' 'cudann')
makedepends=('cmake' 'cuda' 'cudann' 'git')
optdepends=()
source=("$pkgname-$pkgver.tar.gz::https://github.com/NVIDIA/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('821aa2e5b709a2e5d3922dcf2c5d445b4898a6ef8bac683cfb00125eafbca029')

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
    cmake --build $pkgname-$pkgver/build -j 48
}

package() {
    cmake --install $srcdir/$pkgname-$pkgver/build --prefix $pkgdir/usr
    install -Dm644 \
        $srcdir/$pkgname-$pkgver/LICENSE.txt \
        $pkgdir/usr/share/licenses/$pkgname/LICENSE
    rm -rfv $pkgdir/usr/test
}
