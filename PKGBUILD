# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>

pkgbase=python-zc.lockfile
_pkgname=${pkgbase#python-}
pkgname=(python-$_pkgname python2-$_pkgname)
pkgver=1.3.0
pkgrel=1
arch=('any')
pkgdesc="Zope testing frameworks"
url="https://github.com/zopefoundation/$_pkgname"
license=('custom:ZPL')
makedepends=('python-setuptools' 'python2-setuptools' 'python-zope.testing' 'python2-zope.testing')
source=("$pkgbase-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('33385e2b9400e507c4270cd754cbbf61a4733ac11b93a7c985f75cd9148df596afeaa16c9307712e1b9b525e8523ed6aa8ad0d3575f52266848b16933d5a60be')

prepare() {
  cp -a $_pkgname-$pkgver{,-py2}
}

build() {
  msg2 "Building python-$_pkgname $pkgver"
  cd "$srcdir"/$_pkgname-$pkgver
  python setup.py build

  msg2 "Building python2-$_pkgname $pkgver"
  cd "$srcdir"/$_pkgname-$pkgver-py2
  python2 setup.py build
}

check() {
  msg2 "Running tests on python-$_pkgname $pkgver"
  cd "$srcdir"/$_pkgname-$pkgver
  python setup.py test -q

  msg2 "Running tests on python2-$_pkgname $pkgver"
  cd "$srcdir"/$_pkgname-$pkgver-py2
  python2 setup.py test -q
}

package_python-zc.lockfile() {
  depends=('python')
  cd $_pkgname-$pkgver

  python setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-zc.lockfile() {
  depends=('python2')
  cd $_pkgname-$pkgver-py2

  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
