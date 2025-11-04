# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=mcp
pkgname=python-$_name
pkgver=1.20.0
pkgrel=2
pkgdesc='Model Context Protocol SDK.'
arch=('any')
url='https://github.com/modelcontextprotocol/python-sdk'
license=('MIT')
depends=('python' 'python-anyio' 'python-httpx' 'python-httpx-sse' 'python-pydantic' 'python-starlette' 'python-python-multipart' 'python-sse-starlette' 'python-pydantic-settings' 'uvicorn' 'python-jsonschema' 'python-pyjwt' 'python-cryptography')
makedepends=('python-hatchling' 'python-uv-dynamic-versioning' 'python-build' 'python-installer' 'python-wheel' 'git')
checkdepends=('python-pytest' 'python-trio' 'python-pytest-xdist' 'python-pytest-examples' 'python-inline-snapshot' 'python-dirty-equals' 'python-rich' 'python-typer' 'python-dotenv' 'python-websockets' 'python-requests' 'uv' 'ruff')
optdepends=('python-rich: rich' 'python-typer: cli' 'python-dotenv: cli' 'python-websockets: ws')
source=("$_name::git+$url.git#tag=v$pkgver"
        "fix-pydantic-2.12.x.patch")
sha256sums=('fd98c19073debacade9dd842b88c850edbf11cd0c37c9ce217ff8863b78d484b'
            '30f3aa2c6c50f6c3b5ac19ea43af30e0f037d6b88f91c2d9b658329ea1ef23b8')

prepare(){
  cd "$srcdir"/$_name
  git clean -fdx
  sed -i 's/timeout=5/timeout=60/' tests/client/test_config.py # Increate time limit
  patch -Np1 -i ../fix-pydantic-2.12.x.patch # Fix compatibility with Pydantic >= 2.12
}

build() {
  cd "$srcdir"/$_name
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
  )
  cd "$srcdir"/$_name
  python -m venv --system-site-packages test-env
  ln -s /usr/bin/ruff test-env/bin/ruff
  test-env/bin/python -m installer dist/*.whl
  UV_PYTHON_PREFERENCE=only-system test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s $site_packages/$_name-$pkgver.dist-info/licenses/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
