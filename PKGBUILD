# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-icontract
_name=${pkgname#python-}
pkgver=2.7.1
pkgrel=1
pkgdesc="Design-by-contract in Python3 with informative violation messages and inheritance"
arch=(any)
url="https://github.com/Parquery/icontract"
license=(MIT)
depends=(
  python
  python-asttokens
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  mypy
  python-astor
  python-asyncstdlib
  python-deal
  python-dpcontracts
  python-numpy
  python-pytest
  python-typeguard
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6cde2c3aa65e99f4f8ec77df86c3c7f4194a3bc0145bb12a6eb91e999c2fdc23')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  pytest \
    --deselect tests/test_globals.py::TestSlow::test_slow_set \
    --deselect tests/test_inheritance_postcondition.py::TestInvalid::test_abstract_method_not_implemented \
    --deselect tests/test_inheritance_precondition.py::TestInvalid::test_abstract_method_not_implemented
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
