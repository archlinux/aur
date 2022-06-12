# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: xiretza <xiretza+aur@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Massimiliano Torromeo < massimiliano DOT torromeo AT gmail DOT com >

pkgname='python2-beaker'
_name="${pkgname#python2-}"
pkgver=1.11.0
pkgrel=5
pkgdesc='A Session and Caching library with WSGI Middleware'
arch=('any')
url='https://pypi.org/project/Beaker/'
license=('BSD')
depends=('python2-funcsigs')
makedepends=('python2-setuptools')
_tarname="${_name}-${pkgver}"
source=("${_tarname}.tar.gz::https://github.com/bbangert/beaker/archive/$pkgver.tar.gz")
b2sums=('ec8d06c13c7cf65199d2b65ef286440608726603a18ea1820e26efdf7f9c96050196aa35b1e320ff8b6bf66ccc1f982338744312743e1ae7c3a1a3c66600ff64')

prepare() {
  # Use a fake MongoDB for tests
  sed -e '/class TestMongoDB/i import mongomock' \
      -e "s|'mongodb://localhost:27017/beaker_testdb'|mongomock.MongoClient('mongodb://localhost:27017/beaker_testdb')|" \
      -i "${_tarname}/tests/test_managers/test_ext_mongodb.py"

  sed -i 's#/usr/bin/python#/usr/bin/python2#' "${_tarname}/beaker/crypto/pbkdf2.py"
}

build() {
  cd "${_tarname}"
  python2 setup.py build
}

package() {
  cd "${_tarname}"
  python2 setup.py install --root="${pkgdir}" --optimize=1
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
