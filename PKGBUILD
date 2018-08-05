# Maintainer: jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Felix Kaiser <felix.kaiser@fxkr.net>

pkgbase=python-mock
pkgname=(python2-mock python-mock)
pkgver=2.0.0
pkgrel=4
pkgdesc='Mocking and Patching Library for Testing'
url='http://www.voidspace.org.uk/python/mock/'
makedepends=('python2' 'python' 'python-pbr' 'python2-pbr')
checkdepends=('python2-funcsigs')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/m/mock/mock-$pkgver.tar.gz"
        "0001-be-able-to-run-tests-on-python2.patch")
sha512sums=('a08007651b749d2843b94f5045d74c122958888290aea21930455538a854e6b04c07115e21d82edde996154bf597d7a8784a2f4213cbabc49a98dec22dd92238'
            '8da4aa25e7f35482369c6e69b4c430b0a506203b5629771cf63932f98d9c4167ed0a08c541baf4993749c24b28cacf0bb26328d34445e7e39448edb89e329f12')

prepare() {
  cd "$srcdir/mock-$pkgver"
  # self.assertRaisesRegex() is self.assertRaisesRegexp() in Python 2.7
  patch -p1 -i ../0001-be-able-to-run-tests-on-python2.patch
  # use unittest instead of unittest2 as they are the same on recent python*
  sed -i 's/unittest2/unittest/g' mock/tests/*.py

  cd "$srcdir"
  cp -rf "mock-$pkgver" "mock2-$pkgver"
}

build() {
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
