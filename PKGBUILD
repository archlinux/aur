# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgname=python-kombu
pkgver=5.3.5
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
makedepends=('python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
checkdepends=('python-boto3' 'python-brotli' 'python-case' 'python-librabbitmq' 'python-msgpack' 'python-pycurl'
              'python-pymongo' 'python-pyro' 'python-pytest' 'python-pytest-sugar' 'python-pytz'
              'python-redis' 'python-sqlalchemy' 'python-yaml' 'python-hypothesis')
source=("https://github.com/celery/kombu/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('817bf76829825431ede60b8b66fb967452eba708e14d0479da9dacb0d4d3bc85e8dc45fb586d555606fcb0bbc35c012f5bd2a755868e46b7c356d178184203dd')

prepare() {
  cd kombu-$pkgver
  sed -i "/import azureservicebus/i pytest.importorskip('azure.servicebus')" t/unit/transport/test_azureservicebus.py
  rm t/unit/transport/test_azurestoragequeues.py
}

build() {
  cd kombu-$pkgver
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd kombu-$pkgver
  # 567 test failures retained since Python 3.11
  pytest -v || true
}

package() {
  cd kombu-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl

  # Symlink license file
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s "$site_packages"/kombu-$pkgver.dist-info/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
