# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgbase=python-binary-memcached
pkgname=('python-binary-memcached' 'python2-binary-memcached')
pkgver=0.28.0
pkgrel=1
arch=('any')
pkgdesc='A pure python module to access memcached via its binary protocol with SASL auth support'
url='https://github.com/jaysonsantos/python-binary-memcached'
license=('MIT')
makedepends=('python-setuptools' 'python2-setuptools' 'python-uhashring' 'python2-uhashring'
             'python2-typing')
checkdepends=('memcached' 'python-pytest-runner' 'python2-pytest-runner' 'python2-mock')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/jaysonsantos/python-binary-memcached/archive/v$pkgver.tar.gz")
sha512sums=('8edd603c8ee67826ab7f2d064d2cad67c2a4b695e09d763cbefc988a0576f6d06730358983f77a903e64b7aec3ac511dbb3e58cfcb51030b604a2524e482d6fa')

prepare() {
  cp -a python-binary-memcached-$pkgver{,-py2}
  sed -i '/typing/d' python-binary-memcached-$pkgver/setup.py
}

build() {
  cd "$srcdir"/python-binary-memcached-$pkgver
  python setup.py build

  cd "$srcdir"/python-binary-memcached-$pkgver-py2
  python2 setup.py build
}

check() {
  cd "$srcdir"/python-binary-memcached-$pkgver
  python setup.py pytest

  cd "$srcdir"/python-binary-memcached-$pkgver-py2
  python2 setup.py pytest
}

package_python-binary-memcached() {
  depends=('python-six' 'python-uhashring')

  cd python-binary-memcached-$pkgver
  python setup.py install --root "$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

package_python2-binary-memcached() {
  depends=('python2-six' 'python2-uhashring' 'python2-typing')

  cd python-binary-memcached-$pkgver-py2
  python2 setup.py install --root "$pkgdir" --optimize=1
  install -D -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
