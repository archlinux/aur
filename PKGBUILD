# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-mcp
pkgver=1.28.0
pkgrel=1
pkgdesc='Model Context Protocol SDK'
arch=(any)
url='https://github.com/modelcontextprotocol/python-sdk'
license=(MIT)
depends=(
  python
  python-anyio
  python-dotenv
  python-httpx
  python-httpx-sse
  python-jsonschema
  python-pydantic
  python-pydantic-settings
  python-pyjwt
  python-python-multipart
  python-sse-starlette
  python-starlette
  python-typer
  python-typing-inspection
  python-typing_extensions
  uvicorn
)
makedepends=(
  git
  python-build
  python-hatchling
  python-installer
  python-uv-dynamic-versioning
)
checkdepends=(
  python-dirty-equals
  python-inline-snapshot
  python-pytest
  python-pytest-examples
  python-pytest-xdist
  python-requests
  python-websockets
  ruff
  uv
)
optdepends=(
  'python-rich: rich logging support'
  'python-websockets: deprecated websocket transport support'
)
source=("git+https://github.com/modelcontextprotocol/python-sdk.git#tag=v$pkgver")
b2sums=('61c9162a0be27247b6d895fdd112e5abd24be727849260ca7b4f96e0e8ee68218b2c88cfb8b1b8fda958cc80a2c597ea8b42d1b1e979f695bfa58419045232e6')

prepare() {
  cd python-sdk
  # uv may take longer than the hardcoded subprocess timeout while creating its
  # transient environment in a clean build.
  sed -i 's/, timeout=20//' tests/client/test_config.py
}

build() {
  cd python-sdk
  python -m build --wheel --no-isolation
}

check() {
  cd python-sdk
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd python-sdk
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
