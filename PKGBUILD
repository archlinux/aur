# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Daniel Bershatsky <bepshatsky@yandex.ru>

_name=flash-attention
pkgname=python-${_name}-rocm-ck
pkgver=2.8.3
pkgrel=1
pkgdesc='Fast and memory-efficient exact attention. ROCm Composable Kernel version (gfx9 only).'
arch=('x86_64')
url='https://github.com/Dao-AILab/flash-attention'
license=('BSD-3-Clause')
depends=(
  python-einops
  python-pytorch-rocm
)
makedepends=(
  ninja
  python-build
  python-installer
  python-packaging
  python-psutil
  python-setuptools
  python-wheel
)
provides=(
  python-${_name}
  python-${_name}-rocm
)
conflicts=(
  python-${_name}
  python-${_name}-rocm-triton
)
source=(
  "git+https://github.com/Dao-AILab/flash-attention#tag=v${pkgver}"
  "git+https://github.com/ROCm/composable_kernel"
)
sha256sums=('1be6e9eb9daa3a0294c164031fd15d026bcabadd89c5210a760f9f5f9e121ffd'
            'SKIP')

prepare() {
  cd $_name

  git submodule init
  git config submodule."csrc/composable_kernel".url "${srcdir}/composable_kernel"
  # Disable cutlass, it's only for CUDA
  git config submodule."csrc/cutlass".update none
  git -c protocol.file.allow=always submodule update --init
}

build() {
  # By doing this the build will only consume below 40GB of system memory.
  export MAX_JOBS=4

  # Force building FA locally for ROCM (Composable Kernel).
  export BUILD_TARGET="rocm"
  export FLASH_ATTENTION_TRITON_AMD_ENABLE=FALSE
  export FLASH_ATTENTION_SKIP_CK_BUILD=FALSE
  export FLASH_ATTENTION_FORCE_BUILD=TRUE

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
