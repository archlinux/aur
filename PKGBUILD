# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: twa022 <twa022 at gmail dot com>

_pkgbase=PyFxA
pkgbase=python-fxa
pkgname=('python2-fxa' 'python-fxa')
pkgver=0.5.0
pkgrel=1
pkgdesc="Python library for interacting with the Firefox Accounts ecosystem"
arch=('any')
url="https://github.com/mozilla/PyFxA"
license=('MPL2')
depends=('python-browserid' 'python2-browserid' 'python-cryptography' 'python2-cryptography' 'python-hawkauthlib' 'python2-hawkauthlib')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/mozilla/$_pkgbase/archive/v$pkgver.tar.gz")
sha256sums=('cb8f29bb10750d25147d8577824b8e500636a72ed268930d2e06d8148eab5d86')

prepare() {
  cp -a $_pkgbase-$pkgver{,-py2}
  cd $_pkgbase-$pkgver-py2
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' fxa/__main__.py
}

build() {
  # Building Python2
  cd $_pkgbase-$pkgver-py2
  python2 setup.py build

  # Building Python3
  cd ../$_pkgbase-$pkgver
  python3 setup.py build
}

package_python2-fxa() {
  depends=('python2-browserid' 'python2-cryptography' 'python2-hawkauthlib')

  cd $_pkgbase-$pkgver-py2
  python2 setup.py install --root="$pkgdir" --optimize=1
  mv "$pkgdir"/usr/bin/fxa-client{,2}
}

package_python-fxa() {
  depends=('python-browserid' 'python-cryptography' 'python-hawkauthlib')

  cd $_pkgbase-$pkgver 
  python3 setup.py install --root="$pkgdir" --optimize=1
}
