# Maintainer: piernov <piernov@piernov.org>
# Contributor: Oystein Sture <oysstu (at) gmail (dot) com>

pkgname=python-tensorflow-probability-git
pkgver=r10119.90fc5c917
pkgrel=1
pkgdesc="Probabilistic reasoning and statistical analysis in TensorFlow"
url="https://github.com/tensorflow/probability"
arch=('any')
license=('APACHE')
depends=('python-tensorflow' 'python-numpy' 'python-six' 'python-decorator' 'python-cloudpickle' 'python-dm-tree')
makedepends=('python-setuptools' 'bazel')
source=("git+https://github.com/tensorflow/probability.git")
sha256sums=('SKIP')

pkgver() {
  cd probability
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # Force OpenJDK-11
  export JAVA_HOME=/usr/lib/jvm/java-11-openjdk

  cd "${srcdir}"/probability
  bazel build --copt=-O3 --copt=-march=native :pip_pkg
  cd ./bazel-bin/pip_pkg.runfiles/tensorflow_probability
  python setup.py build --release
}

package() {
  cd "${srcdir}"/probability/bazel-bin/pip_pkg.runfiles/tensorflow_probability
  python setup.py install --release --root=${pkgdir} --optimize=1 --skip-build
}
