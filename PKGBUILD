# Maintainer: Oystein Sture <oysstu (at) gmail (dot) com>
# Contributor: 
pkgname=python-tensorflow-probability
pkgver=0.9.0
pkgrel=3
pkgdesc="Probabilistic reasoning and statistical analysis in TensorFlow"
url="https://github.com/tensorflow/probability"
arch=('any')
license=('APACHE')
depends=('python-tensorflow' 'python-numpy' 'python-six' 'python-decorator' 'python-cloudpickle' 'python-gast')
makedepends=('python-setuptools' 'bazel')
source=("https://github.com/tensorflow/probability/archive/v${pkgver}.tar.gz")
sha256sums=('2c58d592e93bb8733110a819cb8f06ede91faa1b12c01342e406f1387dc7d919')

build() {
  # Force OpenJDK-11
  export JAVA_HOME=/usr/lib/jvm/java-11-openjdk

  cd "${srcdir}"/probability-${pkgver}
  bazel build --copt=-O3 --copt=-march=native :pip_pkg
  cd ./bazel-bin/pip_pkg.runfiles/tensorflow_probability
  python setup.py build --release
}

package() {
  cd "${srcdir}"/probability-${pkgver}/bazel-bin/pip_pkg.runfiles/tensorflow_probability
  python setup.py install --release --root=${pkgdir} --optimize=1 --skip-build
}
