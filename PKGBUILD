# Maintainer:  Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Eduardo Parra Mazuecos <eduparra90@gmail.com>

_pkgname=pyexcel
pkgname=python-$_pkgname
pkgver=0.7.5
pkgrel=1
pkgdesc="Single API for reading, manipulating and writing data in excel files"
arch=(any)
url="https://github.com/pyexcel/pyexcel"
license=(BSD-3-Clause)
makedepends=(python-build python-installer python-setuptools python-wheel)
depends=(python-texttable python-pyexcel-io)
checkdepends=(python-pytest python-pyexcel-xls python-pyexcel-xlsx python-pyexcel-ods3
              python-sqlalchemy python-psutil python-chardet python-flask python-xlrd)
source=($pkgname-$pkgver.tar.gz::"$url/archive/v$pkgver.tar.gz")
sha256sums=('0d7b8b8a5ee57a24476076c7539d9b916ab01ae21db23ec5e92f521191551524')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m build \
    --wheel \
    --no-isolation \
    --skip-dependency-check
}

check() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m venv --system-site-packages testenv
  testenv/bin/python -m installer dist/*.whl
  testenv/bin/python -m pytest tests \
    --deselect tests/test_sheet_attributes.py::test_svg_representation \
    --deselect tests/test_sheet_attributes.py::test_html_representation \
    --deselect tests/test_file_type_as_attribute.py::test_invalid_json_setter \
    --deselect tests/test_bug_fixes.py::test_xls_issue_11 \
    --deselect tests/test_examples.py::TestAllExamples::test_them
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python -m installer \
    --destdir="$pkgdir" \
    --compile-bytecode=2 \
    dist/*.whl

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
