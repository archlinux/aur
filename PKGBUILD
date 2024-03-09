# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-pytest-postgresql
_pkgname=${pkgname#python-}
pkgver=5.1.1
pkgrel=1
pkgdesc="Test your code that relies on a running PostgreSQL Database"
arch=(any)
url="https://github.com/ClearcodeHQ/pytest-postgresql"
license=(
  GPL-3.0-or-later
  LGPL-3.0-or-later
)
depends=(
  python
  python-mirakuru
  python-packaging
  python-port-for
  python-psycopg
  python-pytest
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(postgresql)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('387a6eac08b0e59d08b953b88699e6d06b22eccbbe16771ad94c0a19ed7812d1')

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  export PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
  pytest --override-ini="addopts=" \
    --deselect tests/test_executor.py::test_executor_init_with_password
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
