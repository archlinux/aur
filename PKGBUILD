# Maintainer: Hu Butui <hot123tea123@gmail.com>

# update _CUDA_ARCH_LIST for your nvidia cards
_CUDA_ARCH_LIST="7.0;7.2;7.5;8.0;8.6;8.9;9.0;9.0a;10.0;10.0a;10.1;10.1a;12.0;12.0a;12.0a+PTX"
pkgname=python-flash-attn
_pkgname=flash-attention
pkgver=2.7.4.post1
pkgrel=1
pkgdesc="A Flexible Framework for Experiencing Cutting-edge LLM Inference Optimizations"
arch=('x86_64')
url="https://github.com/Dao-AILab/flash-attention"
license=('BSD-3-Clause')
depends=(
  python-pytorch-opt-cuda
  python-einops
)
makedepends=(
  git
  ninja
  python-build
  python-psutil
  python-installer
  python-setuptools
  python-wheel
)
source=("${_pkgname}::git+https://github.com/Dao-AILab/flash-attention.git#tag=v${pkgver}"
        "0001-fix-building-torch-extension-with-glog.patch"
)
sha256sums=('341db34ccbfc6290649ac881aba41e10f3f15341d26bf1e0d543cbda1f582bbf'
            'aee8efe41561aca9ca25f0495720998e258119df1f6d59fa60be684e81793c7c')

prepare() {
  cd "${srcdir}/${_pkgname}"
  git submodule update --init --recursive
  patch -p1 -i "${srcdir}/0001-fix-building-torch-extension-with-glog.patch"
}

build() {
  cd "${srcdir}/${_pkgname}"
  CUDA_HOME=/opt/cuda \
  FLASH_ATTENTION_FORCE_BUILD=TRUE \
  FLASH_ATTENTION_SKIP_CUDA_BUILD=FALSE \
  TORCH_CUDA_ARCH_LIST=${_CUDA_ARCH_LIST} \
  python -m build --wheel --no-isolation -x
}

package() {
  cd "${srcdir}/${_pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
