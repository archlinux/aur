# Maintainer: Vladislav Odobesku positivcheg94@gmail.com

pkgname=python-tensorflow-git
pkgver=0.7
pkgrel=1

pkgdesc="Open source software library for numerical computation using data flow graphs."
url="https://tensorflow.org/"
license=('Apache2')

arch=('i686' 'x86_64')

provides=('tensorflow')
conflicts=('tensorflow' 'tensorflow-git', 'python-tensorflow')
depends=('python-numpy' 'swig' 'python-wheel' 'python-protobuf3')
makedepends=('git' 'python-pip' 'bazel')



prepare() {
  git clone --recurse-submodules https://github.com/tensorflow/tensorflow -b r0.7
  mkdir -p "$srcdir/tmp"
}

build() {
  echo "Make sure your .bazelrc points to the correct workspace, e.g. %workspace%:/opt/bazel/base_workspace."

  cd "$srcdir/tensorflow"

  ./configure
  bazel build --jobs 2 -c opt //tensorflow/tools/pip_package:build_pip_package

  bazel-bin/tensorflow/tools/pip_package/build_pip_package $srcdir/tmp
}

package() {
  cd "$srcdir/tensorflow"

  TMP_PKG=`find $srcdir/tmp -name "tensor*.whl"`
  pip install --ignore-installed --upgrade --root $pkgdir/ $TMP_PKG --no-dependencies
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
