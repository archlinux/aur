# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=cassandra-driver
pkgname=python-${_name}
pkgdesc="DataStax Driver for Apache Cassandra."
pkgver=3.29.2
provides=(python-${_name})
pkgrel=1
arch=('any')
license=('Apache-2.0')
depends=('python' 'python-geomet')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-scales' 'python-pytest' 'python-ccm' 'python-pytz' 'python-sure' 'python-pure-sasl' 'python-twisted' 'python-pyopenssl' 'python-service-identity' 'python-idna' 'python-gevent' 'python-eventlet' 'cython' 'python-packaging' 'python-futurist' 'python-asynctest' 'python-pykerberos'  'python-cryptography') # 'python-gremlin'
optdepends=('python-gremlin: graph' 'python-cryptography: cle')
url="https://github.com/datastax/python-driver"
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('aa3be5396e05b395c178091656a329daba23b0d4dd69b8d076090157f86e6d13')

build() {
  cd "${srcdir}"/"${_name/cassandra/python}"-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --override-ini="addopts="
  )
  cd "${srcdir}"/"${_name/cassandra/python}"-${pkgver}
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" test
}

package() {
  cd "${srcdir}"/"${_name/cassandra/python}"-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
