# Maintainer: Oystein Sture <oysstu (at) gmail (dot) com>
# Contributor:
pkgname=python-tensorflow-probability
pkgver=0.25.0
pkgrel=3
pkgdesc="Probabilistic reasoning and statistical analysis in TensorFlow"
url="https://github.com/tensorflow/probability"
arch=('any')
license=('Apache-2.0')
depends=('python' 'python-tensorflow' 'python-numpy' 'python-six' 'python-decorator' 'python-cloudpickle' 'python-gast' 'python-dm-tree' 'python-absl' 'python-tf-keras')
makedepends=('python-setuptools' 'bazel' 'python-absl')
source=("https://github.com/tensorflow/probability/archive/v${pkgver}.tar.gz")
sha256sums=('73cf3e52d3b5ee48fc919631e7fa3621849b8ce8d453017016a5148815856bc2')

build() {
  # Force OpenJDK-21
  export JAVA_HOME=/usr/lib/jvm/java-21-openjdk

  cd "${srcdir}"/probability-${pkgver}
  bazel build --enable_bzlmod=no --enable_workspace --verbose_failures --spawn_strategy=local --copt=-O3 --copt=-march=native :pip_pkg

  cd "${srcdir}/probability-${pkgver}/bazel-bin/pip_pkg.runfiles/tensorflow_probability"
  python setup.py build --release
}

package() {
  cd "${srcdir}/probability-${pkgver}/bazel-bin/pip_pkg.runfiles/tensorflow_probability"
  python setup.py install --release --root=${pkgdir} --optimize=1 --skip-build
}
