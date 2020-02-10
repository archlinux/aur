# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-pylint
pkgver=0.15.0
pkgrel=1
pkgdesc='pytest plugin to check source code with pylint'
arch=('any')
license=('MIT')
url='https://github.com/carsongee/pytest-pylint'
depends=('python-pytest' 'python-pylint' 'python-six')
makedepends=('python-pytest-runner')
source=("$pkgname-$pkgver.tar.gz::https://github.com/carsongee/pytest-pylint/archive/$pkgver.tar.gz")
sha512sums=('d6e23cf6c8a0147b0835266b958976818b9d1ced06af8ebc77addd20e957d5f89d50a1c3b34512e5ee037fa7dc195b89098ff55fb6e94ceaa1255c6e9e1f3a02')

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
