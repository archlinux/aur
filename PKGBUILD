# Maintainer: Carl Smedstad <carsme@archlinux.org>
# Contributor: olddog <jeff@impcode.com>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=pg_activity
pkgver=3.6.1
pkgrel=1
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
  python-setuptools
  python-wheel
)
checkdepends=(
  postgresql
  python-pytest
  python-pytest-postgresql
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('6d6f5c8104566cdd8485911e61742d9609075718b3754075085598be58ba5625')

_archive="$pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  rm -rf tmp_install
  python -m installer --destdir=tmp_install dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
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
