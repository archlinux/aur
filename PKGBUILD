# shellcheck disable=SC2034,SC2154,SC2164
# Old maintainer: Carl Smedstad <carsme@archlinux.org>
# Maintainer: Energetix/Dark Nebula <https://github.com/Jobanny-Friki>

pkgname=python-quart-schema
pkgver=0.23.0
pkgrel=1
pkgdesc="Quart extension that provides schema validation and auto-generated API documentation"
arch=(any)
url="https://github.com/pgjones/quart-schema"
license=(MIT)
depends=(
  python
  python-humps
  python-quart
)
makedepends=(
  python-build
  python-installer
  python-pdm-backend
  python-wheel
)
checkdepends=(
  python-hypothesis
  python-msgspec
  python-pydantic
  python-pytest
  python-pytest-asyncio
)
source=("$url/archive/$pkgver/${pkgname#python-}-$pkgver.tar.gz")
sha256sums=('9127f6cd031427d162d3f58d769722dbe0783b9386ca08871b82e452924766d4')

build() {
  cd "${pkgname#python-}-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "${pkgname#python-}-$pkgver"
  rm -rf test-env
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest --override-ini="addopts="
}

package() {
  cd "${pkgname#python-}-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
