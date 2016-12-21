# Maintainer: Adria Arrufat (archdria) <adria.arrufat+AUR@protonmail.ch>

pkgname=tensorflow
pkgver=0.12.0
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
_commit=c62a66bcd4d6f009e0b416055e2ecb8ef50fd0aa
source=("git+https://github.com/tensorflow/tensorflow#commit=$_commit"
        "${pkgname}.pc")
md5sums=('SKIP'
         '9a47475140d2f2e46454070ea9465792')
pkgver() {
  cd ${srcdir}/tensorflow
  git describe --tags | sed 's/-/./g;s/^v//'
}

prepare() {
  cd ${srcdir}/tensorflow
  # setup environment variables
  export PYTHON_BIN_PATH=/usr/bin/python
  export PYTHON_LIB_PATH=/usr/lib/python3.5/site-packages
  export TF_NEED_OPENCL=0
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
    export TF_CUDA_VERSION=8.0
    export TF_CUDNN_VERSION=5
    export TF_CUDA_COMPUTE_CAPABILITIES=3.5,5.2
  else
    msg2 "CUDA support disabled"
    export TF_NEED_CUDA=0
  fi
  # disable Google Cloud Platform support
  export TF_NEED_GCP=0
  # disable Hadoop File System support
  export TF_NEED_HDFS=0
  # make sure the proxy variables are in all caps, otherwise bazel ignores them
  export HTTP_PROXY=`echo $http_proxy | sed -e 's/\/$//'`
  export HTTPS_PROXY=`echo $https_proxy | sed -e 's/\/$//'`
}

build() {
  cd ${srcdir}/tensorflow
  ./configure
  bazel build -c opt ${_build_opts} tensorflow:libtensorflow_c.so
  # copy the built library out of the bazel directory
  cp -f bazel-bin/tensorflow/libtensorflow_c.so .
}

package() {
  cd ${srcdir}/tensorflow
  install -Dm644 libtensorflow_c.so ${pkgdir}/usr/lib/lib${pkgname}.so
  install -Dm644 tensorflow/c/c_api.h ${pkgdir}/usr/include/${pkgname}/c_api.h
  install -Dm644 ../${pkgname}.pc ${pkgdir}/usr/lib/pkgconfig/${pkgname}.pc
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
