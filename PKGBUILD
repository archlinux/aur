# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: mutantmonkey <aur@mutantmonkey.in>

pkgbase=python-kombu
pkgname=('python-kombu' 'python2-kombu')
pkgver=4.1.0
pkgrel=2
pkgdesc='A messaging library for Python'
arch=('any')
url="http://kombu.readthedocs.org/"
license=('BSD')
options=('!emptydirs')
makedepends=('python-amqp' 'python2-amqp' 'python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest-runner' 'python2-pytest-runner' 'python-redis' 'python2-redis'
              'python-yaml' 'python2-yaml' 'python-msgpack' 'python2-msgpack'
              'python-pycurl' 'python2-pycurl' 'python-case' 'python2-case' 'python-pymongo'
              'python2-pymongo' 'python-pytz' 'python2-pytz'
              'python-sqlalchemy' 'python2-sqlalchemy' 'python-pyro' 'python2-pyro'
              'python2-librabbitmq' 'python-boto3')
              # 'python2-boto3': Not packaged yet
source=("$pkgbase-$pkgver.tar.gz::https://github.com/celery/kombu/archive/v$pkgver.tar.gz"
        "msgpack-fix.patch::https://github.com/celery/kombu/commit/9883a300f619e1a78376cce8ab311a7e573337c2.patch")
sha512sums=('de754a0a6410ab17f2f9a81afc374fe95d1baac8965b6b5f2e0760726982b8c927b8f15cab9dcc42f03c36ddffbe76452c3c962a0645d154af8a7b3e906bfccb'
            '22c3bce03f077fe0e4cf9d62623d404f7bfef310fe6641ef6c3681239272de81de22578148eaf8f04a462417b81f57fd13cf858deefa8d682643f97240073ed7')

prepare() {
  # https://github.com/celery/kombu/pull/822
  patch -d kombu-$pkgver -p1 < msgpack-fix.patch
  cp -a kombu-$pkgver{,-py2}
}

build() {
  cd "$srcdir"/kombu-$pkgver
  python setup.py build

  cd "$srcdir"/kombu-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/kombu-$pkgver
  python setup.py pytest

  cd "$srcdir"/kombu-$pkgver-py2
  python2 setup.py pytest
}

package_python-kombu() {
  depends=('python-amqp')
  optdepends=('python-pymongo: for MongoDB support'
              'python-msgpack: for MessagePack support'
              'python-pyro: for Pyro support'
              'python-redis: for Redis support'
              'python-sqlalchemy: for SQLAlchemy support'
              'python-boto3: for Amazon SQS support'
              'python-pycurl: for Amazon SQS support'
              'python-yaml: for YAML support')
              # 'python-softlayer-messaging: for SoftLayer Message Queue support': Not packaged yet
              # 'python-kazoo: for Zookeeper support': Not packaged yet
              # 'python-librabbitmq: C optimization for AMQP transport' Not available for python 3 yet

  cd "$srcdir"/kombu-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-kombu() {
  depends=('python2-amqp')
  optdepends=('python2-pymongo: for MongoDB support'
              'python2-msgpack: for MessagePack support'
              'python2-pyro: for Pyro support'
              'python2-redis: for Redis support'
              'python2-sqlalchemy: for SQLAlchemy support'
              'python2-pycurl: for Amazon SQS support'
              'python2-yaml: for YAML support'
              'python2-librabbitmq: C optimization for AMQP transport')
              # 'python2-softlayer-messaging: for SoftLayer Message Queue support': Not packaged yet
              # 'python2-kazoo: for Zookeeper support': Not packaged yet
              # 'python2-boto3: for Amazon SQS support': Not packaged yet

  cd "$srcdir"/kombu-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
