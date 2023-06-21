# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-flash-attention
_pkgname=${pkgname#python-}
pkgver=1.0.7
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
sha256sums=('57969210cb7f10114685931eda93e85dc523ad2e270b385a14d804bc47499f32'
            'SKIP')

prepare() {
    export CUDA_HOME=/opt/cuda
    export TORCH_CUDA_ARCH_LIST=7.0,7.5,8.0,8.6,8.9,9.0

    cd $_pkgname-$pkgver
    patch -p 0 -i ../flash-attention.diff
}

build() {
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
