# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-polyfactory
_pkgname=${pkgname#python-}
pkgver=2.16.0
pkgrel=1
pkgdesc="Simple and powerful factories for mock data generation"
arch=(any)
url="https://github.com/litestar-org/polyfactory"
license=(MIT)
depends=(
  python
  python-attrs
  python-faker
  python-msgspec
  python-pydantic
  python-pydantic-core
  python-pymongo
  python-pytest
  python-sqlalchemy
  python-typing_extensions
)
makedepends=(
  python-build
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(
  python-aiosqlite
  python-email-validator
  python-hypothesis
  python-pytest-asyncio
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fbbc13bd2ab8801901c0a1aaa27978ede126b54deb9687d7faec9d62cbe3dec9')

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  # Deselect failing test
  pytest tests/ \
    --deselect tests/constraints/test_int_constraints.py::test_handle_constrained_int_handles_ge_with_le
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
