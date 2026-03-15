# Maintainer: Matteo Piccinini (loacker) <matteo.piccinini@gmail.com>
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgname=python-kombu
pkgver=5.6.2
pkgrel=2
pkgdesc="A messaging library for Python"
arch=(any)
url="https://github.com/celery/kombu"
license=(BSD-3-Clause)
depends=(
    'python'
    'python-amqp'
    'python-vine'
    'python-packaging'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
    'git'
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
source=("$pkgname::git+$url.git#tag=v$pkgver")
b2sums=('96c9dcaf87cfe4654293b7a369136dd870a4bc67902401fd39a2f57e949ff6231c2cd32674b33bd745b7540a0b99626e06cfdf0677c4b23c5a960b0349ba43b2')

build() {
    cd $pkgname
    python -m build --wheel --no-isolation
}

check() {
    cd $pkgname
    pytest -v \
      --ignore t/unit/transport/test_azureservicebus.py \
      --ignore t/unit/transport/test_azurestoragequeues.py \
      --ignore t/unit/transport/test_gcpubsub.py \
      --deselect t/unit/transport/test_redis.py::test_Channel::test_global_keyprefix_transaction
}

package() {
    cd $pkgname
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
