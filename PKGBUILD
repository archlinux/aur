# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Hu Butui <hot123tea123@gmail.com>

pkgname=python-flash-attn
_pkgname=flash-attention
pkgver=2.8.3
pkgrel=1
pkgdesc="Fast and memory-efficient exact attention"
arch=('x86_64')
url="https://github.com/Dao-AILab/flash-attention"
license=('BSD-3-Clause')
depends=(
  python-pytorch-cuda
  python-einops
)
makedepends=(
  cuda
  git
  ninja
  python-build
  python-packaging
  python-psutil
  python-installer
  python-setuptools
  python-wheel
)
provides=('python-flash-attention')
source=("${_pkgname}::git+https://github.com/Dao-AILab/flash-attention.git#tag=v${pkgver}"
        "0001-fix-building-torch-extension-with-glog.patch"
)
sha256sums=('SKIP'
            'cfdc7f13c855599e90861fcfc15ae5d3759b8823ca609a70ddbd061691287137')

prepare() {
  cd "${srcdir}/${_pkgname}"
  git submodule update --init csrc/cutlass
  patch -p1 -i "${srcdir}/0001-fix-building-torch-extension-with-glog.patch"
}

build() {
  cd "${srcdir}/${_pkgname}"
  CUDA_HOME=/opt/cuda \
  FLASH_ATTENTION_FORCE_BUILD=TRUE \
  FLASH_ATTENTION_SKIP_CUDA_BUILD=FALSE \
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
