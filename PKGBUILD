# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgname=python-kombu
_pkgname=${pkgname#python-}
pkgver=5.4.2
pkgrel=4
pkgdesc="A messaging library for Python"
arch=(any)
url="https://github.com/celery/kombu"
license=(BSD-3-Clause)
depends=(
  python
  python-amqp
  python-vine
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-boto3
  python-brotli
  python-hypothesis
  python-msgpack
  python-pycurl
  python-pymongo
  python-pyro
  python-pytest
  python-pytest-freezer
  python-pytest-sugar
  python-pytz
  python-redis
  python-sqlalchemy
  python-yaml
)
optdepends=(
  # 'python-consul: for Consul K/V store Transport support' # Not packaged yet
  # 'python-etcd: for etcd support' # Not packaged yet
  # 'python-librabbitmq: C optimization for AMQP transport' # Deprecated, moved to AUR
  # 'python-pycouchdb: for CouchDB support' # Not packaged yet
  # 'python-softlayer-messaging: for SoftLayer Message Queue support' # Not packaged yet
  'python-boto3: for Amazon SQS support'
  'python-brotli: for brotli compression support'
  'python-kazoo: for Zookeeper support'
  'python-msgpack: for MessagePack support'
  'python-pycurl: for Amazon SQS support'
  'python-pymongo: for MongoDB support'
  'python-pyro: for Pyro support'
  'python-redis: for Redis support'
  'python-sqlalchemy: for SQLAlchemy support'
  'python-yaml: for YAML support'
  'python-zstandard: for zstd compression support'
)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e601548a1d0af85f439a9cbe2471ea461232f23967f219e2db6d4cd2186e67a7')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  pytest -v \
    --ignore t/unit/transport/test_azureservicebus.py \
    --ignore t/unit/transport/test_azurestoragequeues.py \
    --deselect t/unit/transport/test_redis.py::test_Channel::test_global_keyprefix_transaction
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
