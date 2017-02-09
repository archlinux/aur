# Maintainer: Adria Arrufat (archdria) <adria.arrufat+AUR@protonmail.ch>

pkgname=tensorflow
pkgver=1.0.0+rc2
pkgrel=1
pkgdesc="Library for computation using data flow graphs for scalable machine learning"
url="https://www.tensorflow.org/"
license=('Apache2')
arch=('i686' 'x86_64')
provides=('tensorflow' 'libtensorflow')
conflicts=('tensorflow' 'libtensorflow')
makedepends=('git' 'bazel' 'python-numpy')
optdepends=('cuda: GPU support'
            'cudnn: GPU support')
_commit=1536a84f32f1fe77efd3fee6e5933a1dfe4e10bb
source=("git+https://github.com/tensorflow/tensorflow#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/tensorflow"
  git describe --tags | sed 's/-/+/g;s/v//;'
}

prepare() {
  cd ${srcdir}/tensorflow
  # setup environment variables
  export PYTHON_BIN_PATH=/usr/bin/python
  export USE_DEFAULT_PYTHON_LIB_PATH=1
  if (pacman -Q cuda &>/dev/null && pacman -Q cudnn &>/dev/null); then
    msg2 "CUDA support enabled"
    _build_opts="--config=cuda"
    makedepends+=gcc5
    export GCC_HOST_COMPILER_PATH=/usr/bin/gcc-5
    export TF_NEED_CUDA=1
    export TF_UNOFFICIAL_SETTING=1
    export CUDA_TOOLKIT_PATH=/opt/cuda
    export CUDNN_INSTALL_PATH=/opt/cuda
    # adapt to your needs
    export TF_CUDA_VERSION=$($CUDA_TOOLKIT_PATH/bin/nvcc --version | sed -n 's/^.*release \(.*\),.*/\1/p')
    export TF_CUDNN_VERSION=$(sed -n 's/^#define CUDNN_MAJOR\s*\(.*\).*/\1/p' $CUDNN_INSTALL_PATH/include/cudnn.h)
    export TF_CUDA_COMPUTE_CAPABILITIES=3.5,5.2
  else
    msg2 "CUDA support disabled"
    export TF_NEED_CUDA=0
  fi

  # disable Google Cloud Platform support
  export TF_NEED_GCP=0
  # disable Hadoop File System support
  export TF_NEED_HDFS=0
  # disable OpenCL support
  export TF_NEED_OPENCL=0
  # disable XLA JIT compiler
  export TF_ENABLE_XLA=1
  # enable jemalloc support
  export TF_NEED_JEMALLOC=1
  # set up architecture dependent optimization flags
  export CC_OPT_FLAGS="-march=native"

  # make sure the proxy variables are in all caps, otherwise bazel ignores them
  export HTTP_PROXY=`echo $http_proxy | sed -e 's/\/$//'`
  export HTTPS_PROXY=`echo $https_proxy | sed -e 's/\/$//'`
}

build() {
  cd ${srcdir}/tensorflow
  ./configure
  bazel build -c opt ${_build_opts} --copt=${CC_OPT_FLAGS} tensorflow:libtensorflow_c.so
  # copy the built library out of the bazel directory
  cp -f bazel-bin/tensorflow/libtensorflow_c.so .
}

package() {
  cd ${srcdir}/tensorflow
  install -Dm644 libtensorflow_c.so ${pkgdir}/usr/lib/lib${pkgname}.so
  install -Dm644 tensorflow/c/c_api.h ${pkgdir}/usr/include/${pkgname}/c_api.h
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
