# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=genai-prices
pkgname=python-$_name
pkgver=0.1.13
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
              'python-ruamel-yaml'
              'jq')
optdepends=('python-pydantic-settings: cli'
            'python-rich: cli'
            'python-rich-argparse: cli')
source=("$_name::git+$url.git#tag=v$pkgver")
sha256sums=('f0f753bc11b13bdf025555f44c1551fdfde5631fed9b010478b8796acb87fc2e')

build() {
  cd "$srcdir"/$_name
  python -m build --wheel --no-isolation --skip-dependency-check packages/python
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
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
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
