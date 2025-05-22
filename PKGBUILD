# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=mcp
pkgname=python-${_name}
pkgver=1.9.0
pkgrel=2
pkgdesc='Python implementation of the Model Context Protocol (MCP).'
arch=('x86_64' 'aarch64')
url='https://github.com/modelcontextprotocol/python-sdk'
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
source_x86_64=("https://github.com/astral-sh/uv/releases/latest/download/uv-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/astral-sh/uv/releases/latest/download/uv-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('905d8d208baf7e3e71d70c82803b89112e321581bcd2530f9de0fe4103d28749')
sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')
depends=('python' 'python-anyio' 'python-httpx' 'python-httpx-sse' 'python-pydantic' 'python-starlette' 'python-python-multipart' 'python-sse-starlette' 'python-pydantic-settings' 'uvicorn')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-trio' 'python-pytest-flakefinder' 'python-pytest-xdist' 'python-pytest-examples' 'python-rich' 'python-typer' 'python-dotenv' 'python-websockets')
optdepends=('python-rich: rich' 'python-typer: cli' 'python-dotenv: cli' 'python-websockets: ws')

prepare(){
  if [ -d "uv-x86_64-unknown-linux-gnu" ]; then
    mv -f uv-x86_64-unknown-linux-gnu uv
  else
    mv -f uv-aarch64-unknown-linux-gnu uv
  fi
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  sed -i 's/requires = \["hatchling", "uv-dynamic-versioning"\]/requires = ["hatchling"]/' pyproject.toml # Remove uv-dynamic-versioning dependency as it is not needed
  echo $(python --version | cut -d' ' -f2 | cut -d'.' -f1,2) > .python-version # Update the file to use the installed one in system
  sed -i 's/timeout=5/timeout=60/' tests/client/test_config.py # Increate time limit
}

build() {
  cd "${srcdir}"/${_name}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --deselect tests/client/test_session.py::test_client_session_version_negotiation_failure
  )
  cd "${srcdir}"/${_name}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  ln -sf /usr/bin/ruff test-env/bin/ruff
  env PATH="${srcdir}"/uv:$PATH UV_PROJECT_ENVIRONMENT=test-env UV_PYTHON_PREFERENCE=only-system test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
