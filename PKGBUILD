# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgname=python-kombu
pkgver=5.2.4
pkgrel=2
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
source=("https://github.com/celery/kombu/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
	"fix-requirements.patch")
sha512sums=('8a7bcf3e7f94f7653d6c74a2ea15034c731a27a414d00dde008c31ffa8d292a15e8cc27a44c1f23541f24c863297f0cd11104d2bffaaa512c87526c704be5bcf'
            '7beefe78a25f305b8c0d6e9812291c78ed6cfc0c4d167092bbcd86423e020263b2f1af74d959a6e571791198851fe559175de8ca8fd6e4eaaf29ca54b61312bc')

prepare() {
  cd kombu-$pkgver
  sed -i "/import azureservicebus/i pytest.importorskip('azure.servicebus')" t/unit/transport/test_azureservicebus.py

  patch -Np1 -i ${srcdir}/fix-requirements.patch
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
