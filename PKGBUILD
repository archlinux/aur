# Maintainer: Sasasu <lizhaolong0123@gmail.com>

pkgname=python-sonnet-git
pkgver=9d209830
pkgrel=2

pkgdesc="TensorFlow-based neural network library."
url="https://github.com/deepmind/sonnet"
license=('Apache2')

arch=('i686' 'x86_64')

provides=('python-sonnet')
conflicts=('python-sonnet')
depends=('python-tensorflow' 'gcc-libs' 'python')
makedepends=('git' 'python-pip' 'bazel')
optdepends=('cuda: GPU support'
            'cudnn: GPU support')
source=("git+https://github.com/deepmind/sonnet"
        "10.patch" # for py3
        "6.patch" # fix compile time error
        )
md5sums=('SKIP'
         '59576111303e2ab99bf106fe0dcd5ff8'
         '67cb9424d7c8e01f822de1a4d7787c98')

pkgver() {
  cd ${srcdir}/sonnet
  git rev-list HEAD  | sed -n '1p'  | cut -c1-8
}


prepare() {
   cd ${srcdir}/sonnet
   
   patch -Np1 -i $srcdir/6.patch # fix compile time error
   patch -Np1 -i $srcdir/10.patch # for py3
   
   git submodule update --init --recursive
}

configure_tensorflow() {
  cd ${srcdir}/sonnet/tensorflow

  # clean and create the directory to store the wheel file
  if [ -d ${srcdir}/tmp ]; then
    rm -rf ${srcdir}/tmp
  else
    mkdir -p ${srcdir}/tmp
  fi

  # setup environment variables
  export PYTHON_BIN_PATH=/usr/bin/python
  export USE_DEFAULT_PYTHON_LIB_PATH=1
  if (pacman -Q cuda &>/dev/null && pacman -Q cudnn &>/dev/null); then
    msg2 "CUDA support enabled"
    _build_opts="--config=cuda"
    makedepends+=gcc-5
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
  # enable XLA JIT compiler
  export TF_ENABLE_XLA=1
  # enable jemalloc support
  export TF_NEED_JEMALLOC=1
  # set up architecture dependent optimization flags
  export CC_OPT_FLAGS="-march=native"
  # use nvcc instead of clang to build CUDA
  export TF_CUDA_CLANG=0

  # make sure the proxy variables are in all caps, otherwise bazel ignores them
  export HTTP_PROXY=`echo $http_proxy | sed -e 's/\/$//'`
  export HTTPS_PROXY=`echo $https_proxy | sed -e 's/\/$//'`
  
  ./configure
}

build() {
  cd ${srcdir}/sonnet/tensorflow
  msg2 "Configure tensorflow..."
  configure_tensorflow
  
  cd ${srcdir}/sonnet
  msg2 "Building sonnet..."
  bazel build  --ignore_unsupported_sandboxing --config=opt :install 

  mkdir -p tmp
  msg2 "Building pip package..."
  ./bazel-bin/install $(pwd)
}

package() {
  cd ${srcdir}/sonnet
  PKG=`find $srcdir -name "sonnet-*.whl"`
  pip install --ignore-installed --upgrade --root $pkgdir/ $PKG --no-dependencies
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
