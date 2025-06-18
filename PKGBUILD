# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-pytest-postgresql
_pkgname=${pkgname#python-}
pkgver=7.0.2
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
sha256sums=('0a84f3bc1bad9e53e77dc0cfab3697fb2eef34541657b2a1077a940c08494004')

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
