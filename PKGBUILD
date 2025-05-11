# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-quart-schema
pkgver=0.22.0
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
sha256sums=('93329ac99ebe020d6ff72a6156ea22e38a6fbfa17e1c655b303347ca9f8de509')

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
