# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=google-genai
pkgname=python-${_name}
pkgver=1.25.0
pkgrel=1
pkgdesc="GenAI Python SDK."
arch=('any')
url='https://github.com/googleapis/python-genai'
license=('Apache-2.0')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('27398af4e5ceae166e825f52f50a920a84e22336febe7f21e333c7c2dc91275d')
depends=('python' 'python-anyio' 'python-google-auth' 'python-httpx' 'python-pydantic' 'python-requests' 'python-tenacity' 'python-websockets' 'python-typing_extensions')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel' 'python-twine' 'python-packaging' 'python-pkginfo')
checkdepends=('python-certifi' 'python-pillow' 'python-pytest' 'python-pytest-asyncio' 'python-mcp' 'python-aiohttp')
optdepends=('python-aiohttp: aiohttp')

build() {
  cd "${srcdir}"/${pkgname//google-/}-${pkgver}
  python -m build --wheel --no-isolation
}

check() {
  local pytest_options=(
    -vv
    # Need Gemini developer API or Vertex AI API
    --ignore google/genai/tests/batches/test_cancel.py
    --ignore google/genai/tests/batches/test_create.py
    --ignore google/genai/tests/batches/test_delete.py
    --ignore google/genai/tests/batches/test_get.py
    --ignore google/genai/tests/batches/test_list.py
    --ignore google/genai/tests/caches/test_create.py
    --ignore google/genai/tests/caches/test_create_custom_url.py
    --ignore google/genai/tests/caches/test_delete.py
    --ignore google/genai/tests/caches/test_delete_custom_url.py
    --ignore google/genai/tests/caches/test_get.py
    --ignore google/genai/tests/caches/test_get_custom_url.py
    --ignore google/genai/tests/caches/test_list.py
    --ignore google/genai/tests/caches/test_update.py
    --ignore google/genai/tests/caches/test_update_custom_url.py
    --ignore google/genai/tests/files/test_delete.py
    --ignore google/genai/tests/files/test_get.py
    --ignore google/genai/tests/files/test_list.py
    --ignore google/genai/tests/models/test_compute_tokens.py
    --ignore google/genai/tests/models/test_count_tokens.py
    --ignore google/genai/tests/models/test_delete.py
    --ignore google/genai/tests/models/test_edit_image.py
    --ignore google/genai/tests/models/test_embed_content.py
    --ignore google/genai/tests/models/test_generate_content.py
    --ignore google/genai/tests/models/test_generate_content_cached_content.py
    --ignore google/genai/tests/models/test_generate_content_config_zero_value.py
    --ignore google/genai/tests/models/test_generate_content_http_options.py
    --ignore google/genai/tests/models/test_generate_content_media_resolution.py
    --ignore google/genai/tests/models/test_generate_content_model.py
    --ignore google/genai/tests/models/test_generate_content_part.py
    --ignore google/genai/tests/models/test_generate_content_thought.py
    --ignore google/genai/tests/models/test_generate_content_tools.py
    --ignore google/genai/tests/models/test_generate_images.py
    --ignore google/genai/tests/models/test_generate_videos.py
    --ignore google/genai/tests/models/test_get.py
    --ignore google/genai/tests/models/test_list.py
    --ignore google/genai/tests/models/test_update.py
    --ignore google/genai/tests/models/test_upscale_image.py
    --ignore google/genai/tests/tokens/test_create.py
    --ignore google/genai/tests/tunings/test_get.py
    --ignore google/genai/tests/tunings/test_list.py
    --ignore google/genai/tests/tunings/test_tune.py
    --deselect google/genai/tests/chats/test_send_message.py
    --deselect google/genai/tests/files/test_upload.py
    --deselect google/genai/tests/public_samples/test_gemini_text_only.py
    --deselect google/genai/tests/models/test_generate_content_mcp.py
    --deselect google/genai/tests/models/test_generate_content_from_apikey.py
    --deselect google/genai/tests/files/test_download.py
    --deselect google/genai/tests/tunings/test_end_to_end.py
    --deselect google/genai/tests/afc/test_generate_content_stream_afc_thoughts.py
  )
  cd "${srcdir}"/${pkgname//google-/}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest "${pytest_options[@]}" ${_name//-//}/tests
}

package() {
  cd "${srcdir}"/${pkgname//google-/}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
}
