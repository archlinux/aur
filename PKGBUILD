# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-deal
_name=${pkgname#python-}
pkgver=4.24.3
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
  python-pytest
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

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('aa9c1f6fe2301e4125878ac0caa2e27c016324c5d499125aeea77f128c766826')

_archive="$_name-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  # Many tests fail due to python-astroid being outdated (<v3).
  # https://archlinux.org/packages/extra/any/python-astroid/
  pytest --override-ini="addopts=" \
    --deselect tests/test_cli/test_stub.py::test_stub_command \
    --deselect tests/test_cli/test_test.py::test_no_violations \
    --deselect tests/test_doctest.py::test_doctest \
    --deselect tests/test_linter/test_checker.py::test_flake8_integration \
    --deselect tests/test_linter/test_extractors/test_result.py::test_uses_result \
    --deselect tests/test_linter/test_stub.py::test_do_not_dump_empty_stub \
    --deselect tests/test_linter/test_stub.py::test_generate_stub_exceptions \
    --deselect tests/test_linter/test_stub.py::test_generate_stub_markers \
    --deselect tests/test_testing.py::test_disable_type_checks \
    --deselect tests/test_testing.py::test_return_type_checks \
    --ignore tests/test_cli/test_decorate.py \
    --ignore tests/test_cli/test_lint.py \
    --ignore tests/test_linter/test_checker.py \
    --ignore tests/test_linter/test_extractors/test_asserts.py \
    --ignore tests/test_linter/test_extractors/test_exceptions.py \
    --ignore tests/test_linter/test_extractors/test_exceptions_stubs.py \
    --ignore tests/test_linter/test_extractors/test_imports.py \
    --ignore tests/test_linter/test_extractors/test_markers.py \
    --ignore tests/test_linter/test_extractors/test_pre.py \
    --ignore tests/test_linter/test_extractors/test_returns.py \
    --ignore tests/test_linter/test_rules.py \
    --ignore tests/test_linter/test_transformer.py \
    --ignore tests/test_testing.py
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
