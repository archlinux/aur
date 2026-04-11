# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Daniel Bershatsky <bepshatsky@yandex.ru>

_name=flash-attention
pkgname=python-${_name}-rocm-triton
pkgver=2.8.3
pkgrel=1
pkgdesc='Fast and memory-efficient exact attention. ROCm Triton version.'
arch=('any')
url='https://github.com/Dao-AILab/flash-attention'
license=('BSD-3-Clause')
depends=(
  python-einops
  python-pytorch-rocm
  python-triton
  python-tqdm
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
)
install='python-flash-attention-rocm.install'
source=(
  "git+https://github.com/Dao-AILab/flash-attention#tag=v${pkgver}"
)
sha256sums=('1be6e9eb9daa3a0294c164031fd15d026bcabadd89c5210a760f9f5f9e121ffd')

build() {
  # Use ROCm Triton backend.
  export BUILD_TARGET="rocm"
  export FLASH_ATTENTION_TRITON_AMD_ENABLE=TRUE

  # Skip Composable Kernel build, it only works on gfx9 ROCm arches.
  export FLASH_ATTENTION_SKIP_CK_BUILD=TRUE

  cd $_name
  # Add --skip-dependency-check to avoid the ninja python package requirement.
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  export FLASH_ATTENTION_TRITON_AMD_ENABLE=TRUE
  cd $_name
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  python -m installer --compile-bytecode=1 --destdir=$pkgdir dist/flash_attn-$pkgver-*.whl
}
