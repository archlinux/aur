# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-flash-attention
_pkgname=${pkgname#python-}
pkgver=2.3.6
pkgrel=1
pkgdesc='Fast and memory-efficient exact attention'
arch=('any')
url='https://github.com/HazyResearch/flash-attention'
license=('Apache')
groups=()
depends=('python-einops' 'python-pytorch-cuda')
makedepends=('cutlass' 'ninja' 'python-build' 'python-installer'
             'python-packaging' 'python-setuptools' 'python-wheel')
optdepends=()
source=("$_pkgname-$pkgver.tar.gz::https://github.com/HazyResearch/$_pkgname/archive/refs/tags/v$pkgver.tar.gz"
        'flash-attention.diff')
sha256sums=('aaf5147284d99996d9076fc87c9c5e0ab30139f78fce7f0e9eed31a390ab2aff'
            'SKIP')

prepare() {
    cd $_pkgname-$pkgver
    patch -p 0 -i ../flash-attention.diff
}

build() {
    export CUDA_HOME=/opt/cuda
    export TORCH_CUDA_ARCH_LIST=7.0,7.5,8.0,8.6,8.9,9.0

    cd $_pkgname-$pkgver
    python setup.py build_ext
    python -m build -nw
}

package() {
    python -m installer \
        --compile-bytecode 1 \
        --destdir $pkgdir \
        $_pkgname-$pkgver/dist/flash_attn-$pkgver-*.whl
}
