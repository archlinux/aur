# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=google-genai
pkgname=python-$_name
pkgver=1.49.0
pkgrel=1
pkgdesc="GenAI Python SDK."
arch=('any')
url='https://github.com/googleapis/python-genai'
license=('Apache-2.0')
depends=('python' 'python-anyio' 'python-google-auth' 'python-httpx' 'python-pydantic' 'python-requests' 'python-tenacity' 'python-websockets' 'python-typing_extensions')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-certifi' 'python-pillow' 'python-pytest' 'python-pytest-asyncio' 'python-mcp' 'python-aiohttp' 'python-sentencepiece' 'python-protobuf')
optdepends=('python-aiohttp: aiohttp' 'python-sentencepiece: local-tokenizer' 'python-protobuf: local-tokenizer')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('83e63ae5101a783b4dbba6eb69bc42f65d8bba598f11906c308f7637bf891590')

prepare(){
  cd "$srcdir"/${pkgname//google-/}-$pkgver
  sed -i 's/, "twine>=6.1.0", "packaging>=24.2", "pkginfo>=1.12.0"//g' pyproject.toml
}

build() {
  cd "$srcdir"/${pkgname//google-/}-$pkgver
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    -n auto
    --dist=loadscope
    # Need Gemini developer API or Vertex AI API
    --ignore google/genai/tests/batches
    --ignore google/genai/tests/caches
    --ignore google/genai/tests/files
    --ignore google/genai/tests/models
    --ignore google/genai/tests/tokens
    --ignore google/genai/tests/tunings
    --ignore google/genai/tests/local_tokenizer
    --ignore google/genai/tests/shared
    --ignore google/genai/tests/file_search_stores
    --deselect google/genai/tests/chats/test_send_message.py
    --deselect google/genai/tests/public_samples/test_gemini_text_only.py
    --deselect google/genai/tests/afc/test_generate_content_stream_afc_thoughts.py
    --deselect google/genai/tests/operations/test_get.py
  )
  cd "$srcdir"/${pkgname//google-/}-$pkgver
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" ${_name//-//}/tests
}

package() {
  cd "$srcdir"/${pkgname//google-/}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
