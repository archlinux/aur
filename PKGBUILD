# Maintainer: piernov <piernov@piernov.org>

pkgname=python-tensorflow-addons-cuda-git
pkgver=r1490.14af819a
pkgrel=1
pkgdesc="Useful extra functionality for TensorFlow 2.x, built with CUDA support"
url="https://github.com/tensorflow/addons"
arch=('any')
license=('APACHE')
depends=('tensorflow-cuda' 'python-tensorflow' 'python-typeguard' 'cuda' 'cudnn')
makedepends=('python-setuptools' 'bazel4' 'rsync' 'python-pip')
source=("git+https://github.com/tensorflow/addons.git"
	"bazel-cuda-build-fix.patch"
	"fix_cuda.patch"
	"use_cub_from_cuda.patch")
sha256sums=('SKIP'
            '987e4933a298616a2ede9f2a938e047df20287ab7f514f104703ac7af5e8ef9d'
            'ade7b591f96339dffacccf838006a206ccb0eb3758ae571ac77aef94520f001f'
            'de727ac26b8353de6ff7972ae084d3c5ca692cebc05aac1d73bca221cb0cd45a')

pkgver() {
  cd addons
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}"/addons

  # Force OpenJDK-11
  export JAVA_HOME=/usr/lib/jvm/java-11-openjdk

  # CUDA 11.8 uses GCC 11
  export CC=gcc-11
  export CXX=g++-11
  export GCC_HOST_COMPILER_PATH=/usr/bin/${CC}
  export HOST_C_COMPILER=/usr/bin/${CC}
  export HOST_CXX_COMPILER=/usr/bin/${CXX}

  export TF_NEED_CUDA=1
  export TF_CUDA_CLANG=0
  export CUDA_TOOLKIT_PATH=/opt/cuda
  export CUDNN_INSTALL_PATH=/usr
  export TF_CUDA_PATHS=/opt/cuda/targets/x86_64-linux

  export TF_CUDA_VERSION=$(/opt/cuda/bin/nvcc --version | sed -n 's/^.*release \(.*\),.*/\1/p')
  export TF_CUDNN_VERSION=$(sed -n 's/^#define CUDNN_MAJOR\s*\(.*\).*/\1/p' /usr/include/cudnn.h)
  export TF_CUDA_COMPUTE_CAPABILITIES=3.5,3.7,5.0,5.2,5.3,6.0,6.1,6.2,7.0,7.2,7.5,8.0,8.6

  patch -p1 < "${srcdir}/bazel-cuda-build-fix.patch"
  patch -p1 < "${srcdir}/fix_cuda.patch"
  patch -p1 < "${srcdir}/use_cub_from_cuda.patch"
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
