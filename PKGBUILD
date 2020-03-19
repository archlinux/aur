# Maintainer: piernov <piernov@piernov.org>

pkgname=python-tensorflow-addons-cuda-git
pkgver=r746.25959474
pkgrel=2
pkgdesc="Useful extra functionality for TensorFlow 2.x, built with CUDA support"
url="https://github.com/tensorflow/addons"
arch=('any')
license=('APACHE')
depends=('tensorflow-cuda' 'python-tensorflow' 'python-typeguard' 'cuda>=10.2' 'cuda<10.3' 'cudnn>=7' 'cudnn<8')
makedepends=('python-setuptools' 'bazel' 'rsync')
source=("git+https://github.com/tensorflow/addons.git")
sha256sums=('SKIP')

pkgver() {
  cd addons
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # Force OpenJDK-11
  export JAVA_HOME=/usr/lib/jvm/java-11-openjdk

  export TF_NEED_CUDA=1
  export TF_CUDA_VERSION=10.2
  export TF_CUDNN_VERSION=7
  export CUDA_TOOLKIT_PATH=/opt/cuda
  export CUDNN_INSTALL_PATH=/usr
  export TF_CUDA_PATHS=/opt/cuda/targets/x86_64-linux

  cd "${srcdir}"/addons
  python3 ./configure.py --no-deps
  bazel build --copt=-O3 --copt=-march=native build_pip_pkg
  bazel-bin/build_pip_pkg artifacts
}

package() {
  cd "${srcdir}"/addons
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps artifacts/tensorflow_addons-*.whl
}
