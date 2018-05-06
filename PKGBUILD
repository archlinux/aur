# Maintainer: enihcam <nanericwang at the google email domain which is .com>

pkgbase=tensorflow-computecpp
pkgname=(tensorflow-computecpp python-tensorflow-computecpp)
pkgver=ComputeCpp+0.6.0+31+g0367804e7e
pkgrel=1
pkgdesc="Library for computation using data flow graphs for scalable machine learning (backend with ComputeCpp)"
url="https://github.com/lukeiwanski/tensorflow"
license=('APACHE')
arch=('x86_64')
depends=(opencl-icd-loader computecpp)
makedepends=(git opencl-icd-loader computecpp bazel python-numpy python-pip python-wheel python-setuptools)
options=(!ccache)
source=("git+${url}#branch=dev/amd_gpu"
        17508.patch)
sha512sums=('SKIP'
            'cb2880767532275f55f91ab66b29687fceadcadb8e23608d1e59b35a2899239882367ac38465a5e635f17378286093da0ede115668e23d651776d962ddc35ea9')

pkgver() {
  cd ${srcdir}/tensorflow
  git describe --tags | sed 's/-/+/g;s/v//;'
}

prepare() {
  patch -Np1 -i ${srcdir}/17508.patch -d tensorflow

  # These environment variables influence the behavior of the configure call below.
  export PYTHON_BIN_PATH=/usr/bin/python
  export USE_DEFAULT_PYTHON_LIB_PATH=1
  export CC_OPT_FLAGS="${CXXFLAGS} -no-serial-memop"
  export TF_CUDA_CLANG=0
  export TF_NEED_CUDA=0
  export TF_NEED_JEMALLOC=0
  export TF_NEED_GCP=0
  export TF_NEED_HDFS=0
  export TF_ENABLE_XLA=0
  export TF_NEED_GDR=0
  export TF_NEED_VERBS=0
  export TF_NEED_MPI=0
  export TF_NEED_S3=0
  export TF_NEED_KAFKA=0
  export TF_NEED_TENSORRT=0
  export TF_SET_ANDROID_WORKSPACE=0
  export TF_NEED_OPENCL=1
  export TF_NEED_OPENCL_SYCL=1
  export TF_NEED_COMPUTECPP=1
  export TF_SYCL_BITCODE_TARGET=spir64
  export COMPUTECPP_TOOLKIT_PATH=/opt/ComputeCpp-CE
  export COMPUTE=:0

  # make sure the proxy variables are in all caps, otherwise bazel ignores them
  export HTTP_PROXY=`echo $http_proxy | sed -e 's/\/$//'`
  export HTTPS_PROXY=`echo $https_proxy | sed -e 's/\/$//'`
}

build() {
  # _bazel_09_fix="--incompatible_load_argument_is_label=false"
  cd ${srcdir}/tensorflow

  ./configure
  bazel build --config=opt --config=sycl //tensorflow:libtensorflow.so //tensorflow/tools/pip_package:build_pip_package # ${_bazel_09_fix}
  bazel-bin/tensorflow/tools/pip_package/build_pip_package ${srcdir}/tmp
}

package_tensorflow-computecpp() {
  conflicts=(tensorflow)
  provides=(tensorflow)

  cd ${srcdir}/tensorflow

  tensorflow/c/generate-pc.sh --prefix=/usr --version=${pkgver}
  install -Dm644 tensorflow.pc ${pkgdir}/usr/lib/pkgconfig/tensorflow.pc
  install -Dm755 bazel-bin/tensorflow/libtensorflow.so ${pkgdir}/usr/lib/libtensorflow.so
  install -Dm755 bazel-bin/tensorflow/libtensorflow_framework.so ${pkgdir}/usr/lib/libtensorflow_framework.so
  install -Dm644 tensorflow/c/c_api.h ${pkgdir}/usr/include/tensorflow/c/c_api.h
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

package_python-tensorflow-computecpp() {
  conflicts=(python-tensorflow)
  provides=(python-tensorflow)
  depends=(python-numpy python-protobuf absl-py)
  optdepends=('python-werkzeug: for using tensorboard')

  cd ${srcdir}/tensorflow

  WHEEL_PACKAGE=$(find ${srcdir}/tmp -name "tensor*.whl")
  pip install --ignore-installed --upgrade --root $pkgdir/ $WHEEL_PACKAGE --no-dependencies

  # tensorboard has been separated from upstream but they still install it with
  # tensorflow. I don't know what kind of sense that makes but we have to clean
  # it out from this pacakge.
  rm -rf ${pkgdir}/usr/bin/tensorboard

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
