# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-dogpile.cache
pkgver=1.1.8
pkgrel=2
pkgdesc="A caching front-end based on the Dogpile lock"
arch=('any')
url="https://pypi.python.org/pypi/dogpile.cache"
license=('BSD')
depends=('python38-decorator' 'python38-stevedore')
makedepends=('python38-setuptools')
checkdepends=('memcached' 'pifpaf' 'redis' 'python38-mako' 'python38-redis' 'python38-pytest'
              'python38-pytest-cov' 'python38-pylibmc')
source=("https://pypi.io/packages/source/d/dogpile.cache/dogpile.cache-$pkgver.tar.gz")
sha512sums=('2bacc111e17ecc706b3389f5c40ded888cc893f6d01c34a4e1e0d8d94c4592369b0c283aa80eb6ebec90dde7a89fd3b7fb9bbcbdd8010f90ad7de4501db13ace')

build() {
  cd dogpile.cache-$pkgver
  python3.8 setup.py build
}

check() {
  cd dogpile.cache-$pkgver
  python3.8 -m pytest -k 'not test_memcached_backend and not test_redis_backend'
  pifpaf --env-prefix DOGPILE run memcached --port 11234 -- python3.8 -m pytest tests/cache/test_memcached_backend.py
  pifpaf --env-prefix DOGPILE run redis --port 11234 -- python3.8 -m pytest tests/cache/test_redis_backend.py
}

package() {
  cd dogpile.cache-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
