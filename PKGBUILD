# Maintainer: Oystein Sture <oysstu (at) gmail (dot) com>
# Contributor: 
pkgname=python-tensorflow-probability
pkgver=0.20.0
pkgrel=1
pkgdesc="Probabilistic reasoning and statistical analysis in TensorFlow"
url="https://github.com/tensorflow/probability"
arch=('any')
license=('APACHE')
depends=('python' 'python-tensorflow' 'python-numpy' 'python-six' 'python-decorator' 'python-cloudpickle' 'python-gast03' 'python-dm-tree' 'python-absl')
makedepends=('python-setuptools' 'bazel')
source=("https://github.com/tensorflow/probability/archive/v${pkgver}.tar.gz")
sha256sums=('f0fb9a1f88a36a8f57d4d9cce4f9bf8dfacb6fc7778751729fe3c3067e5a1363')
            
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
