# Maintainer: Adria Arrufat (archdria) <adria.arrufat+AUR@protonmail.ch>
# Contributor: Vladislav Odobesku positivcheg94@gmail.com

pkgname=python-tensorflow-git
pkgver=0.7.1.r1480.gf58acff
pkgrel=1

pkgdesc="Open source software library for numerical computation using data flow graphs."
url="https://tensorflow.org/"
license=('Apache2')

arch=('i686' 'x86_64')

provides=('tensorflow')
conflicts=('tensorflow' 'tensorflow-git', 'python-tensorflow')
depends=('python-numpy' 'swig' 'python-wheel' 'python-protobuf3')
makedepends=('git' 'python-pip' 'bazel')
source=("git+https://github.com/tensorflow/tensorflow"
        "git+https://github.com/google/protobuf")
md5sums=('SKIP'
         'SKIP')

pkgver() {
  cd "$srcdir/tensorflow"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "$srcdir/tensorflow"
  git submodule init
  git config submodule.google/protobuf.url $srcdir/protobuf
  git submodule update
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

# vim:set ts=2 sw=2 et:
