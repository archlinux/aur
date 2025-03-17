# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=mcp
pkgname=python-${_name}
pkgver=1.4.1
pkgrel=1
pkgdesc='Python implementation of the Model Context Protocol (MCP).'
arch=('any')
url='https://github.com/modelcontextprotocol/python-sdk'
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
sha256sums=('b9655d2de6313f9d55a7d1df62b3c3fe27a530100cc85bf23729145b0dba4c7a')
depends=('python>=3.10' 'python-anyio' 'python-httpx' 'python-httpx-sse' 'python-pydantic' 'python-starlette' 'python-sse-starlette' 'python-pydantic-settings' 'uvicorn')
makedepends=('python-hatchling' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-trio' 'python-pytest-flakefinder' 'python-pytest-xdist' 'python-pytest-examples' 'python-rich' 'python-typer' 'python-dotenv' 'python-websockets' 'uv')
optdepends=('python-rich: rich' 'python-typer: cli' 'python-dotenv: cli' 'python-websockets: ws')

prepare(){
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  sed -i 's/requires = \["hatchling", "uv-dynamic-versioning"\]/requires = ["hatchling"]/' pyproject.toml # Remove uv-dynamic-versioning dependency as it is not needed
  sed -i 's/timeout=5/timeout=360/' tests/client/test_config.py # Remove timelimit
  echo $(python --version | cut -d' ' -f2 | cut -d'.' -f1,2) > .python-version # Update the file to use the installed one in system
}

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --override-ini="addopts="
    --ignore tests/shared/test_ws.py # The version provided by Arch Maintainer isn't compatible
  )
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  UV_PROJECT_ENVIRONMENT=test-env UV_PYTHON_PREFERENCE=only-system test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
