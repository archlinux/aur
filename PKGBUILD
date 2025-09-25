# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-deal
_pkgname=${pkgname#python-}
pkgver=4.24.5
pkgrel=1
pkgdesc="Design by contract for Python. Write bug-free code. Add a few decorators, get static analysis and tests for free"
arch=(any)
url="https://github.com/life4/deal"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-flit-core
  python-installer
  python-wheel
)
checkdepends=(
  python-astroid
  python-docstring-parser
  python-hypothesis
  python-pytest
# checks that required this are deselected atm
#  python-typeguard
  python-urllib3
)
optdepends=(
  'python-astroid: for tyupe inference in linter'
  # 'python-deal-solver: for formal verification'
  'python-hypothesis: for test generation'
  'python-pygments: for syntax highlighting in exceptions'
  'python-typeguard: for runtime type checking in tests'
  # 'python-vaa: for supporting schemes (like marshmallow) as validators'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('c5e4ac4012c3ccf54d80168b3b343c96024b9d0119b7b30e93675184b721b920')

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  # Deselect failing tests - most are failing due to using CallMemo which was
  # removed from typeguard in v4.0.0.
  pytest --override-ini="addopts=" \
    --deselect tests/test_cli/test_test.py::test_no_violations \
    --deselect tests/test_cli/test_test.py::test_print_exception \
    --deselect tests/test_doctest.py::test_doctest \
    --deselect tests/test_linter/test_extractors/test_exceptions_stubs.py::test_marhsmallow_stubs \
    --deselect tests/test_testing.py \
    --deselect tests/test_linter/test_extractors/test_common.py::test_infer
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
