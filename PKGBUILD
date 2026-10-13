# Maintainer: omgold@aur
# Contributor: Felix Yan <felixonmars@archlinux.org>

pkgname=python-mcp2
pkgver=2.3.0
pkgrel=1
pkgdesc='Model Context Protocol SDK version 2.x'
arch=(any)
url='https://github.com/modelcontextprotocol/python-sdk'
license=(MIT)
depends=(
  python
  python-anyio
  python-cryptography
  python-dotenv
  python-httpx2
  python-jsonschema
  python-opentelemetry-api
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
  python-blockbuster
  python-coverage
  python-dirty-equals
  python-importlib-metadata
  python-inline-snapshot
  python-logfire
  python-opentelemetry-sdk
  python-pillow
  python-pytest
  python-pytest-examples
  python-pytest-xdist
  python-requests
  python-trio
  ruff
  uv
)
optdepends=(
  'python-rich: rich logging support'
)
provides=("python-mcp-types=$pkgver")
conflicts=(python-mcp python-mcp-types)
source=("git+https://github.com/modelcontextprotocol/python-sdk.git#tag=v$pkgver")
b2sums=('13a48f64e4347a2def79cb2e7bfd834da2ac8418db5deb625d9c572ed7d55dcc7ae255b14d0123fb59bd39408f32b2fa8a06b46dd5ef6bd8dad5dbc676a25bbe')

build() {
  cd python-sdk
  python -m build --wheel --no-isolation --outdir dist src/mcp-types
  python -m build --wheel --no-isolation
}

check() {
  cd python-sdk
  python -m venv --clear --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  PYTHONPATH="$PWD/examples" test-env/bin/python -m pytest --ignore=tests/docs
}

package() {
  cd python-sdk
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
