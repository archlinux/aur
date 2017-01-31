# $Id$
# Maintainer: Daniel Milde <daniel@milde.cz>

pkgname=pypy-pyparsing
pkgname=('pypy-pyparsing' 'pypy3-pyparsing')
pkgver=2.1.10
pkgrel=2
pkgdesc='General parsing module for Python'
arch=('any')
url='http://pyparsing.wikispaces.com/'
makedepends=('pypy-setuptools' 'pypy3-setuptools' 'subversion')
license=('MIT')
source=("svn://svn.code.sf.net/p/pyparsing/code/tags/pyparsing_$pkgver")
sha256sums=('SKIP')

prepare() {
  cp -a pyparsing_$pkgver{,-py2}

  # :/
  sed -i '1i#coding=utf-8' pyparsing_$pkgver-py2/src/unitTests.py
}

build() {
  cd "$srcdir"/pyparsing_$pkgver/src
  pypy3 setup.py build

  cd "$srcdir"/pyparsing_$pkgver-py2/src
  pypy setup.py build
}

check() {
  export LC_CTYPE=en_US.UTF-8

  cd "$srcdir"/pyparsing_$pkgver/src
  pypy3 unitTests.py

  cd "$srcdir"/pyparsing_$pkgver-py2/src
  pypy unitTests.py
}

package_pypy3-pyparsing() {
  depends=('pypy3')

  cd pyparsing_$pkgver/src

  pypy3 setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_pypy-pyparsing() {
  depends=('pypy')

  cd pyparsing_$pkgver-py2/src

  pypy setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
