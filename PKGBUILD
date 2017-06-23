# Maintainer: Adria Arrufat <adria.arrufat+AUR@protonmail.ch>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgbase=tensorflow-git
pkgname=(tensorflow-git tensorflow-cuda-git python-tensorflow-git python-tensorflow-cuda-git)
pkgver=1.2.0+1366+gaf8f6353a3
pkgrel=1
pkgdesc="Library for computation using data flow graphs for scalable machine learning"
url="https://tensorflow.org/"
license=('Apache2')
arch=('x86_64')
makedepends=(git bazel python-numpy gcc5 cuda cudnn python-pip python-wheel python-setuptools)
optdepends=('cuda: GPU support'
            'cudnn: GPU support')
source=("git+https://github.com/tensorflow/tensorflow")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/tensorflow
  git describe --tags | sed 's/-/+/g;s/v//;'
}

prepare() {
  [ -d ${srcdir}/tensorflow-cuda ] && rm -rf ${srcdir}/tensorflow-cuda
  cp -r ${srcdir}/tensorflow ${srcdir}/tensorflow-cuda
  # These environment variables influence the behavior of the configure call below.
  export PYTHON_BIN_PATH=/usr/bin/python
  export USE_DEFAULT_PYTHON_LIB_PATH=1
  export CC_OPT_FLAGS="-march=native"
  export TF_NEED_JEMALLOC=1
  export TF_NEED_GCP=0
  export TF_NEED_HDFS=0
  export TF_ENABLE_XLA=1
  export TF_NEED_VERBS=0
  export TF_NEED_OPENCL=0
  export TF_NEED_MKL=0
  export TF_NEED_MPI=0

  # make sure the proxy variables are in all caps, otherwise bazel ignores them
  export HTTP_PROXY=`echo $http_proxy | sed -e 's/\/$//'`
  export HTTPS_PROXY=`echo $https_proxy | sed -e 's/\/$//'`
}

build() {
  cd ${srcdir}/tensorflow

  export TF_NEED_CUDA=0

  ./configure
  bazel build --config=opt //tensorflow:libtensorflow.so //tensorflow/tools/pip_package:build_pip_package
  bazel-bin/tensorflow/tools/pip_package/build_pip_package ${srcdir}/tmp

  cd ${srcdir}/tensorflow-cuda
  export TF_NEED_CUDA=1
  export GCC_HOST_COMPILER_PATH=/usr/bin/gcc-5
  export TF_CUDA_CLANG=0
  export CLANG_CUDA_COMPILER_PATH=/usr/bin/clang
  export CUDA_TOOLKIT_PATH=/opt/cuda
  export TF_CUDA_VERSION=$($CUDA_TOOLKIT_PATH/bin/nvcc --version | sed -n 's/^.*release \(.*\),.*/\1/p')
  export CUDNN_INSTALL_PATH=/opt/cuda
  export TF_CUDNN_VERSION=$(sed -n 's/^#define CUDNN_MAJOR\s*\(.*\).*/\1/p' $CUDNN_INSTALL_PATH/include/cudnn.h)
  export TF_CUDA_COMPUTE_CAPABILITIES=3.0,3.5,5.2,6.1
  ./configure
  bazel build --config=opt --config=cuda //tensorflow:libtensorflow.so //tensorflow/tools/pip_package:build_pip_package
  bazel-bin/tensorflow/tools/pip_package/build_pip_package ${srcdir}/tmpcuda
}

package_tensorflow-git() {
  conflicts=(tensorflow)
  provides=(tensorflow)

  cd ${srcdir}/tensorflow

  ${srcdir}/tensorflow/tensorflow/c/generate-pc.sh --prefix=/usr --version=${pkgver:0:5}
  install -Dm755 bazel-bin/tensorflow/libtensorflow.so ${pkgdir}/usr/lib/libtensorflow.so
  install -Dm644 tensorflow/c/c_api.h ${pkgdir}/usr/include/tensorflow/c/c_api.h
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/tensorflow/LICENSE
  install -Dm644 tensorflow.pc ${pkgdir}/usr/lib/pkgconfig/tensorflow.pc
}

package_tensorflow-cuda-git() {
  depends=(cuda cudnn)
  conflicts=(tensorflow)
  provides=(tensorflow)

  cd ${srcdir}/tensorflow-cuda

  ${srcdir}/tensorflow/tensorflow/c/generate-pc.sh --prefix=/usr --version=${pkgver:0:5}
  install -Dm755 bazel-bin/tensorflow/libtensorflow.so ${pkgdir}/usr/lib/libtensorflow.so
  install -Dm644 tensorflow/c/c_api.h ${pkgdir}/usr/include/tensorflow/c/c_api.h
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/tensorflow/LICENSE
  install -Dm644 tensorflow.pc ${pkgdir}/usr/lib/pkgconfig/tensorflow.pc
}

package_python-tensorflow-git() {
  depends=(python python-protobuf)
  conflicts=(python-tensorflow)
  provides=(python-tensorflow)
  optdepends=('python-werkzeug: for using tensorboard')

  cd ${srcdir}/tensorflow

  WHEEL_PACKAGE=$(find ${srcdir}/tmpcuda -name "tensorflow-${pkgver:0:5}*.whl")
  pip install --ignore-installed --upgrade --root $pkgdir/ $WHEEL_PACKAGE --no-dependencies
  find ${pkgdir} -name __pycache__ -exec rm -r {} +

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/python-tensorflow/LICENSE
}

package_python-tensorflow-cuda-git() {
  depends=(python cuda cudnn python-pycuda python-protobuf)
  conflicts=(python-tensorflow)
  provides=(python-tensorflow)
  optdepends=('python-werkzeug: for using tensorboard')

  cd ${srcdir}/tensorflow-cuda

  WHEEL_PACKAGE=$(find ${srcdir}/tmpcuda -name "tensorflow-${pkgver:0:5}*.whl")
  pip install --ignore-installed --upgrade --root $pkgdir/ $WHEEL_PACKAGE --no-dependencies
  find ${pkgdir} -name __pycache__ -exec rm -r {} +

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/python-tensorflow/LICENSE
}
# vim:set ts=2 sw=2 et:
