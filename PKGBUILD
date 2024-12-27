# Maintainer: Daniel Bershatsky <bepshatsky@yandex.ru>
pkgname=python-flash-attention
_pkgname=${pkgname#python-}
pkgver=2.7.2
pkgrel=1
pkgdesc='Fast and memory-efficient exact attention'
arch=('any')
url='https://github.com/HazyResearch/flash-attention'
license=('Apache')
groups=()
depends=('python-einops' 'python-pytorch-cuda')
makedepends=('ninja' 'python-build' 'python-installer' 'python-packaging'
             'python-psutil' 'python-setuptools' 'python-wheel')
optdepends=()
cutlass_commit_full=4c42f73fdab5787e3bb57717f35a8cb1b3c0dc6d
cutlass_commit=${cutlass_commit_full:0:8}
source=("$_pkgname-$pkgver.tar.gz::https://github.com/HazyResearch/$_pkgname/archive/refs/tags/v$pkgver.tar.gz"
        "cutlass-${cutlass_commit}.tar.gz::https://github.com/NVIDIA/cutlass/archive/${cutlass_commit_full}.tar.gz"
        'flash-attention.diff')
sha256sums=('eb4e4a2ecc17392b4414da5b42adea864c99ef0b7d6101ea3d28ab11667ab00c'
            'd9f1831aef8913fc281429c426ee46d992f69e4afea4c78a0d975f6ad649f994'
            'SKIP')

prepare() {
    ln -sf cutlass-$cutlass_commit_full cutlass-$cutlass_commit

    rm -rfv $_pkgname-$pkgver/csrc/cutlass
    ln -sf ../../cutlass-$cutlass_commit_full $_pkgname-$pkgver/csrc/cutlass

    cd $_pkgname-$pkgver
    patch -p 1 -i ../flash-attention.diff
}

build() {
    export CC=/usr/bin/gcc-13
    export CXX=/usr/bin/g++-13
    export CUDA_HOME=/opt/cuda
    export NVCC_CCBIN=$CC

    # Force building FA locally for CUDA (no ROCM).
    export FLASH_ATTENTION_FORCE_BUILD=TRUE
    export FLASH_ATTENTION_SKIP_CUDA_BUILD=FALSE

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
