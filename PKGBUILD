# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Daniel Bershatsky <bepshatsky@yandex.ru>

_name=flash-attention
pkgname=python-${_name}
pkgver=2.8.3
pkgrel=1
pkgdesc='Fast and memory-efficient exact attention. CUDA version.'
arch=('x86_64')
url='https://github.com/Dao-AILab/flash-attention'
license=('BSD-3-Clause')
depends=('python-einops' 'python-pytorch-cuda')
makedepends=('ninja' 'python-build' 'python-installer' 'python-packaging'
             'python-psutil' 'python-setuptools' 'python-wheel')
optdepends=()
cutlass_commit_full=dc4817921edda44a549197ff3a9dcf5df0636e7b
cutlass_commit=${cutlass_commit_full:0:8}
source=("$_name-$pkgver.tar.gz::https://github.com/Dao-AILab/$_name/archive/refs/tags/v$pkgver.tar.gz"
        "cutlass-${cutlass_commit}.tar.gz::https://github.com/NVIDIA/cutlass/archive/${cutlass_commit_full}.tar.gz"
        '0001-setup.py-Add-DGLOG_USE_GLOG_EXPORT-flag.patch')
sha256sums=('61cd5e91507ad7f04dc7c207d8bc8bfb1e43b56b806e51febbc27faeaee208ba'
            'f2a3a9df5e6f010c8b02716aa2644a6f071827fafa606fac5f5241cab6a1ab56'
            '3ebe511837ed96ec1447cac932acac6f9cfd742e5f0330891d7ebb1ed390b83d')


prepare() {
    ln -sf cutlass-$cutlass_commit_full cutlass-$cutlass_commit

    rm -rfv $_name-$pkgver/csrc/cutlass
    ln -sf ../../cutlass-$cutlass_commit_full $_name-$pkgver/csrc/cutlass

    cd $_name-$pkgver
    patch -p 1 -i "${srcdir}/0001-setup.py-Add-DGLOG_USE_GLOG_EXPORT-flag.patch"
}

build() {
    # By doing this the build will only consume below 40GB of system memory.
    export MAX_JOBS=4

    export CUDA_HOME=/opt/cuda

    # Force building FA locally for CUDA (no ROCM).
    export FLASH_ATTENTION_FORCE_BUILD=TRUE
    export FLASH_ATTENTION_SKIP_CUDA_BUILD=FALSE

    # By default all supported achitectures are build. Uncomment this export to limit it.
    # See https://developer.nvidia.com/cuda/gpus
    # export FLASH_ATTN_CUDA_ARCHS="80;90;100;110;120"
    # export FLASH_ATTN_CUDA_ARCHS="86"

    cd $_name-$pkgver
    # Add --skip-dependency-check to avoid the ninja python package requirement.
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd $_name-$pkgver
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --compile-bytecode=1 --destdir=$pkgdir dist/flash_attn-$pkgver-*.whl
}
