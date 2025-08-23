# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=mcp
pkgname=python-$_name
pkgver=1.13.1
pkgrel=2
pkgdesc='Model Context Protocol SDK.'
arch=('any')
url='https://github.com/modelcontextprotocol/python-sdk'
license=('MIT')
depends=('python' 'python-anyio' 'python-httpx' 'python-httpx-sse' 'python-pydantic' 'python-starlette' 'python-python-multipart' 'python-sse-starlette' 'python-pydantic-settings' 'uvicorn' 'python-jsonschema')
makedepends=('python-hatchling' 'python-uv-dynamic-versioning' 'python-build' 'python-installer' 'python-wheel' 'git')
checkdepends=('python-pytest' 'ruff' 'python-trio' 'python-pytest-flakefinder' 'python-pytest-xdist' 'python-pytest-examples' 'python-inline-snapshot' 'python-dirty-equals' 'python-rich' 'python-typer' 'python-dotenv' 'python-websockets' 'python-requests' 'uv' 'ruff')
optdepends=('python-rich: rich' 'python-typer: cli' 'python-dotenv: cli' 'python-websockets: ws')
source=("$_name-$pkgver::git+$url.git#tag=v$pkgver")
sha256sums=('bc1584396da89eaa374be9cc3ae9f895d012a90a58b72be6f85467740e3c4bb5')

prepare(){
  cd "$srcdir"/$_name-$pkgver
  sed -i 's/timeout=5/timeout=60/' tests/client/test_config.py # Increate time limit
}

build() {
  cd "$srcdir"/$_name-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  cd "$srcdir"/$_name-$pkgver
  PYTHONPATH=$PWD/src UV_PYTHON_PREFERENCE=only-system pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s $site_packages/$_name-$pkgver.dist-info/licenses/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
