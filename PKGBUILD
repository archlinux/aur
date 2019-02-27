# Maintainer: Adria Arrufat <adria.arrufat+AUR@protonmail.ch>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgbase=tensorflow-git
pkgname=(tensorflow-git tensorflow-cuda-git python-tensorflow-git python-tensorflow-cuda-git)
pkgver=1.13.0+172+gb29d52ce7f
pkgrel=1
pkgdesc="Library for computation using data flow graphs for scalable machine learning"
url="https://tensorflow.org/"
license=('APACHE')
arch=('x86_64')
makedepends=(git bazel python-numpy gcc7 cuda cudnn nccl python-greenlet python-pip python-wheel python-setuptools)
optdepends=('tensorboard: Tensorflow visualization toolkit')
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
    export TF_NEED_JEMALLOC=1
    export TF_NEED_KAFKA=0
    export TF_NEED_OPENCL_SYCL=0
    export TF_NEED_AWS=0
    export TF_NEED_GCP=0
    export TF_NEED_HDFS=0
    export TF_NEED_S3=0
    export TF_ENABLE_XLA=1
    export TF_NEED_GDR=0
    export TF_NEED_VERBS=0
    export TF_NEED_OPENCL=0
    export TF_NEED_MPI=0
    export TF_NEED_TENSORRT=0
    export TF_NEED_NGRAPH=0
    export TF_NEED_IGNITE=0
    export TF_NEED_ROCM=0
    export TF_SET_ANDROID_WORKSPACE=0
    export TF_DOWNLOAD_CLANG=0
    export TF_NCCL_VERSION=2.3
    export NCCL_INSTALL_PATH=/usr
    export CC_OPT_FLAGS="-march=x86-64"

    # make sure the proxy variables are in all caps, otherwise bazel ignores them
    export HTTP_PROXY=`echo $http_proxy | sed -e 's/\/$//'`
    export HTTPS_PROXY=`echo $https_proxy | sed -e 's/\/$//'`
}

build() {
  # _bazel_09_fix="--incompatible_load_argument_is_label=false"
  cd ${srcdir}/tensorflow

  export TF_NEED_CUDA=0
  ./configure
  bazel \
    build --config=opt \
      //tensorflow:libtensorflow.so \
      //tensorflow:libtensorflow_cc.so \
      //tensorflow:install_headers \
      //tensorflow/tools/pip_package:build_pip_package
  bazel-bin/tensorflow/tools/pip_package/build_pip_package ${srcdir}/tmp

  cd ${srcdir}/tensorflow-cuda
  export TF_NEED_CUDA=1
  export GCC_HOST_COMPILER_PATH=/usr/bin/gcc-7
  export TF_CUDA_CLANG=0
  # export CLANG_CUDA_COMPILER_PATH=/usr/bin/clang
  export CUDA_TOOLKIT_PATH=/opt/cuda
  export TF_CUDA_VERSION=$($CUDA_TOOLKIT_PATH/bin/nvcc --version | sed -n 's/^.*release \(.*\),.*/\1/p')
  export CUDNN_INSTALL_PATH=/opt/cuda
  export TF_CUDNN_VERSION=$(sed -n 's/^#define CUDNN_MAJOR\s*\(.*\).*/\1/p' $CUDNN_INSTALL_PATH/include/cudnn.h)
  export TF_CUDA_COMPUTE_CAPABILITIES=3.5,3.7,5.0,5.2,5.3,6.0,6.1,6.2,7.0,7.2,7.5
  ./configure
  bazel \
    build --config=opt --config=opt \
      //tensorflow:libtensorflow.so \
      //tensorflow:libtensorflow_cc.so \
      //tensorflow:install_headers \
      //tensorflow/tools/pip_package:build_pip_package
  bazel-bin/tensorflow/tools/pip_package/build_pip_package ${srcdir}/tmpcuda
}

package_tensorflow-git() {
  conflicts=(tensorflow)
  provides=(tensorflow)

  cd ${srcdir}/tensorflow

  tensorflow/c/generate-pc.sh --prefix=/usr --version=${pkgver}
  install -Dm644 tensorflow.pc ${pkgdir}/usr/lib/pkgconfig/tensorflow.pc
  install -Dm755 bazel-bin/tensorflow/libtensorflow.so ${pkgdir}/usr/lib/libtensorflow.so
  install -Dm644 tensorflow/c/c_api.h ${pkgdir}/usr/include/tensorflow/c/c_api.h
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/tensorflow/LICENSE
}

package_tensorflow-cuda-git() {
  depends=(cuda cudnn)
  conflicts=(tensorflow)
  provides=(tensorflow)

  cd ${srcdir}/tensorflow-cuda

  tensorflow/c/generate-pc.sh --prefix=/usr --version=${pkgver}
  install -Dm644 tensorflow.pc ${pkgdir}/usr/lib/pkgconfig/tensorflow.pc
  install -Dm755 bazel-bin/tensorflow/libtensorflow.so ${pkgdir}/usr/lib/libtensorflow.so
  install -Dm644 tensorflow/c/c_api.h ${pkgdir}/usr/include/tensorflow/c/c_api.h
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/tensorflow/LICENSE
}

package_python-tensorflow-git() {
  depends=(python python-protobuf)
  conflicts=(python-tensorflow)
  provides=(python-tensorflow)
  optdepends=('python-werkzeug: for using tensorboard')

  cd ${srcdir}/tensorflow

  WHEEL_PACKAGE=$(find ${srcdir}/tmpcuda -name "tensor*.whl")
  pip install --ignore-installed --upgrade --root $pkgdir/ $WHEEL_PACKAGE --no-dependencies
  rm -rf ${pkgdir}/usr/bin/tensorboard

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/python-tensorflow/LICENSE
}

package_python-tensorflow-cuda-git() {
  depends=(python cuda cudnn python-pycuda python-protobuf)
  conflicts=(python-tensorflow)
  provides=(python-tensorflow)
  optdepends=('python-werkzeug: for using tensorboard')

  cd ${srcdir}/tensorflow-cuda

  WHEEL_PACKAGE=$(find ${srcdir}/tmpcuda -name "tensor*.whl")
  pip install --ignore-installed --upgrade --root $pkgdir/ $WHEEL_PACKAGE --no-dependencies
  rm -rf ${pkgdir}/usr/bin/tensorboard

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/python-tensorflow/LICENSE
}

# vim:set ts=2 sw=2 et:
