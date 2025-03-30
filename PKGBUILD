# Maintainer: envolution
# Contributor: Carl Smedstad <carsme@archlinux.org>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-instructor
_pkgname=${pkgname#python-}
pkgver=1.7.8
pkgrel=3
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
  python-jinja
  python-grpcio
  python-google-genai
  python-mistralai
)
makedepends=(
  python-build
  python-installer
  python-poetry
  python-wheel
  python-hatchling
)
checkdepends=(
  litellm
  python-pytest-examples
  python-anthropic
  python-cohere
  python-pytest
  python-pytest-asyncio
  python-docstring-parser
  python-typing-inspection
  python-google-generativeai
)
optdepends=(
  'python-anthropic: support for Anthropic models'
  'python-cohere: support for Cohere models'
  'python-google-generativeai: support for Google Gemini models'
  'python-writerai: Writer authenticates your API requests using your account’s API keys.'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('99e630ba98ff29e15d6ccea30742743560b829f45870ae3261861e3d047b8156')

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
    --ignore tests/test_multimodal.py \
    --ignore tests/llm/test_openai \
    --ignore tests/llm/test_vertexai \
    --ignore tests/llm/test_fireworks \
    --ignore tests/llm/test_gemini \
    --ignore tests/llm/test_writer \
    --deselect tests/dsl/test_partial.py \
    --deselect tests/llm/test_anthropic/evals/test_simple.py \
    --deselect tests/llm/test_anthropic/test_stream.py \
    --deselect tests/llm/test_anthropic/test_system.py \
    --deselect tests/llm/test_cohere \
    --deselect tests/llm/test_new_client.py \
    --deselect tests/test_simple_types.py::test_partial_not_simple \
    --deselect tests/llm/test_anthropic/test_multimodal.py \
    --deselect tests/test_response_model_conversion.py::test_json_preserves_description_of_non_english_characters_in_json_mode \
    --deselect tests/llm/test_anthropic/test_reasoning.py \
    --deselect tests/llm/test_perplexity/test_modes.py \
    --deselect tests/llm/test_mistral/test_retries.py \
    --deselect tests/llm/test_mistral/test_modes.py \
    --deselect tests/llm/test_genai/test_stream.py \
    --deselect tests/llm/test_genai/test_simple.py \
    --deselect tests/llm/test_genai/test_retries.py \
    --deselect tests/llm/test_genai/test_multimodal.py \
    --deselect tests/llm/test_genai/test_format.py \
    --deselect tests/llm/test_genai/test_long_prompt.py \
    --deselect tests/llm/test_mistral/test_stream.py
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
# vim:set ts=2 sw=2 et:
