# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-elastic-transport
_pkgname=elastic-transport-python
pkgver=8.13.1
pkgrel=1
pkgdesc="Transport classes and utilities shared among Python Elastic client libraries"
arch=(any)
url="https://github.com/elastic/elastic-transport-python"
license=(Apache-2.0)
depends=(
  python
  python-aiohttp
  python-certifi
  python-httpx
  python-orjson
  python-requests
  python-typing_extensions
  python-urllib3
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-asyncio
  python-pytest-httpserver
  python-respx
  python-trustme
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "remove-dependency-mock.patch"
)
sha256sums=(
  '3b634a4c760076b142567696675ec153fa85b9e8a7e66f838e6505bde827940f'
  '5db2acadb3967e86cce85919036790362fa8ac43645c4f748e6193657c3ea982'
)

_archive="$_pkgname-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/remove-dependency-mock.patch"
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  # OpenTelemetry not in Arch repos (yet)
  pytest --override-ini="addopts=" \
    --ignore tests/test_otel.py
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
