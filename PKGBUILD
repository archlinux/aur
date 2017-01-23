# Maintainer: Oliver Mader <b52@reaktor42.de>
# Contributor: Vladislav Odobesku <positivcheg94@gmail.com>

pkgname=python-tensorflow
pkgver=0.12.1
pkgrel=2

pkgdesc="Computation using data flow graphs for scalable machine learning."
url="https://tensorflow.org/"
license=('Apache2')

arch=('i686' 'x86_64')

provides=('python-tensorflow')
conflicts=('python-tensorflow-git' 'python-tensorflow-cuda' 'tensorflow' 'tensorflow-git')
depends=('python-numpy' 'python-protobuf')
makedepends=('python-wheel' 'python-pip' 'bazel' 'cuda' 'cudnn' 'gcc5')
optdepends=('cuda: GPU support' 'cudnn: GPU support')

source=("https://github.com/tensorflow/tensorflow/archive/${pkgver}.zip"
        'python-tensorflow.sh')
md5sums=('5cbd72426e1f16d103eb8f780488bf82'
         '0c9dae7ad2ef6ea234b6aa178a688d7b')

prepare() {
  cd "$srcdir/tensorflow-${pkgver}"

  # fix for issue 6594
  sed -i 's|zlib.net/zlib|zlib.net/fossils/zlib|' "$srcdir/tensorflow-${pkgver}/tensorflow/workspace.bzl"
}

build() {
  cd "$srcdir/tensorflow-${pkgver}"

  # Some of this are set to the default value just to avoid an interactive prompt while building.
  export PYTHON_BIN_PATH=/usr/bin/python
  export PYTHON_LIB_PATH=$($PYTHON_BIN_PATH -c 'import site; print(site.getsitepackages()[0])')
  export TF_NEED_GCP=0
  export TF_NEED_HDFS=0
  export TF_NEED_OPENCL=0
  export TF_NEED_CUDA=1
  export TF_CUDA_COMPUTE_CAPABILITIES="3.5,5.2"
  export CUDA_TOOLKIT_PATH=/opt/cuda
  export CUDNN_INSTALL_PATH=/opt/cuda
  export TF_CUDA_VERSION=$($CUDA_TOOLKIT_PATH/bin/nvcc --version | sed -n 's/^.*release \(.*\),.*/\1/p')
  export TF_CUDNN_VERSION=$(sed -n 's/^#define CUDNN_MAJOR\s*\(.*\).*/\1/p' $CUDNN_INSTALL_PATH/include/cudnn.h)
  export GCC_HOST_COMPILER_PATH=/usr/bin/gcc-5

  ./configure
  bazel build -c opt --config=cuda //tensorflow/tools/pip_package:build_pip_package
  bazel-bin/tensorflow/tools/pip_package/build_pip_package $srcdir/tmp
  bazel shutdown
}

package() {
  cd "$srcdir/tensorflow-${pkgver}"

  WHEEL_PACKAGE=`find $srcdir/tmp -name "tensor*.whl"`

  pip install --ignore-installed --upgrade --root $pkgdir/ $WHEEL_PACKAGE --no-dependencies
  find ${pkgdir} -name __pycache__ -exec rm -r {} +

  install -Dm755 $srcdir/python-tensorflow.sh "$pkgdir/etc/profile.d/python-tensorflow.sh"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

