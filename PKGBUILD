# Maintainer: jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Felix Kaiser <felix.kaiser@fxkr.net>

pkgbase=python-mock
pkgname=(python2-mock python-mock)
pkgver=2.0.0
pkgrel=3
pkgdesc='Mocking and Patching Library for Testing'
url='http://www.voidspace.org.uk/python/mock/'
makedepends=('python2' 'python' 'python-setuptools' 'python2-setuptools')
checkdepends=('python-nose' 'python2-nose' 'python-pbr' 'python2-pbr' 'python-six' 'python2-six' 'git')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/m/mock/mock-$pkgver.tar.gz")
sha512sums=('a08007651b749d2843b94f5045d74c122958888290aea21930455538a854e6b04c07115e21d82edde996154bf597d7a8784a2f4213cbabc49a98dec22dd92238')

build() {
  cd "$srcdir"
  cp -rf "mock-$pkgver" "mock2-$pkgver"

  cd "$srcdir/mock-$pkgver"
  python3 setup.py build

  cd "$srcdir/mock2-$pkgver"
  python2 setup.py build
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

check() {
  cd "$srcdir/mock2-$pkgver/"
  sed -i 's/unittest2/unittest/g'  mock/tests/*.py

  echo 'python tests'
  python -m unittest discover
  
  # Does not run because of self.assertRaisesRegex() usage in unitests, which is self.assertRaisesRegexp() in Python 2.7
  echo 'python2 tests'
  #python2 -m unittest discover
}
