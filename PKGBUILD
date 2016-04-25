# Maintainer: Nicholas O'Callaghan <nocallaghan12 at gmail dot come
# Contributor: Benjamin Chrétien <chretien dot b plus aur at gmail dot com>
# Contributor: Pieter Robyns <pieter.robyns@uhasselt.be>
pkgname=python2-tensorflow-git
pkgver=0.8.0rc0.r281.g55068f3
pkgrel=1
url="http://tensorflow.org"
license=('Apache')
arch=('x86_64')
pkgdesc="Open source software library for numerical computation using data flow graphs (Python 2)"
depends=('python2' 'python2-numpy' 'python2-protobuf3')
optdepends=('cuda: GPU support'
            'cudnn: GPU support')
makedepends=('python2' 'python2-pip' 'python2-wheel' 'bazel' 'swig' 'git')
source=("git+https://github.com/tensorflow/tensorflow.git"
        "git+https://github.com/google/protobuf.git"
        "flags.patch")
sha256sums=('SKIP'
            'SKIP'
            '513f634cc1cab44eb17204616617695ea23355462f918873678fcac1a95ae778')
provide=('python2-tensorflow')
conflicts=('python2-tensorflow' 'python2-tensorflow-cuda' 'tensorflow-git')

_build_opts=""

export PYTHON=python2

pkgver() {
  cd "${srcdir}/tensorflow"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() { 
  cd "${srcdir}/tensorflow"
  git submodule init
  git config submodule.google/protobuf.url ${srcdir}/protobuf
  git submodule update

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
  cd "${srcdir}/tensorflow"

  # Checks for CUDA-related paths
  PYTHON_BIN_PATH=/usr/bin/${PYTHON} ./configure

  msg2 "Running bazel build..."
  bazel build -c opt --python2_path ${PYTHON} ${_build_opts} //tensorflow/tools/pip_package:build_pip_package

  msg2 "Building pip package..."
  bazel-bin/tensorflow/tools/pip_package/build_pip_package "${srcdir}/tmp-${PYTHON}"
}

package() {
  cd "${srcdir}/tensorflow"

  TMP_PKG=`find ${srcdir}/tmp-${PYTHON} -name "tensor*.whl"`
  pip2 install --ignore-installed --upgrade --no-deps --root=${pkgdir} ${TMP_PKG}

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}
