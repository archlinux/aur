# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name='ccm'
pkgname=python-${_name}
pkgver=3.1.6.dev4
pkgrel=1
pkgdesc="Cassandra Cluster Manager."
url="https://github.com/apache/cassandra-ccm"
arch=('any')
license=('Apache-2.0')
depends=('python' 'python-pyyaml' 'python-six' 'python-psutil')
makedepends=('python-setuptools' 'python-pbr' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-mock' 'python-pytest' 'python-requests')
optdepends=('python-paramiko: Remote execution')
source=("${url}/archive/refs/tags/cassandra-test.tar.gz")
sha256sums=('e97667ad7b0561e71961f5ce6ee6b6f732d6cf583fe7f6e1fe5920f6a2df78d8')

build() {
  cd "${srcdir}"/cassandra-ccm-cassandra-test
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --override-ini="addopts="
  )
  cd "${srcdir}"/cassandra-ccm-cassandra-test
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/cassandra-ccm-cassandra-test
  python -m installer --destdir="$pkgdir" dist/*.whl
}
