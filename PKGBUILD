# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
pkgname=python2-configparser
_name=${pkgname#python2-}
pkgver=4.0.2
pkgrel=4
pkgdesc='Backports of the configparser module'
arch=('any')
_pypi='https://pypi.python.org'
url="$_pypi/pypi/$_name"
depends=('python2-backports')
makedepends=('python2-setuptools')
license=('MIT')
source=("$_pypi/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('c7d282687a5308319bf3d2e7706e575c635b0a470342641c93bea0ea3b5331df')

prepare() {
  cd "$srcdir/$_name-$pkgver"
  find -name "*.py*" -exec sed -i '1s/python\s*$/python2/' '{}' \;

  # Remove setuptools_scm dependency
  sed -i /scm/d setup.cfg setup.py
}

build() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py build
}

package() {
  cd "$srcdir/$_name-$pkgver"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build
  find "$pkgdir" -path '*/backports/__init__.py*' -delete
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}
