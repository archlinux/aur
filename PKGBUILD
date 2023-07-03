# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-pytest-postgresql
_name=${pkgname#python-}
pkgver=5.0.0
pkgrel=3
pkgdesc="Test your code that relies on a running PostgreSQL Database"
arch=(any)
url="https://github.com/ClearcodeHQ/pytest-postgresql"
license=(GPL3)
depends=(
  python-pytest
  python-port-for
  python-mirakuru
  python-setuptools
  python-psycopg
)
makedepends=(
  python-build
  python-installer
  python-wheel
)
checkdepends=(
  postgresql
)

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('dcf4963205d0c81919c59be64b170a3aa707954484dc0dc7aa18b34d3e5b724b')

_archive="$_name-$pkgver"

prepare() {
  cd "$_archive"

  sed -i 's/^addopts.*//' pyproject.toml
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  PYTEST_DISABLE_PLUGIN_AUTOLOAD=1 python -m pytest \
    -k "not test_executor_init_with_password"
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
