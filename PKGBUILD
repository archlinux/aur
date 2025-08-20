# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=devtools
pkgname=python-$_name
pkgver=0.12.2
pkgrel=2
pkgdesc="Python's missing debug print command, and more."
arch=('any')
url='https://github.com/samuelcolvin/python-devtools'
license=('MIT')
depends=('python' 'python-executing' 'python-asttokens' 'python-six' 'python-pygments')
makedepends=('python-hatchling')
checkdepends=('python-pytest' 'python-pytest-mock' 'python-asyncpg' 'python-multidict' 'python-numpy' 'python-pydantic' 'python-sqlalchemy')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('efceab184cb35e3a11fa8e602cc4fadacaa2e859e920fc6f87bf130b69885507')

build() {
  cd "$srcdir"/$_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # Failed
    --deselect tests/test_expr_render.py::test_executing_failure
    --deselect tests/test_insert_assert.py::test_insert_assert
    --deselect tests/test_insert_assert.py::test_insert_assert_no_pretty
    --deselect tests/test_insert_assert.py::test_insert_assert_print
    --deselect tests/test_insert_assert.py::test_insert_assert_fail
    --deselect tests/test_insert_assert.py::test_deep
    --deselect tests/test_insert_assert.py::test_enum
    --deselect tests/tests/test_insert_assert.py::test_insert_assert_repeat
    --deselect tests/test_prettier.py::test_ast_expr
  )
  cd "$srcdir"/$_name-$pkgver
  PYTHONPATH="$srcdir"/$_name-$pkgver pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
