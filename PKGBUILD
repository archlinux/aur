# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=mcp
pkgname=python-$_name
pkgver=1.21.0
pkgrel=1
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
sha256sums=('eaf78cdec38a602f9505f0748115fdd3f9e98b4de7212a5c050cf6be6fcf2562'
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
  test-env/bin/python -P -m installer dist/*.whl
  UV_PYTHON_PREFERENCE=only-system test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s $site_packages/$_name-$pkgver.dist-info/licenses/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
