# Maintainer: envolution
# Contributor: Carl Smedstad <carsme@archlinux.org>

pkgname=python-instructor
_pkgname=${pkgname#python-}
pkgver=1.6.3
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
  python-jiter
  python-openai
  python-pydantic
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
  litellm
  python-anthropic
  python-cohere
  python-pytest
  python-pytest-asyncio
)
optdepends=(
  'python-anthropic: support for Anthropic models'
  'python-cohere: support for Cohere models'
  # Not packaged:
  # 'python-google-generativeai: support for Google Gemini models'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('a277b8f1046b47a465132b6666ddd90f24493bb62767f334fc0a6a2ca2b4fb45')

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
  # below is a mock one. Also ignore Gemini tests, the SDK is not packaged
  # yet.
  export OPENAI_API_KEY=sk-dBAe8c5a9bc4294cca9bed292cd61e0ff9030bB94647adfb
  pytest \
    --deselect tests/dsl/test_partial.py \
    --deselect tests/llm/test_anthropic/evals/test_simple.py \
    --deselect tests/llm/test_anthropic/test_stream.py \
    --deselect tests/llm/test_cohere \
    --deselect tests/llm/test_new_client.py \
    --deselect tests/test_simple_types.py::test_partial_not_simple \
    --ignore tests/llm/test_gemini \
    --ignore tests/llm/test_openai \
    --ignore tests/llm/test_vertexai
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
