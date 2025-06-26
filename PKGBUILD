# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=mcp
pkgname=python-${_name}
pkgver=1.10.0
pkgrel=2
pkgdesc='Model Context Protocol SDK.'
arch=('any')
url='https://github.com/modelcontextprotocol/python-sdk'
license=('MIT')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('205470d15bb2bc95dcb932f9bd3f125a15aa566baa154dfff7fc423d72c58a93')
depends=('python' 'python-anyio' 'python-httpx' 'python-httpx-sse' 'python-pydantic' 'python-starlette' 'python-python-multipart' 'python-sse-starlette' 'python-pydantic-settings' 'uvicorn' 'python-jsonschema')
makedepends=('python-hatchling' 'python-uv-dynamic-versioning' 'python-build' 'python-installer' 'python-wheel' 'git')
checkdepends=('python-pytest' 'ruff' 'python-trio' 'python-pytest-flakefinder' 'python-pytest-xdist' 'python-pytest-examples' 'python-inline-snapshot' 'python-rich' 'python-typer' 'python-dotenv' 'python-websockets' 'python-requests' 'uv')
optdepends=('python-rich: rich' 'python-typer: cli' 'python-dotenv: cli' 'python-websockets: ws')

prepare(){
  cd "${srcdir}"/${pkgname//mcp/sdk}-${pkgver}
  sed -i 's/timeout=5/timeout=60/' tests/client/test_config.py # Increate time limit
  sed -i "206i\        'additionalProperties': True," tests/server/fastmcp/test_func_metadata.py # Fix for pydantic 2.11
}

build() {
  cd "${srcdir}"/${pkgname//mcp/sdk}-${pkgver}
  git tag v${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  cd "${srcdir}"/${pkgname//mcp/sdk}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  ln -sf /usr/bin/ruff test-env/bin/ruff
  UV_PROJECT_ENVIRONMENT=test-env UV_PYTHON_PREFERENCE=only-system test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${pkgname//mcp/sdk}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
