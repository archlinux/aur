# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-quart-schema
pkgver=0.21.0
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
sha256sums=('929c99376f03b5b861638caa0831337ec5409c346f777009022d5ad7650e1c4a')

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
