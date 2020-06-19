# Maintainer: piernov <piernov@piernov.org>

pkgname=python-tensorflow-addons-cuda-git
pkgver=r1118.a0bfe3f3
pkgrel=1
pkgdesc="Useful extra functionality for TensorFlow 2.x, built with CUDA support"
url="https://github.com/tensorflow/addons"
arch=('any')
license=('APACHE')
depends=('tensorflow-cuda' 'python-tensorflow' 'python-typeguard' 'cuda' 'cudnn')
makedepends=('python-setuptools' 'bazel' 'rsync')
source=("git+https://github.com/tensorflow/addons.git")
sha256sums=('SKIP')

pkgver() {
  cd addons
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  export GCC_HOST_COMPILER_PATH=/usr/bin/gcc-8
  export HOST_CXX_COMPILER_PATH=/usr/bin/gcc-8

  # Force OpenJDK-11
  export JAVA_HOME=/usr/lib/jvm/java-11-openjdk

  export TF_NEED_CUDA=1
  export TF_CUDA_CLANG=0
  export CUDA_TOOLKIT_PATH=/opt/cuda
  export CUDNN_INSTALL_PATH=/usr
  export TF_CUDA_PATHS=/opt/cuda/targets/x86_64-linux

  export TF_CUDA_VERSION=$(/opt/cuda/bin/nvcc --version | sed -n 's/^.*release \(.*\),.*/\1/p')
  export TF_CUDNN_VERSION=$(sed -n 's/^#define CUDNN_MAJOR\s*\(.*\).*/\1/p' /usr/include/cudnn.h)
  export TF_CUDA_COMPUTE_CAPABILITIES=3.5,3.7,5.0,5.2,5.3,6.0,6.1,6.2,7.0,7.2,7.5
}

build() {
  cd "${srcdir}"/addons
  python3 ./configure.py --no-deps
  bazel build --copt=-O3 --copt=-march=native build_pip_pkg
  bazel-bin/build_pip_pkg artifacts
}

package() {
  cd "${srcdir}"/addons
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps artifacts/tensorflow_addons-*.whl
}
