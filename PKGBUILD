# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=genai-prices
pkgname=python-$_name
pkgver=0.1.8
pkgrel=1
pkgdesc='Calculate prices for calling LLM inference APIs.'
arch=('any')
url='https://github.com/pydantic/genai-prices'
license=('MIT')
depends=('python'
         'python-httpx2'
         'python-pydantic')
makedepends=('python-hatchling'
             'python-uv-dynamic-versioning'
             'python-build'
             'python-installer'
             'python-wheel'
             'git')
checkdepends=('python-anyio'
              'python-dirty-equals'
              'python-inline-snapshot'
              'python-pytest'
              'python-pytest-recording'
              'python-pydantic-settings'
              'python-rich'
              'python-rich-argparse'
              'python-boto3'
              'python-jsonschema'
              'python-ruamel-yaml')
optdepends=('python-pydantic-settings: cli'
            'python-rich: cli'
            'python-rich-argparse: cli')
source=("$_name::git+$url.git#tag=v$pkgver")
sha256sums=('40695748da4513f9e4022388d88b61bd50429711a8e3829e182ac8ea0f0b29d8')

build() {
  cd "$srcdir"/$_name
  python -m build --wheel --no-isolation --skip-dependency-check packages/python
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    # Package still doesn't exist in AUR
    --ignore tests/test_source_aws.py
  )
  cd "$srcdir"/$_name
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer packages/python/dist/*.whl
  PYTHONPATH="$PWD/prices/src" test-env/bin/python -P -m pytest "${pytest_options[@]}" tests
}

package() {
  cd "$srcdir"/$_name
  python -m installer --destdir="$pkgdir" packages/python/dist/*.whl
}
