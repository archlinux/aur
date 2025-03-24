# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=mcp
pkgname=python-${_name}
pkgver=1.5.0
pkgrel=1
pkgdesc='Python implementation of the Model Context Protocol (MCP).'
arch=('x86_64' 'aarch64')
url='https://github.com/modelcontextprotocol/python-sdk'
license=('MIT')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name//-/_}-${pkgver}.tar.gz")
source_x86_64=("https://github.com/astral-sh/uv/releases/download/0.6.9/uv-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("https://github.com/astral-sh/uv/releases/download/0.6.9/uv-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('5b2766c05e68e01a2034875e250139839498c61792163a7b221fc170c12f5aa9')
sha256sums_x86_64=('001b87a0c2ea642a3c75a98c6af3e8528aa473d560e653cf213efcc9aaa4a028')
sha256sums_aarch64=('f5032ad47151c7906c0fb25f7c3b00a85ab0bfed2170cbc444e79c438799095b')
depends=('python>=3.10' 'python-anyio' 'python-httpx' 'python-httpx-sse' 'python-pydantic' 'python-starlette' 'python-sse-starlette' 'python-pydantic-settings' 'uvicorn')
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
}

build() {
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --override-ini="addopts="
  )
  cd "${srcdir}"/${_name//-/_}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/pip install -U websockets # Temporary until Arch maintainers update python-websockets
  env PATH="${srcdir}"/uv:$PATH UV_PROJECT_ENVIRONMENT=test-env UV_PYTHON_PREFERENCE=only-system test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "${srcdir}"/${_name//-/_}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
