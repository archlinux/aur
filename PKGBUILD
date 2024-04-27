# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-case-converter
pkgver=1.1.0
pkgrel=1
pkgdesc="A case conversion library for Python"
arch=(any)
url="https://github.com/chrisdoherty4/python-case-converter"
license=(MIT)
depends=(python)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(python-pytest)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4b384dcf6fbc12ce63ef35df1dfe564f1c89f5e06b8258e4043f419f61e6985e')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  pytest
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # Remove installed test files.
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  rm \
    "$pkgdir/$site_packages/caseconverter/camel_test.py" \
    "$pkgdir/$site_packages/caseconverter/caseconverter_test.py" \
    "$pkgdir/$site_packages/caseconverter/cobol_test.py" \
    "$pkgdir/$site_packages/caseconverter/flat_test.py" \
    "$pkgdir/$site_packages/caseconverter/kebab_test.py" \
    "$pkgdir/$site_packages/caseconverter/macro_test.py" \
    "$pkgdir/$site_packages/caseconverter/pascal_test.py" \
    "$pkgdir/$site_packages/caseconverter/snake_test.py"
}
