# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=genai-prices
pkgname=python-$_name
pkgver=0.0.70
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
sha256sums=('46ecece7f8ed7fafd4e81cc729ad3b87b95d4978c78aaa2f17449006a9e4ca12')

prepare() {
  # Fix ValidationError
  cd "$srcdir"/$_name-$pkgver
  sed -i 's/no_color/color/g' packages/python/genai_prices/_cli.py
  sed -i 's/no-color/color/g' packages/python/genai_prices/_cli.py
  sed -i '137s/False/True/' packages/python/genai_prices/_cli.py
  sed -i 's/not args.color/args.color/g' packages/python/genai_prices/_cli.py
  sed -i 's/--no-color/--color/g' tests/test_cli.py
}

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
    --disable-warnings
  )
  cd "$srcdir"/$_name-$pkgver
  python -m venv --system-site-packages test-env
  cp -f prices/data.schema.json test-env/lib/python$python_version/data.schema.json
  cp -f prices/data.json test-env/lib/python$python_version/data.json
  cp -f prices/data_slim.json test-env/lib/python$python_version/data_slim.json
  test-env/bin/python -m installer packages/python/dist/*.whl
  test-env/bin/python -m installer prices/dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name-$pkgver/packages/python
  python -m installer --destdir="$pkgdir" dist/*.whl
}
