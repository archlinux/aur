# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Massimiliano Torromeo < massimiliano DOT torromeo AT gmail DOT com >

pkgname=python38-beaker
pkgver=1.11.0
pkgrel=8
arch=('any')
license=('custom')
pkgdesc="Caching and sessions WSGI middleware for use with web applications and stand-alone Python scripts and applications"
url="http://beaker.groovie.org/"
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-nose' 'python38-mock' 'python38-sqlalchemy'
              'python38-pycryptodome' 'python38-coverage' 'python38-webtest' 'python38-redis'
              'python38-pymongo' 'python38-pylibmc' 'redis' 'python38-cryptography'
              'python38-memcached' 'memcached' 'pifpaf' 'python38-mongomock')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bbangert/beaker/archive/$pkgver.tar.gz")
sha512sums=('0eab9ff40314786e0fb2d31a6b932f355680c193ac5c41de442ee5a3f4d5cf62ae1c30f2948f8e2c89c012bad5e4332a5a72be62c9b1cba0b9f2723afe7e9ae3')

prepare() {
  # Use a fake MongoDB for tests
  sed -e '/class TestMongoDB/i import mongomock' \
      -e "s|'mongodb://localhost:27017/beaker_testdb'|mongomock.MongoClient('mongodb://localhost:27017/beaker_testdb')|" \
      -i beaker-$pkgver/tests/test_managers/test_ext_mongodb.py

  sed -i "s#/usr/bin/python#/usr/bin/python38#" beaker-$pkgver/beaker/crypto/pbkdf2.py
}

build() {
  cd "$srcdir"/beaker-$pkgver
  python38 setup.py build
}

check() {
  # it_IT.UTF-8 is missing in test env

  cd "$srcdir"/beaker-$pkgver
  pifpaf run memcached --port 11211 -- pifpaf run redis python3.8 setup.py nosetests || warning "Tests failed"
}

package() {
  cd beaker-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/python38-beaker/LICENSE
}
