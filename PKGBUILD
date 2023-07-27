# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: olddog <jeff@impcode.com>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=pg_activity
pkgver=3.4.2
pkgrel=2
pkgdesc="Top-like application for PostgreSQL server activity monitoring"
arch=(any)
url="https://github.com/dalibo/pg_activity"
license=(custom:PostgreSQL)
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

  python -m pytest \
    -k "\
      not test_encoding \
      and not test_postgres_and_python_encoding \
    "
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
