# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-pylint
pkgver=0.15.1
pkgrel=1
pkgdesc='pytest plugin to check source code with pylint'
arch=('any')
license=('MIT')
url='https://github.com/carsongee/pytest-pylint'
depends=('python-pytest' 'python-pylint' 'python-six')
makedepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/carsongee/pytest-pylint/archive/$pkgver.tar.gz")
sha512sums=('b5a59866147639159736a644f44676abec72127844631bf0b52b7a97d0b94b782fb1540a012bfdcefa8ef3ac92acc671fdbd4632dedf23ab541f6a6abbc0187b')

prepare() {
  cd pytest-pylint-$pkgver
  # Abandonware
  sed -i 's/--pep8//' tox.ini
  sed -i 's/import mock/from unittest import mock/' pytest_pylint/tests/test_pytest_pylint.py
}

build() {
  cd pytest-pylint-$pkgver
  python setup.py build
}

check() {
  # Hack entry points by installing it

  cd pytest-pylint-$pkgver
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages:$PYTHONPATH" py.test --ignore tmp_install
}

package() {
  cd pytest-pylint-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
