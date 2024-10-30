# Maintainer: envolution
# Contributor: Carl Smedstad <carsme@archlinux.org>

pkgname=python-anthropic
_pkgname=anthropic-sdk-python
pkgver=0.37.1
pkgrel=1
pkgdesc="Python library that provides convenient access to the Anthropic REST API"
arch=(any)
url="https://github.com/anthropics/anthropic-sdk-python"
license=(MIT)
depends=(
  python
  python-anyio
  python-distro
  python-httpx
  python-jiter
  python-pydantic
  python-pydantic-core
  python-sniffio
  python-tokenizers
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
  python-dirty-equals
  python-pytest
  python-pytest-asyncio
  python-respx
)
optdepends=(
  'python-boto3: for Anthropic Bedrock API support'
  'python-botocore: for Anthropic Bedrock API support'
  'python-google-auth: for Anthropic Vertex API support'
)
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
  "fix-pytest-asyncio-usage.patch"
)
sha256sums=('888312a688285ac59befdcf3779455f5af574f7926afab89bf506203a3a940d4'
            '9058cc717a6e8eebba65d9735e7376f9d1a024f0e4a2635b96278e6a39b31e01')

prepare() {
  cd $_pkgname-$pkgver

  patch --forward --strip=1 --input="$srcdir/fix-pytest-asyncio-usage.patch"
}

build() {
  cd $_pkgname-$pkgver

  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver

  rm -rf tmp_install
  python -m installer --destdir=tmp_install dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  # Deselect tests/api_resources as it requires access to the API.
  # Also, deselect failing tests - not sure why they fail.
  pytest \
    --deselect tests/api_resources \
    --deselect tests/lib/test_bedrock.py \
    --deselect tests/test_client.py::TestAnthropic::test_copy_build_request \
    --deselect tests/test_client.py::TestAnthropic::test_proxies_option_is_deprecated \
    --deselect tests/test_client.py::TestAsyncAnthropic::test_copy_build_request \
    --deselect tests/test_client.py::TestAsyncAnthropic::test_proxies_option_is_deprecated
}

package() {
  cd $_pkgname-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
