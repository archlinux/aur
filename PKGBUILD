# Maintainer: Nicholas O'Callaghan <nocallaghan12 at gmail dot come
# Contributor: Benjamin Chrétien <chretien dot b plus aur at gmail dot com>
# Contributor: Pieter Robyns <pieter.robyns@uhasselt.be>
pkgname=python2-tensorflow
pkgver=0.7.1
pkgrel=1
url="http://tensorflow.org"
license=('Apache')
arch=('x86_64')
pkgdesc="Open source software library for numerical computation using data flow graphs (Python 2)"
depends=('python2' 'python2-numpy' 'python2-protobuf3')
optdepends=('cuda: GPU support'
            'cudnn: GPU support')
makedepends=('python2' 'python2-pip' 'python2-wheel' 'bazel' 'swig' 'git')
source=("https://github.com/tensorflow/tensorflow/archive/v${pkgver}.tar.gz"
	"https://github.com/google/protobuf/archive/fb714b3606bd663b823f6960a73d052f97283b74.tar.gz"
        "flags.patch")
sha256sums=('ef34121432f7a522cf9f99a56cdd86e370cc5fa3ee31255ca7cb17f36b8dfc0d'
            '87ec95e580ec315fdec2d8c1590c332e61486d387f0d6e6540e74a18e44fd2ab'
            '513f634cc1cab44eb17204616617695ea23355462f918873678fcac1a95ae778')
provides=('tensorflow')
conflicts=('tensorflow' 'tensorflow-git')

_build_opts=""

export PYTHON=python2

prepare() {
  cd "${srcdir}/tensorflow-${pkgver}"

  # Set up some things for building
  mkdir -p "${srcdir}/tmp-${PYTHON}"

  # Fix compilation flags
  patch -p1 < ../flags.patch

  # Move protobuf
  msg2 "Moving protobuf sources..."
  rm -r google/protobuf
  mv ../protobuf-fb714b3606bd663b823f6960a73d052f97283b74 google/protobuf

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
  bazel build -c opt \
    --python2_path ${PYTHON} \
    --package_path "/opt/bazel/base_workspace:${srcdir}/tensorflow-${pkgver}" \
    ${_build_opts} \
    //tensorflow/tools/pip_package:build_pip_package

  msg2 "Building pip package..."
  bazel-bin/tensorflow/tools/pip_package/build_pip_package "${srcdir}/tmp-${PYTHON}"
}

package() {
  cd "${srcdir}/tensorflow-${pkgver}"

  _site_packages=$(${PYTHON} -c "import site; print(site.getsitepackages()[0])")
  TMP_PKG=`find ${srcdir}/tmp-${PYTHON} -name "tensor*.whl"`
  pip2 install --ignore-installed --no-deps \
    --root=${pkgdir} \
    --install-option="--prefix=${pkgdir}/usr" \
    --install-option="--install-scripts=${pkgdir}/usr/bin" \
    --install-option="--install-lib=${pkgdir}/${_site_packages}" \
    --install-option="--install-data=${pkgdir}/var/lib/${_name}" \
    --install-option="--root=${pkgdir}" \
    ${TMP_PKG}

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_name}/LICENSE"
}
