# Maintainer: Adria Arrufat (archdria) <adria.arrufat+AUR@protonmail.ch>

pkgname=tensorflow
pkgver=0.12.1+1600+ge4dde23d5
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
_commit=e4dde23d58a10c9d0c14005d20d1ecdd599539ac
source=("git+https://github.com/tensorflow/tensorflow#commit=$_commit"
        "march_native.diff"
        "https://bitbucket.org/eigen/eigen/raw/9ba936354ee8b73fb1966dcb2d3506387bb357f1/unsupported/Eigen/CXX11/src/Tensor/TensorContractionThreadPool.h")

md5sums=('SKIP'
         '696beeb14be1d669066ce51819eb6044'
         '1bf688d25c599906f0ffddde97aca1ed')

pkgver() {
  cd "${srcdir}/tensorflow"
  git describe --tags | sed 's/-/+/g'
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

  # make sure the proxy variables are in all caps, otherwise bazel ignores them
  export HTTP_PROXY=`echo $http_proxy | sed -e 's/\/$//'`
  export HTTPS_PROXY=`echo $https_proxy | sed -e 's/\/$//'`

  # hack to enable build with -march=native from: https://github.com/tensorflow/tensorflow/issues/6558
  mkdir -p third_party/eigen3/unsupported/Eigen/CXX11/src/Tensor
  cp ../TensorContractionThreadPool.h third_party/eigen3/unsupported/Eigen/CXX11/src/Tensor/TensorContractionThreadPool.h
  patch -Np1 -i ../march_native.diff
}

build() {
  cd ${srcdir}/tensorflow
  ./configure
  bazel build -c opt ${_build_opts} --copt=-march=native tensorflow:libtensorflow_c.so
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
