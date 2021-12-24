# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgname=python-kombu
pkgver=5.2.2
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
              'python-redis' 'python-sqlalchemy' 'python-yaml')
source=("https://github.com/celery/kombu/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('9a1e1c52c1781c2218aeaa5b98005b99bc049cf0e0ea951b196def731bb98f410e2c3a59a4e791e23ec95aaeac65ccf0737f471632c1f042d990fb9a3db84df6')

prepare() {
  cd kombu-$pkgver
  sed -i "/import azureservicebus/i pytest.importorskip('azure.servicebus')" t/unit/transport/test_azureservicebus.py
}

build() {
  cd kombu-$pkgver
  python setup.py build
}

check() {
  cd kombu-$pkgver
  python -m pytest
}

package() {
  cd kombu-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
