# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=python2-linecache2
_name="${pkgname#python2-}"
pkgver=1.0.0
pkgrel=5
pkgdesc='Backports of the linecache module'
arch=('any')
_pypi='https://pypi.python.org'
url="$_pypi/pypi/$_name"
license=('Python')
depends=('python2')
makedepends=('python2-setuptools' 'python2-pbr')
# License is missing, but it's the same of traceback2
# https://github.com/testing-cabal/linecache2/issues/10
_githubraw='https://raw.githubusercontent.com/testing-cabal/traceback2'
_commit_license='36d6f8b755367defcf73c9ef308de952502dccb1'
source=("$_pypi/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz"
        "$_name-$pkgver-LICENSE.txt::$_githubraw/$_commit_license/LICENSE")
sha256sums=('4b26ff4e7110db76eeb6f5a7b64a82623839d595c2038eeda662f2a2db78e97c'
            '8e6bd29d1ca0d1744ae87eb2b19f680569f0a1b2b1c8a2f4583ff7196d5b7cc5')

prepare() {
  cd "$srcdir/$_name-$pkgver"

  # Erase the tests that are actually syntax errors in Python 2.x
  sed -ri '101,111s-.*--' linecache2/tests/inspect_fodder2.py
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 "../$_name-$pkgver-LICENSE.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
