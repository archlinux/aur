# Maintainer: enihcam <nanericwang at the google email domain which is .com>

pkgbase=tensorflow-computecpp
pkgname=(tensorflow-computecpp python-tensorflow-computecpp)
pkgver=1.9
pkgrel=6
pkgdesc="Library for computation using data flow graphs for scalable machine learning (backend with ComputeCpp)"
url="https://github.com/codeplaysoftware/tensorflow"
epoch=1
license=('APACHE')
arch=('x86_64')
depends=(opencl-icd-loader computecpp)
makedepends=(git opencl-icd-loader computecpp cmake opencl-headers
             python-numpy python-pip python-wheel python-setuptools java-environment=8)
options=(!ccache)
source=("git+${url}"
        #"https://github.com/bazelbuild/bazel/releases/download/0.17.2/bazel-0.17.2-dist.zip"
        "https://archive.org/download/archlinux_pkg_bazel/bazel-0.17.2-1-x86_64.pkg.tar.xz"
         python37.patch
         py37.diff
         gcc1.diff
         gcc2.diff
         gcc3.diff
         python38.patch)
sha256sums=('SKIP'
            '758e10caff4c1cb496d1cf49d6f4da2969b610b174276fb734b8502686d07ddd'
            'ef54b3783a05b5604cd8f448136567686806ad3a5759978f48549256807a8394'
            'b3997091bc7a32f9e8c062a88e9148273090ebf66aeebb5dc055baa41b7aae7e'
            '7d9f32a46cac83ec1a7308ac380226cdf40f98830c869bcdf5feb7bf110abf9a'
            '10de738141852cfebae9847b746ae9b58f3b3985561cccede929d8fbdba93551'
            '742abe5d8bfd3f7ce33778a08cbb233337db56238d11ac2ad07171b0d6097bfb'
            'b69895cfd098efacc95b1d1fffd471afa05c449f8d42964ee10b1a6fd9a75689')

prepare() {
  # These environment variables influence the behavior of the configure call below.
  export PYTHON_BIN_PATH=/usr/bin/python
  export USE_DEFAULT_PYTHON_LIB_PATH=1
  export TF_DOWNLOAD_CLANG=0
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
  export COMPUTECPP_TOOLKIT_PATH=/opt/ComputeCpp-CE
  export COMPUTE=:0
# Device-sensitive magic, these should work on as much hardware as possible
  export TF_USE_HALF_SYCL=0
  export TF_USE_DOUBLE_SYCL=0
  export TF_SYCL_BITCODE_TARGET=spir64
  export CC_OPT_FLAGS="-march=native -mfpmath=sse -O2 -pipe"  # -sycl-compress-name for some amd cards

  # make sure the proxy variables are in all caps, otherwise bazel ignores them
  export HTTP_PROXY=`echo $http_proxy | sed -e 's/\/$//'`
  export HTTPS_PROXY=`echo $https_proxy | sed -e 's/\/$//'`

  cd ${srcdir}/tensorflow
  git apply --index ../python37.patch
  git apply --index --whitespace=nowarn ../py37.diff
  git apply --index --whitespace=nowarn ../gcc1.diff
  git apply --index --whitespace=nowarn ../gcc2.diff
  git apply --index --whitespace=nowarn ../gcc3.diff
  git apply --index ../python38.patch
}

build() {
  # Build bazel
  echo "Please note: currently, bazel version <0.18 is required to build this package."
  echo "Fixing that for you" # "Building it temporarily..."
  cd "$srcdir"
  # ./compile.sh
  export PATH=`pwd`/usr/bin:$PATH

  cd ${srcdir}/tensorflow
  if [ ! -f .bazelrc ]; then  # configure should be in prepare, but bazel has to be built first atm
    ./configure
  fi

# Please take notice this requires at least 8GB of swap/disk space and 0.7+(3.2*threads)GB of RAM to build
  bazel build -c opt --config=sycl //tensorflow:libtensorflow.so \
    //tensorflow/tools/pip_package:build_pip_package # --jobs 1 --verbose_failures
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
  pip install --ignore-installed --upgrade --root $pkgdir/ $WHEEL_PACKAGE --no-dependencies --no-warn-script-location

  # tensorboard has been separated from upstream but they still install it with
  # tensorflow. I don't know what kind of sense that makes but we have to clean
  # it out from this pacakge.
  rm -rf ${pkgdir}/usr/bin/tensorboard

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
