# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name='ccm'
pkgname=python-${_name}
pkgver=3.1.6.dev3
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
sha256sums=('c881a62929df353038a088ce8e06996bb93fc2af4a3d9b4551ceb80b95719707')

prepare(){
  # Fix test
  cd "${srcdir}"/cassandra-ccm-cassandra-test
  sed -i 's/assertEquals/assertEqual/g' tests/test_lib.py
}

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
