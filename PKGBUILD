# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: olddog <jeff@impcode.com>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=pg_activity
pkgver=3.4.2
pkgrel=4
pkgdesc="Top-like application for PostgreSQL server activity monitoring"
arch=(any)
url="https://github.com/dalibo/pg_activity"
license=(PostgreSQL)
depends=(
  python
  python-attrs
  python-blessed
  python-humanize
  python-psutil
  python-psycopg
)
makedepends=(
  python-build
  python-installer
  python-wheel
)
checkdepends=(
  postgresql
  python-pytest
  python-pytest-postgresql
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('1e847d93244b50fb5bbb881c1b8b4fe78769c8f6b188f8cfa5a8c58ac7e51f0e')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  rm -rf tmp_install
  python -m installer --destdir=tmp_install dist/*.whl

  _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$_site_packages"
  # Deselected tests failing due to trying to modify locale.
  pytest tests/ \
    --deselect 'tests/test_data.py::test_encoding' \
    --deselect 'tests/test_data.py::test_postgres_and_python_encoding[unknown-EUC_TW-zh_TW.euctw]'
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE.txt
}
