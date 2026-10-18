# Maintainer: Claudia Pellegrino <auerhuhn@archlinux.org>
# Contributor: envolution
# Contributor: Carl Smedstad <carsme@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=python-anthropic
_pkgname=anthropic-sdk-python
pkgver=1.15.0
pkgrel=1
pkgdesc="Python library that provides convenient access to the Anthropic REST API"
arch=(any)
url="https://github.com/anthropics/anthropic-sdk-python"
license=(MIT)
depends=(
  python
  python-anyio
  python-docstring-parser
  python-httpx2
  python-jiter
  python-opentelemetry-api
  python-pydantic
  python-pydantic-core
  python-sniffio
  python-standardwebhooks
  python-typing_extensions
)
makedepends=(
  python-build
  python-hatch-fancy-pypi-readme
  python-hatchling
  python-installer
  python-wheel
)
checkdepends=(
  python-boto3
  python-botocore
  python-dirty-equals
  python-opentelemetry-sdk
  python-pytest
  python-pytest-asyncio
  python-pytest-http-snapshot
  python-pytest-xdist
  python-respx
)
optdepends=(
  'python-boto3: for Anthropic Bedrock API support'
  'python-botocore: for Anthropic Bedrock API support'
  'python-google-auth: for Anthropic Vertex API support'
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
)
sha256sums=('a8f673531c286bdb1fa90c2c816bec3703b072f27ad118c23744d515d4e25dad')

prepare() {
  cd $_pkgname-$pkgver
  sed -i 's/hatchling==/hatchling>=/' pyproject.toml
}

build() {
  cd $_pkgname-$pkgver

  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  # Deselect tests/api_resources as it requires access to the API.
  test-env/bin/python -m pytest -p no:benchmark \
    --deselect tests/api_resources/
}

package() {
  cd $_pkgname-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
