# Contributor: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-deal
_pkgname=${pkgname#python-}
pkgver=4.24.6
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
sha256sums=('1845a53d3cac40ad2ca07d27f4476114e7add92a65f65735352b270dd7237863')

_archive="${_pkgname}-${pkgver}"

prepare() {
    cd "${srcdir}/${_archive}"

    sed -i \
        's|requires *= *\["flit_core[^"]*"\]|requires = ["flit_core"]|' \
        pyproject.toml
}

build() {
    cd "${srcdir}/${_archive}"

    python -m build --wheel --no-isolation
}

check() {
    cd "${srcdir}/${_archive}"

    rm -rf "${srcdir}/test-install"

    python -m installer \
        --destdir="${srcdir}/test-install" \
        dist/*.whl

    pyver=$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')

    export PYTHONPATH="${srcdir}/test-install/usr/lib/python${pyver}/site-packages"

    pytest --override-ini="addopts=" \
    --ignore=tests/test_linter/test_extractors/test_exceptions.py \
    --deselect tests/test_linter/test_checker.py::test_flake8_integration \
    --deselect tests/test_cli/test_test.py::test_no_violations \
    --deselect tests/test_cli/test_test.py::test_print_exception \
    --deselect tests/test_doctest.py::test_doctest \
    --deselect tests/test_linter/test_extractors/test_exceptions.py \
    --deselect tests/test_linter/test_extractors/test_exceptions_stubs.py::test_marhsmallow_stubs \
    --deselect tests/test_testing.py \
    --deselect tests/test_linter/test_extractors/test_common.py::test_infer
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
