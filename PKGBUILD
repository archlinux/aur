# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=genai-prices
pkgname=python-$_name
pkgver=0.0.25
pkgrel=1
pkgdesc='Calculate prices for calling LLM inference APIs.'
arch=('any')
url='https://github.com/pydantic/genai-prices'
license=('MIT')
depends=('python' 'python-httpx' 'python-pydantic')
makedepends=('python-uv-build' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-anyio' 'python-devtools' 'python-dirty-equals' 'python-inline-snapshot' 'python-pytest' 'python-pytest-recording' 'python-ruamel-yaml')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('46ebd6f3ac0d21cbb315b13a0dec5781d0de0eac21e57c59c0beda2a8c09e12a')

build() {
    cd "$srcdir"/$_name-$pkgver/packages/python
    python -m build --wheel --no-isolation --skip-dependency-check
    cd "$srcdir"/$_name-$pkgver/prices
    python -m build --wheel --no-isolation --skip-dependency-check
}

check() {
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  local pytest_options=(
    -vv
  )
  cd "$srcdir"/$_name-$pkgver
  python -m venv --system-site-packages test-env
  cp -f prices/data.schema.json test-env/lib/python$python_version/data.schema.json
  test-env/bin/python -m installer packages/python/dist/*.whl
  test-env/bin/python -m installer prices/dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name-$pkgver/packages/python
  python -m installer --destdir="$pkgdir" dist/*.whl
}
