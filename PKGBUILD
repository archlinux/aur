# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
pkgname=python2-pathlib2
_name=${pkgname#python2-}
pkgver=2.3.7.post1
pkgrel=2
pkgdesc='Backports of the pathlib module'
arch=('any')
_pypi='https://pypi.python.org'
url="$_pypi/pypi/$_name"
license=('MIT')
depends=('python2-six' 'python2-scandir')
makedepends=('python2-setuptools')
source=("$_pypi/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('9fe0edad898b83c0c3e199c842b27ed216645d2e177757b2dd67384d4113c641')

prepare() {
  cd "$srcdir/$_name-$pkgver"

  # Remove all but comments that depend on typing
  sed -i 'N;N;s-^.*TypeVar.*--' pathlib2/__init__.py
  sed -ri 's-(,|\s)*.typing.--' setup.py
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE.rst "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
