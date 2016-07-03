# Maintainer: Nicholas O'Callaghan <nocallaghan12 at gmail dot come
# Contributor: Benjamin Chrétien <chretien dot b plus aur at gmail dot com>
# Contributor: Pieter Robyns <pieter.robyns@uhasselt.be>
pkgname=python2-tensorflow
pkgver=0.9.0
pkgrel=1
url="http://tensorflow.org"
license=('Apache')
arch=('x86_64')
pkgdesc="Open source software library for numerical computation using data flow graphs (Python 2)"
depends=('python2' 'python2-numpy' 'python2-protobuf3')
optdepends=('cuda: GPU support'
            'cudnn: GPU support')
makedepends=('python2-pip' 'python2-wheel' 'bazel' 'swig' 'rsync')
source=("https://github.com/tensorflow/tensorflow/archive/v${pkgver}.tar.gz"
         "flags.patch")
sha256sums=('3128c396af19518c642d3e590212291e1d93c5b047472a10cf3245b53adac9c9'
            '513f634cc1cab44eb17204616617695ea23355462f918873678fcac1a95ae778')
conflicts=('python2-tensorflow-git')

_build_opts=""

export PYTHON=python2

prepare() {
  cd "${srcdir}/tensorflow-${pkgver}"

  # Set up some things for building
  mkdir -p "${srcdir}/tmp-${PYTHON}"

  # Fix compilation flags
  patch -p1 < ../flags.patch

  if (pacman -Q cuda &>/dev/null && pacman -Q cudnn &>/dev/null); then
    msg2 "CUDA support enabled"
    _build_opts="--config=cuda"
    export TF_NEED_CUDA=1
    export TF_UNOFFICIAL_SETTING=1
    export CUDA_TOOLKIT_PATH=/opt/cuda
    export CUDNN_INSTALL_PATH=/opt/cuda
    # Adapt to your needs:
    # export TF_CUDA_COMPUTE_CAPABILITIES="3.0,3.5"
  else
    msg2 "CUDA support disabled"
    export TF_NEED_CUDA=0
  fi
}

build() {
  cd "${srcdir}/tensorflow-${pkgver}"

  # Checks for CUDA-related paths
  PYTHON_BIN_PATH=/usr/bin/${PYTHON} ./configure

  msg2 "Running bazel build..."
  bazel build -c opt --jobs 10 --python2_path ${PYTHON} ${_build_opts} //tensorflow/tools/pip_package:build_pip_package

  msg2 "Building pip package..."
  bazel-bin/tensorflow/tools/pip_package/build_pip_package "${srcdir}/tmp-${PYTHON}"
}

package() {
  cd "${srcdir}/tensorflow-${pkgver}"

  TMP_PKG=`find ${srcdir}/tmp-${PYTHON} -name "tensor*.whl"`
  pip2 install --ignore-installed --upgrade --no-deps --root=${pkgdir} ${TMP_PKG}
  
  msg2 "Moving tensorboard binary..."
  mv "${pkgdir}/usr/bin/tensorboard" "${pkgdir}/usr/bin/tensorboard2"


  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
