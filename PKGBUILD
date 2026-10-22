# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=llm-structured-confidence
pkgname=python-$_name
pkgver=0.4.5
pkgrel=1
pkgdesc='Extract per-field confidence scores from LLM structured JSON outputs using token-level log-probabilities.'
arch=('any')
url='https://github.com/rodolfonobrega/llm-structured-confidence'
license=('MIT')
depends=('python'
         'python-lark')
makedepends=('python-hatchling'
             'python-build'
             'python-installer')
checkdepends=('python-pandas'
              'python-pydantic'
              'python-pytest'
              'python-litellm')
optdepends=('python-litellm: litellm'

            'python-google-genai: genai'

            'python-pandas: pandas')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('51be458f2cfc53b15b0b9ae6806c9d7bdba87a8930faa2a0f41ef799dfe1e91f')

build() {
  cd "$_name-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    --disable-warnings
    --deselect ${_name//-/_}/tests/test_e2e.py
  )
  cd "$_name-$pkgver"
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" ${_name//-/_}/tests
}

package() {
  cd "$_name-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}
