# Maintainer: jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Felix Kaiser <felix.kaiser@fxkr.net>

pkgbase=python-mock
pkgname=(python2-mock python-mock)
pkgver=3.0.5
pkgrel=6
pkgdesc='Mocking and Patching Library for Testing'
url='http://www.voidspace.org.uk/python/mock/'
makedepends=('python2' 'python' 'python-pbr' 'python2-pbr')
checkdepends=('python2-funcsigs')
license=('BSD')
arch=('any')
source=(mock-$pkgver.tar.gz::https://github.com/testing-cabal/mock/archive/$pkgver.tar.gz)
sha512sums=('9ab4f0c794f5701ba1367d982cf79a5662d4233753d12ed9c88ae20282db1f44be73f84c4d9f6d03ff64926b8c1b6d0c9a79b2a4724a3eb36c247ffd4ab03e2d')

prepare() {
  cd "$srcdir/mock-$pkgver"
  # use unittest instead of unittest2 as they are the same on recent python*
  sed -i 's/unittest2/unittest/g' mock/tests/*.py

  cd "$srcdir"
  cp -rf "mock-$pkgver" "mock2-$pkgver"
}

build() {
  export PYTHONHASHSEED=0
  cd "$srcdir/mock-$pkgver"
  python3 setup.py build

  cd "$srcdir/mock2-$pkgver"
  python2 setup.py build
}

check() {
  cd "$srcdir/mock-$pkgver"
  echo 'python tests'
  python -m unittest discover

  cd "$srcdir/mock2-$pkgver"
  echo 'python2 tests'
  # Remove Python 3 only test
  rm mock/tests/testhelpers_py3.py
  python2 -m unittest discover
}

package_python-mock() {
depends=('python' 'python-six' 'python-pbr')
  cd "$srcdir/mock-$pkgver"
  python3 setup.py install --optimize=1 --root="$pkgdir"
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_python2-mock() {
depends=('python2' 'python2-six' 'python2-pbr' 'python2-funcsigs') # Backported Py > 3.3 functionality
  cd "$srcdir/mock2-$pkgver"
  python2 setup.py install --optimize=1 --root="$pkgdir"
  install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
