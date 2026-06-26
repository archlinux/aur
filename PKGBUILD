# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-mcp
pkgver=1.28.1
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
b2sums=('1fd185e2a29fef23ea7f2b1877105dd41eab2c513c11893f46089035e4a1a114459769ef0b0c26fcac870393807533e762b8770cb41a34c587f35da310ae9d20')

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
