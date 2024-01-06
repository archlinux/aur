# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgname=python-kombu
pkgver=5.3.2
pkgrel=1
pkgdesc='A messaging library for Python'
arch=('any')
url="https://kombu.readthedocs.org/"
license=('BSD')
options=('!emptydirs')
depends=('python-amqp' 'python-vine')
optdepends=('python-boto3: for Amazon SQS support'
            'python-brotli: for brotli compression support'
            'python-librabbitmq: C optimization for AMQP transport'
            'python-msgpack: for MessagePack support'
            'python-pycurl: for Amazon SQS support'
            'python-pymongo: for MongoDB support'
            'python-pyro: for Pyro support'
            'python-redis: for Redis support'
            'python-sqlalchemy: for SQLAlchemy support'
            'python-yaml: for YAML support'
            'python-zstandard: for zstd compression support')
            # 'python-consul: for Consul K/V store Transport support': Not packaged yet
            # 'python-etcd: for etcd support': Not packaged yet
            # 'python-kazoo: for Zookeeper support': Not packaged yet
            # 'python-pycouchdb: for CouchDB support': Not packaged yet
            # 'python-softlayer-messaging: for SoftLayer Message Queue support': Not packaged yet
makedepends=('python-setuptools')
checkdepends=('python-boto3' 'python-brotli' 'python-case' 'python-librabbitmq' 'python-msgpack' 'python-pycurl'
              'python-pymongo' 'python-pyro' 'python-pytest' 'python-pytest-sugar' 'python-pytz'
              'python-redis' 'python-sqlalchemy' 'python-yaml' 'python-hypothesis')
source=("https://github.com/celery/kombu/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('c7a760c1340a775ca204c04e5aa11b27c713c9d75b2160f9f7ef9f165f8df076f50cc01e70a471f94269c1613aec26547f07f60f4cdd2190395211c77c594632')

prepare() {
  cd kombu-$pkgver
  sed -i "/import azureservicebus/i pytest.importorskip('azure.servicebus')" t/unit/transport/test_azureservicebus.py
  rm t/unit/transport/test_azurestoragequeues.py
}

build() {
  cd kombu-$pkgver
  python setup.py build
}

check() {
  cd kombu-$pkgver
  pytest -v
}

package() {
  cd kombu-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
