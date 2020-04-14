# Maintainer: Oystein Sture <oysstu (at) gmail (dot) com>
# Contributor: 
pkgname=python-tensorflow-probability
pkgver=0.9.0
pkgrel=4
pkgdesc="Probabilistic reasoning and statistical analysis in TensorFlow"
url="https://github.com/tensorflow/probability"
arch=('any')
license=('APACHE')
depends=('python-tensorflow' 'python-numpy' 'python-six' 'python-decorator' 'python-cloudpickle' 'python-gast')
makedepends=('python-setuptools' 'bazel')
source=("https://github.com/tensorflow/probability/archive/v${pkgver}.tar.gz"
        "0001-Whitelist-tf.linalg.LinearOperatorBlockLowerTriangul.patch")
sha256sums=('2c58d592e93bb8733110a819cb8f06ede91faa1b12c01342e406f1387dc7d919'
            'fe2da00f87f1a96aafbc9c3de0e3fd6b6ed741bdd4f788352888c31f15168c20')

prepare() {
  cd "${srcdir}"/probability-${pkgver}
  patch --strip=1 --input="${srcdir}/0001-Whitelist-tf.linalg.LinearOperatorBlockLowerTriangul.patch"
}
            
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
