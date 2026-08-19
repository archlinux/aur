# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=genai-prices
pkgname=python-$_name
pkgver=0.1.3
pkgrel=1
pkgdesc='Calculate prices for calling LLM inference APIs.'
arch=('any')
url='https://github.com/pydantic/genai-prices'
license=('MIT')
depends=('python' 'python-httpx2' 'python-pydantic')
makedepends=('python-uv-build' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-anyio' 'python-dirty-equals' 'python-inline-snapshot' 'python-pytest' 'python-pytest-recording' 'python-pydantic-settings' 'python-rich' 'python-rich-argparse' 'python-boto3' 'python-ruamel-yaml')
optdepends=('python-pydantic-settings: cli' 'python-rich: cli' 'python-rich-argparse: cli')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9eea4f6ac1903f4d442bdde48409f910809b48fc12746b838019b904a7337066')

build() {
    cd "$srcdir"/$_name-$pkgver
    python -m build --wheel --no-isolation --skip-dependency-check packages/python
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
  )
  cd "$srcdir"/$_name-$pkgver
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer packages/python/dist/*.whl
  PYTHONPATH="$PWD/prices/src" test-env/bin/python -P -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name-$pkgver
  python -m installer --destdir="$pkgdir" packages/python/dist/*.whl
}
