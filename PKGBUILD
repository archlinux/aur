# $Id$
# Maintainer: Connor Prussin <connor at prussin dot net>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=python2-requests-2.13.0
pkgver=2.13.0
pkgrel=1
pkgdesc="Python HTTP for Humans"
arch=('any')
url="https://github.com/cprussin/python2-requests-2.13.0"
license=('Apache')
makedepends=('python-setuptools' 'python2-setuptools' 'python-chardet' 'python2-chardet'
             'python-urllib3' 'python2-urllib3' 'python-idna' 'python2-idna')
checkdepends=('python-pytest-httpbin' 'python2-pytest-httpbin' 'python-pytest-mock'
              'python2-pytest-mock' 'python-pysocks' 'python2-pysocks')
provides=('python2-requests')
conflicts=('python2-requests')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kennethreitz/requests/archive/v$pkgver.tar.gz"
        certs.patch)
sha512sums=('d39d0a50b05940175f0a6b7383d98c6882e28ccb23f84f25b3adc7527fa162f767dde02a67a11e82dc90e8482bd0d60c0efd8f27a73231e39d9b01b9e1d191b1'
            '2918908b0595e409bc6c568c797c32a1f479bdd32eddcbe428e21b10f38291574f22ea7fcac17abb69622ea14cb1b22106fd7441e5ca33fe808bc25975c91b56')

prepare() {
  cd "$srcdir"/requests-$pkgver
  sed -e '/certifi/d' \
      -i setup.py
  patch -p1 -i "$srcdir"/certs.patch

  cd "$srcdir"
  cp -a requests-$pkgver{,-py2}
  find requests-$pkgver-py2 -name \*.py -exec sed -r 's|^#!(.*)python$|#!\1python2|' -i {} +
}

build() {
  cd "$srcdir"/requests-$pkgver
  python setup.py build

  cd "$srcdir"/requests-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/requests-$pkgver
  py.test tests

  cd "$srcdir"/requests-$pkgver-py2
  py.test2 tests
}

package() {
  depends=('python2-urllib3' 'python2-chardet' 'python2-idna')
  optdepends=('python2-ndg-httpsclient: HTTPS requests with SNI support'
              'python2-grequests: asynchronous requests with gevent'
              'python2-pysocks: SOCKS proxy support')

  cd "$srcdir"/requests-$pkgver-py2
  python2 setup.py install --skip-build -O1 --root="$pkgdir"
}
