# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgname=python-kombu
pkgver=5.5.2
pkgrel=1
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
sha256sums=('4b118945eef8e802ec1c58c53d9978deec5ce75e5ed2e8dadba7a7b89233bb6e')

build() {
  cd ${pkgname#python-}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  cd ${pkgname#python-}-$pkgver
  pytest -v \
    --ignore t/unit/transport/test_azureservicebus.py \
    --ignore t/unit/transport/test_azurestoragequeues.py \
    --ignore t/unit/transport/test_gcpubsub.py \
    --deselect t/unit/transport/test_redis.py::test_Channel::test_global_keyprefix_transaction
}

package() {
  cd ${pkgname#python-}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
