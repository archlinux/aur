# Maintainer: Butui Hu <hot123tea123@gmail.com>

_pkgname=horovod
pkgname=python-horovod
pkgver=0.28.0
pkgrel=1
pkgdesc='Distributed training framework for TensorFlow, Keras, PyTorch, and Apache MXNet'
arch=('x86_64')
url='https://github.com/horovod/horovod'
license=('Apache')
depends=(
  cuda
  cudnn
  nccl
  openmpi
  python-cloudpickle
  python-h5py
  python-mock
  python-mpi4py
  python-psutil
  python-pycparser
  python-pyaml
  python-scipy
  python-six
  python-tqdm
)
makedepends=(
  cmake
  git
  python-build
  python-installer
  python-pytorch-cuda
  python-setuptools
  python-tensorflow-cuda
  python-wheel
)
optdepends=(
  'python-pytorch-cuda: pytorch framework'
  'python-tensorflow-cuda: tensorflow framework'
)
source=("${_pkgname}-${pkgver}::git+https://github.com/horovod/horovod.git#tag=v${pkgver}")
sha512sums=('SKIP')

prepare() {
  cd "${_pkgname}-${pkgver}"
  git submodule update --init --recursive
# modify these environment variable as you need, see also https://github.com/horovod/horovod/blob/master/docs/install.rst
  export HOROVOD_BUILD_CUDA_CC_LIST="60,61,62,70,72,75,80,86,89,90"
  export HOROVOD_CPU_OPERATIONS=GLOO
  export HOROVOD_CUDA_HOME=/opt/cuda
  export HOROVOD_GPU=CUDA
  export HOROVOD_GPU_OPERATIONS=NCCL
  export HOROVOD_NCCL_LINK=SHARED
  export HOROVOD_WITHOUT_MXNET=1
  export HOROVOD_WITH_GLOO=1
  export HOROVOD_WITH_MPI=1
  export HOROVOD_WITH_PYTORCH=1
  export HOROVOD_WITH_TENSORFLOW=1
  export CC=/opt/cuda/bin/gcc
  export CXX=/opt/cuda/bin/g++
  # fix https://github.com/horovod/horovod/issues/3923
  cd "third_party/gloo"
  git pull https://github.com/facebookincubator/gloo.git
}

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation -x
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
# vim:set ts=2 sw=2 et:

