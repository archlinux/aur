# Maintainer: Darshit Shah
# Contributor: Adria Arrufat <adria.arrufat+AUR@protonmail.ch>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgbase=(tensorflow-cpu-git)
pkgname=(tensorflow-cpu-git python-tensorflow-cpu-git)
pkgver=1.8.0+rc1+930+gadf045607c
pkgrel=1
pkgdesc="Library for computation using data flow graphs for scalable machine learning"
url="https://tensorflow.org/"
license=('Apache2')
arch=('x86_64')
# There is curently a bug which prevents the compilation of tensorflow with
# bazel 0.13. See: https://github.com/tensorflow/tensorflow/issues/19015
# Till that is resolved, explicitly marking the dependency to 0.12
makedepends=(git bazel=0.12.0 python-pip python-wheel python-setuptools)
optdepends=('tensorboard: Tensorflow visualization toolkit')
source=("git+https://github.com/tensorflow/tensorflow")
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/tensorflow
  git describe --tags | sed 's/-/+/g;s/v//;'
}

prepare() {
  # These environment variables influence the behavior of the configure call below.
  export PYTHON_BIN_PATH=/usr/bin/python
  export USE_DEFAULT_PYTHON_LIB_PATH=1
  export CC_OPT_FLAGS="-march=native -mtune=native"
  export TF_NEED_JEMALLOC=1
  export TF_NEED_KAFKA=0
  export TF_NEED_OPENCL_SYCL=0
  export TF_NEED_GCP=0
  export TF_NEED_HDFS=0
  export TF_NEED_S3=0
  export TF_ENABLE_XLA=1
  export TF_NEED_GDR=0
  export TF_NEED_VERBS=0
  export TF_NEED_OPENCL=0
  export TF_NEED_MPI=0
  export TF_NEED_TENSORRT=0
  export TF_SET_ANDROID_WORKSPACE=0
  export TF_DOWNLOAD_CLANG=0
  export TF_NCCL_VERSION=1.3  # configure.py: _DEFAULT_NCCL_VERSION

  # make sure the proxy variables are in all caps, otherwise bazel ignores them
  export HTTP_PROXY=`echo $http_proxy | sed -e 's/\/$//'`
  export HTTPS_PROXY=`echo $https_proxy | sed -e 's/\/$//'`
}

build() {
  # _bazel_09_fix="--incompatible_load_argument_is_label=false"
  cd ${srcdir}/tensorflow

  export TF_NEED_CUDA=0

  ./configure
  bazel build --config=opt ${MAKEFLAGS:--j$(nproc)} //tensorflow:libtensorflow.so //tensorflow/tools/pip_package:build_pip_package
  bazel-bin/tensorflow/tools/pip_package/build_pip_package ${srcdir}/tmp
}

package_tensorflow-cpu-git() {
  conflicts=(tensorflow tensorflow-git)
  provides=(tensorflow)

  cd ${srcdir}/tensorflow

  tensorflow/c/generate-pc.sh --prefix=/usr --version=${pkgver}
  install -Dm644 tensorflow.pc ${pkgdir}/usr/lib/pkgconfig/tensorflow.pc
  install -Dm755 bazel-bin/tensorflow/libtensorflow.so ${pkgdir}/usr/lib/libtensorflow.so
  install -Dm755 bazel-bin/tensorflow/libtensorflow_framework.so ${pkgdir}/usr/lib/libtensorflow_framework.so
  install -Dm644 tensorflow/c/c_api.h ${pkgdir}/usr/include/tensorflow/c/c_api.h
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/tensorflow/LICENSE
}

package_python-tensorflow-cpu-git() {
  depends=(python-protobuf python-numpy absl-py)
  conflicts=(python-tensorflow python-tensorflow-git)
  provides=(python-tensorflow)

  cd ${srcdir}/tensorflow

  # tensorboard has been separated from upstream but they still install it with
  # tensorflow. I don't know what kind of sense that makes but we have to clean
  # it out from this pacakge.
  rm -rf ${pkgdir}/usr/bin/tensorboard

  WHEEL_PACKAGE=$(find ${srcdir}/tmpcuda -name "tensor*.whl")
  pip install --ignore-installed --upgrade --root $pkgdir/ $WHEEL_PACKAGE --no-dependencies

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/python-tensorflow/LICENSE
}

# vim:set ts=2 sw=2 et:
