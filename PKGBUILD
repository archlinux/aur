# Maintainer: Oystein Sture <oysstu (at) gmail (dot) com>
# Contributor:
pkgname=python-tensorflow-probability
pkgver=0.24.0
pkgrel=1
pkgdesc="Probabilistic reasoning and statistical analysis in TensorFlow"
url="https://github.com/tensorflow/probability"
arch=('any')
license=('APACHE')
depends=('python' 'python-tensorflow' 'python-numpy' 'python-six' 'python-decorator' 'python-cloudpickle' 'python-gast' 'python-dm-tree' 'python-absl')
makedepends=('python-setuptools' 'bazel')
source=("https://github.com/tensorflow/probability/archive/v${pkgver}.tar.gz")
sha256sums=('3d75418cef09ea357ee879347133ab784fe4637a5ba251a8e06ef930dd970a3e')

build() {
  # Force OpenJDK-11
  export JAVA_HOME=/usr/lib/jvm/java-11-openjdk

  cd "${srcdir}"/probability-${pkgver}
  bazel build --copt=-O3 --copt=-march=native :pip_pkg
  cd ./bazel-bin/pip_pkg.runfiles/_main
  python setup.py build --release
}

package() {
  cd "${srcdir}"/probability-${pkgver}/bazel-bin/pip_pkg.runfiles/_main
  python setup.py install --release --root=${pkgdir} --optimize=1 --skip-build
}
