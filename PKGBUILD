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
source=(
  "git+https://github.com/Dao-AILab/flash-attention#tag=v${pkgver}"
  "git+https://github.com/NVIDIA/cutlass"
)
sha256sums=('1be6e9eb9daa3a0294c164031fd15d026bcabadd89c5210a760f9f5f9e121ffd'
            'SKIP')

prepare() {
  cd $_name

  git submodule init
  git config submodule."csrc/cutlass".url "${srcdir}/cutlass"
  # Disable ck, it's only for ROCm gfx9
  git config submodule."csrc/composable_kernel".update none
  git -c protocol.file.allow=always submodule update --init
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

    # Fix glog build errors.
    export CFLAGS='-DGLOG_USE_GLOG_EXPORT'

    cd $_name
    # Add --skip-dependency-check to avoid the ninja python package requirement.
    python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd $_name
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --compile-bytecode=1 --destdir=$pkgdir dist/flash_attn-$pkgver-*.whl
}
