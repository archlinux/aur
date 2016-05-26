# Maintainer: Vladislav Odobesku positivcheg94@gmail.com

pkgname=python-tensorflow
pkgver=0.8.0
pkgrel=1

pkgdesc="Open source software library for numerical computation using data flow graphs."
url="https://tensorflow.org/"
license=('Apache2')

arch=('i686' 'x86_64')

provides=('python-tensorflow')
conflicts=('python-tensorflow-git' 'python-tensorflow-cuda')
depends=('python-numpy' 'swig' 'python-wheel' 'python-protobuf3')
makedepends=('git' 'python-pip' 'bazel' 'rsync')
optdepends=('cuda: GPU support' 'cudnn: GPU support')

source=("https://github.com/tensorflow/tensorflow/archive/v${pkgver}.tar.gz")

md5sums=("ec50601dc253a41eae1317b8690b8954")

protobuf_commit='fb714b3606bd663b823f6960a73d052f97283b74'
_build_opts=''
# limit the cores and ram for compiling
#_build_opts='--local_resources 1536.0,1.0,1.0 '

prepare() {
   cd ${srcdir}
   ln -s tensorflow-${pkgver} tensorflow
   cd tensorflow/google
   git clone https://github.com/google/protobuf/
   cd protobuf
   git reset --hard ${protobuf_commit}

   export PYTHON_BIN_PATH=/usr/bin/python
#   if (pacman -Q cuda &>/dev/null && pacman -Q cudnn &>/dev/null); then
#      echo "CUDA support enabled"
#      _build_opts="--config=cuda"
#      export TF_NEED_CUDA=1
#      export TF_UNOFFICIAL_SETTING=1
#      export CUDA_TOOLKIT_PATH=/opt/cuda
#      export CUDNN_INSTALL_PATH=/opt/cuda
#   else
      echo "CUDA support disabled"
      export TF_NEED_CUDA=0
#   fi

   mkdir -p "$srcdir/tmp"
}

build() {
   echo "$srcdir"
   echo "Make sure your .bazelrc points to the correct workspace, e.g. %workspace%:/opt/bazel/base_workspace."
   cd "$srcdir/tensorflow"
   ./configure
   bazel build -c opt ${_build_opts} //tensorflow/tools/pip_package:build_pip_package
   bazel-bin/tensorflow/tools/pip_package/build_pip_package $srcdir/tmp
}

package() {
   cd "$srcdir/tensorflow"
   TMP_PKG=`find $srcdir/tmp -name "tensor*.whl"`
   pip install --ignore-installed --upgrade --root $pkgdir/ $TMP_PKG --no-dependencies
   install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
   find ${pkgdir} -name __pycache__ -exec rm -r {} +
}
