# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=python-flashinfer
_pkgname=flashinfer
pkgver=0.7.1
pkgrel=2
pkgdesc='Kernel Library for LLM Serving'
arch=('x86_64')
url='https://github.com/flashinfer-ai/flashinfer'
license=('Apache-2.0')
provides=('python-flashinfer')
conflicts=('python-flashinfer-rocm')
depends=(
  'python-pytorch'
  'cuda'
  'python-cuda'
  'python-tvm-ffi'
  'python-click'
  'python-einops'
  'python-ninja'
  'python-numpy'
  'python-nvidia-ml-py'
  'python-packaging'
  'python-requests'
  'python-tabulate'
  'python-tqdm'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools>=77'
)
optdepends=(
  'python-cutlass: Blackwell GPU kernel support (SM100+)'
  'cudnn: cuDNN-accelerated attention paths (pip install nvidia-cudnn-frontend for Python bindings)'
)
options=('!strip')
# The tag tarball omits the git submodules that the wheel copies into
# flashinfer/data (cutlass, spdlog, cccl), which JIT compilation needs.
_cutlass_commit=b46b16d003484063bca4ed365e44095c4c6ed633
_spdlog_commit=c3aed4b68373955e1cc94307683d44dca1515d2b
_cccl_commit=16bd510c9b712e82b0ab6cbb630d8e29ba1f7116
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        "cutlass-${_cutlass_commit}.tar.gz::https://github.com/NVIDIA/cutlass/archive/${_cutlass_commit}.tar.gz"
        "spdlog-${_spdlog_commit}.tar.gz::https://github.com/gabime/spdlog/archive/${_spdlog_commit}.tar.gz"
        "cccl-${_cccl_commit}.tar.gz::https://github.com/NVIDIA/cccl/archive/${_cccl_commit}.tar.gz")
sha256sums=('0cee9f4b51dc06729c7f103b0244e35927c83a287c6431898ab0b74759b8fdb7'
            'eb32d2231412541cdaefedf82827903360b07762a0c8d554ca10a59951b321d0'
            '206184e0d3be5b4ea56343dca519d38d1fdf567b59dd9913e3e959ed4c6b0f4d'
            '8c4a1bebc5dfefaebbd40f21460951c62403f9c1f7c52b151b99cae82a02c844')

prepare() {
  cd "${_pkgname}-${pkgver}"
  rm -rf 3rdparty/cutlass 3rdparty/spdlog 3rdparty/cccl
  mv "../cutlass-${_cutlass_commit}" 3rdparty/cutlass
  mv "../spdlog-${_spdlog_commit}" 3rdparty/spdlog
  mv "../cccl-${_cccl_commit}" 3rdparty/cccl
}

build() {
  cd "${_pkgname}-${pkgver}"
  /usr/bin/python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "${_pkgname}-${pkgver}"
  /usr/bin/python -m installer --destdir="${pkgdir}" dist/*.whl
}
