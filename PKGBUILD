# Maintainer: Razer <razer@neuf.fr>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Marcin Kolenda <marcinkolenda419@gmail.com>
# Contributor: Valentin Haloiu <vially.ichb+aur@gmail.com>
# Contributor: Lukas Linhart <bugs@almad.net>
# Contributor: Marco Elver <marco.elver AT gmail.com>
# Contributor: apkawa <apkawa@gmail.com>

pkgname=('python-celery-git')
pkgver=4.2.99
pkgrel=0
pkgdesc='Distributed Asynchronous Task Queue'
arch=('any')
url='http://celeryproject.org/'
license=('BSD')
makedepends=('python-setuptools' 'python-kombu' 'python-billiard' 'python-pytz')
checkdepends=('python-pytest-runner' 'python-case' 'python-pyopenssl' 'python-gevent' 
              'python-pymongo' 'python-msgpack' 'python-pyro' 'python-redis' 'python-sqlalchemy'
              'python-boto' 'python-yaml' 'python-pyzmq' 'python-eventlet')
optdepends=('python-pyopenssl: for celery.security'
          'python-pymongo: for celery.backends.mongodb'
          'python-msgpack: for using the msgpack serializer'
          'python-pyro: for using Pyro4 message transport'
          'python-redis: for celery.backends.redis'
          'python-sqlalchemy: for celery.backends.database'
          'python-boto: for SQS transport'
          'python-yaml: for using the yaml serializer'
          'python-pyzmq: for using ZeroMQ transport')              
conflicts=('python-celery')
provides=('python-celery')
source=("git://github.com/celery/celery/"
        celery@.service celery.tmpfiles.d)
options=('!emptydirs')
md5sums=('SKIP'
         '2a2d21ae21806040fee9ecd32faf31b0'
         '08a0060988074eacb6404aff4800b9d5')

build() {
  cd "$srcdir"/celery
  python setup.py build
}

check() {
  cd "$srcdir"/celery
  # Tests stuck with Python 3.6
  # https://bugs.python.org/issue27650
  # python setup.py ptr
}

package() {
  cd "$srcdir"/celery
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 "$srcdir"/celery@.service "$pkgdir"/usr/lib/systemd/system/celery@.service
  install -Dm644 "$srcdir"/celery.tmpfiles.d "$pkgdir"/usr/lib/tmpfiles.d/celery.conf
}
