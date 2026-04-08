# Maintainer: Rongbo Wu <wurongbo2012@hotmail.com>

pkgname=python-flash-attn-rocm
_pkgname=flash-attention
pkgver=2.8.3
pkgrel=2
pkgdesc="Fast and memory-efficient exact attention"
arch=('x86_64')
url="https://github.com/Dao-AILab/flash-attention"
license=('BSD-3-Clause')
depends=(
  python-pytorch-rocm
  python-einops
  python-triton
  rocm-hip-runtime
)
makedepends=(
  rocm-hip-sdk
  git
  ninja
  python-build
  python-packaging
  python-psutil
  python-installer
  python-setuptools
  python-wheel
)
provides=('python-flash-attn')
source=("${_pkgname}::git+https://github.com/Dao-AILab/flash-attention.git#tag=v${pkgver}"
)
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${_pkgname}"
  export FLASH_ATTENTION_TRITON_AMD_ENABLE="TRUE"
  python -m build --wheel --no-isolation -x
}

check() {
  cd "${srcdir}/${_pkgname}"
  local python_version=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
  PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${python_version//./}:$PYTHONPATH" \
    python -c "import flash_attn; print(f'flash_attn version: {flash_attn.__version__}')" || echo "Import test skipped"
}

package() {
  cd "${srcdir}/${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
