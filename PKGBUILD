# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-pytest-postgresql
_pkgname=${pkgname#python-}
pkgver=6.0.1
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
checkdepends=(
  postgresql
  python-typing_extensions
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('33f5386a834803684469166f58fd90d6c1e09d61d39a7358713bf495a9da2507')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  export PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
  pytest --override-ini="addopts=" \
    --deselect tests/test_executor.py::test_executor_init_with_password
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
