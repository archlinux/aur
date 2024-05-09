# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-instructor
_pkgname=${pkgname#python-}
pkgver=1.2.6
pkgrel=1
pkgdesc="Structured outputs for LLMs"
arch=(any)
url="https://github.com/jxnl/instructor"
license=(MIT)
depends=(
  python
  python-aiohttp
  python-docstring-parser
  python-httpx
  python-openai
  python-pydantic
  python-pydantic-core
  python-regex
  python-rich
  python-tenacity
  python-typer
  python-typing_extensions
)
makedepends=(
  python-build
  python-installer
  python-poetry
  python-wheel
)
checkdepends=(
  python-anthropic
  python-cohere
  python-pytest
)
optdepends=(
  'python-anthropic: support for Anthropic models'
  'python-cohere: support for Cohere models'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('b0fd74983a8f4f79303c21c74b828dba0c249b4a357292433e11393ebc33e5cb')

_archive="$_pkgname-$pkgver"

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  rm -rf tmp_install
  python -m installer --destdir=tmp_install dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH"
  # Deselect/ignore tests requiring valid API keys to OpenAI or Anthropic,
  # below is a mock one.
  export OPENAI_API_KEY=sk-dBAe8c5a9bc4294cca9bed292cd61e0ff9030bB94647adfb
  pytest \
    --deselect tests/dsl/test_partial.py \
    --deselect tests/llm/test_anthropic/evals/test_simple.py \
    --deselect tests/llm/test_new_client.py \
    --ignore tests/llm/test_openai
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
