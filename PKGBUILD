# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ralf Schmitt <ralf@systemexit.de>

pkgname=python38-gevent
pkgver=22.10.2
pkgrel=1
arch=('x86_64')
pkgdesc="Python network library that uses greenlet and libev for easy and scalable concurrency"
license=("MIT")
url="http://www.gevent.org/"
depends=('c-ares' 'libev' 'python38-greenlet' 'python38-setuptools' 'python38-zope-event' 'python38-zope-interface')
makedepends=('cython')
checkdepends=('lsof' 'python38-perf' 'python38-objgraph' 'python38-dnspython' 'python38-requests')
source=("$pkgname-$pkgver.tar.gz::https://github.com/gevent/gevent/archive/$pkgver.tar.gz")
sha512sums=('9ceb8e03016cd2fe8fa58f9fb65daa1b52b80a25067bb0fa8fc4b744695b85b0ba003e933783dd4546f4600f2859c08d5627e322ccfbc5a6fa3a8e4d67f59a5f')

export GEVENTSETUP_EMBED=0

build() {
  cd gevent-$pkgver
  python3.8 setup.py build
}

check() {
  (
    cd gevent-$pkgver
    python3.8 -m venv "$srcdir/pyvenv" --system-site-packages
    . "$srcdir/pyvenv/bin/activate"
    export PYTHONPATH="$PYTHONPATH:/usr/lib/python3.8/site-packages"
    python3.8 setup.py install
    python3.8 -m gevent.tests
  ) || echo "Tests failed"
}

package() {
  cd gevent-$pkgver
  python3.8 setup.py install -O1 --root="$pkgdir"
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
