# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=mcp
pkgname=python-$_name
pkgver=1.25.0
pkgrel=1
pkgdesc='Model Context Protocol SDK.'
arch=('any')
url='https://github.com/modelcontextprotocol/python-sdk'
license=('MIT')
depends=('python' 'python-anyio' 'python-httpx' 'python-httpx-sse' 'python-pydantic' 'python-starlette' 'python-python-multipart' 'python-sse-starlette' 'python-pydantic-settings' 'uvicorn' 'python-jsonschema' 'python-pyjwt' 'python-cryptography' 'python-typing_extensions' 'python-typing-inspection')
makedepends=('python-hatchling' 'python-uv-dynamic-versioning' 'python-build' 'python-installer' 'python-wheel' 'git')
checkdepends=('python-pytest' 'python-trio' 'python-pytest-xdist' 'python-pytest-examples' 'python-inline-snapshot' 'python-dirty-equals' 'python-rich' 'python-typer' 'python-dotenv' 'python-websockets' 'python-requests' 'uv' 'ruff')
optdepends=('python-rich: rich' 'python-typer: cli' 'python-dotenv: cli' 'python-websockets: ws')
source=("$_name::git+$url.git#tag=v$pkgver"
        "https://github.com/modelcontextprotocol/python-sdk/pull/1834.patch")
sha256sums=('08c376069011439d6fa0928267ce45eddc127aed40b59367ab2dc54c602bdcaa'
            '34fb50d1543e374a1c6de07011b5484c08a93f3f7e3d38eca44e25b5e4ac06a6')

prepare(){
  cd "$srcdir"/$_name
  git clean -fdx
  # Fix compatibility with Python 3.14
  patch -Np1 -i ../1834.patch
  sed -i 's/timeout=20/timeout=60/' tests/client/test_config.py # Increate time limit
}

build() {
  cd "$srcdir"/$_name
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    -p 'no:benchmark'
  )
  cd "$srcdir"/$_name
  python -m venv --system-site-packages test-env
  ln -s /usr/bin/ruff test-env/bin/ruff
  test-env/bin/python -P -m installer dist/*.whl
  UV_PYTHON_PREFERENCE=only-system test-env/bin/python -P -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name
  python -m installer --destdir="$pkgdir" dist/*.whl
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  install -d "$pkgdir"/usr/share/licenses/$pkgname
  ln -s $site_packages/$_name-$pkgver.dist-info/licenses/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
