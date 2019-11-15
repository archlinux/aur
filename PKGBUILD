# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-pytest-pylint
pkgver=0.14.1.20191107
_commit=97bda02e95b5a0e582a0c8674f3843ef66ecb7f7
pkgrel=1
pkgdesc='pytest plugin to check source code with pylint'
arch=('any')
license=('MIT')
url='https://github.com/carsongee/pytest-pylint'
depends=('python-pytest' 'python-pylint' 'python-six')
makedepends=('python-pytest-runner')
source=("$pkgname-$_commit.tar.gz::https://github.com/carsongee/pytest-pylint/archive/$_commit.tar.gz")
sha512sums=('19c54a6668ea7fa38c4c6a58752122551a0921225b6ff02dbd2d6984bd01280e329dffcb6d8dbf9e8ee74d37867961052312095faae0e824dc6aaff8564ed0f9')

prepare() {
  cd pytest-pylint-$_commit
  # Abandonware
  sed -i 's/--pep8//' tox.ini
  sed -i 's/import mock/from unittest import mock/' test_pytest_pylint.py
}

build() {
  cd pytest-pylint-$_commit
  python setup.py build
}

check() {
  # Hack entry points by installing it

  cd pytest-pylint-$_commit
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  PYTHONPATH="$PWD/tmp_install/usr/lib/python3.8/site-packages:$PYTHONPATH" py.test --ignore tmp_install
}

package() {
  cd pytest-pylint-$_commit
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
