# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python-mcp
pkgver=1.29.0
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
b2sums=('f65cb4f3333d5b22644e5308d00ef4c467ff3d24894791fce2a727b845abfeed5bf6ee4844d468e27d326ed52586cfaffd499a49278c88dbbe726ab6a24b947d')

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
