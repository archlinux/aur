# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-pytest-postgresql
_pkgname=${pkgname#python-}
pkgver=7.0.1
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
sha256sums=('2d018ed0ff50bbe2d2e84f3217d689d3a91186131eceb54f65c335dc6474fdda')

build() {
  cd "$_pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname-$pkgver"
  export PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
  pytest --override-ini="addopts=" \
    --deselect tests/test_executor.py::test_executor_init_with_password \
    --ignore tests/docker/test_noproc_docker.py
}

package() {
  cd "$_pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
