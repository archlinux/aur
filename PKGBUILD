# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgname=python-kombu
pkgver=5.6.0
pkgrel=1
pkgdesc="A messaging library for Python"
arch=(any)
url="https://github.com/celery/kombu"
license=(BSD-3-Clause)
depends=(
    'python'
    'python-amqp'
    'python-vine'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    'python-boto3'
    'python-brotli'
    'python-hypothesis'
    'python-msgpack'
    'python-pycurl'
    'python-pymongo'
    'python-pyro'
    'python-pytest'
    'python-pytest-freezer'
    'python-pytest-sugar'
    'python-pytz'
    'python-redis'
    'python-sqlalchemy'
    'python-yaml'
)
optdepends=(
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
sha256sums=('059d1b076d247b764fe587f4296bc711478380d3734fc32da9832a8fc2d58cea')

build() {
    cd ${pkgname#python-}-$pkgver || exit
    python -m build --wheel --no-isolation
}

check() {
    cd ${pkgname#python-}-$pkgver || exit
    pytest -v \
      --ignore t/unit/transport/test_azureservicebus.py \
      --ignore t/unit/transport/test_azurestoragequeues.py \
      --ignore t/unit/transport/test_gcpubsub.py \
      --deselect t/unit/transport/test_redis.py::test_Channel::test_global_keyprefix_transaction
}

package() {
    cd ${pkgname#python-}-$pkgver || exit
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
