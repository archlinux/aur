# Maintainer: Pieter Robyns <pieter.robyns@uhasselt.be>
# Upstream URL: https://github.com/tensorflow/tensorflow

pkgname=tensorflow-git
pkgver=0.5.0.r17.ga9ca517
pkgrel=1
pkgdesc="Open source software library for numerical computation using data flow graphs."
arch=('i686' 'x86_64')
url="https://tensorflow.org/"
license=('Apache2')
provides=('tensorflow')
conflicts=('tensorflow' 'python2-tensorflow')
depends=('python2-numpy' 'swig' 'python2-wheel')
makedepends=('git' 'python2-pip' 'bazel')
source=("git+https://github.com/tensorflow/tensorflow"
        "git+https://github.com/google/protobuf")
md5sums=('SKIP' 'SKIP')

pkgver() {
  cd "$srcdir/tensorflow"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  # Config submodules
  cd "$srcdir/tensorflow"
  git submodule init
  git config submodule.google/protobuf.url $srcdir/protobuf
  git submodule update

  # Set up some things for building
  export PYTHON=python2
  mkdir -p "$srcdir/tmp"
}

build() {
  echo "Make sure your .bazelrc points to the correct workspace, e.g. %workspace%:/opt/bazel/base_workspace."

  # Build tensorflow
  cd "$srcdir/tensorflow"

  ./configure
  bazel build --jobs 2 -c opt //tensorflow/tools/pip_package:build_pip_package

  sed -i 's/python$/python2/g' tools/python_bin_path.sh
  bazel-bin/tensorflow/tools/pip_package/build_pip_package $srcdir/tmp
}

package() {
  cd "$srcdir/tensorflow"

  TMP_PKG=`find $srcdir/tmp -name "tensor*.whl"`
  pip2 install --ignore-installed --upgrade --root $pkgdir/ $TMP_PKG --no-dependencies
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
