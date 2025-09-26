# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=google-genai
pkgname=python-$_name
pkgver=1.39.0
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
sha256sums=('e6f866566a21bf17f1b34f97ae46ec13692a1e756c4a4cece50af47739dcbc87')

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
    --ignore google/genai/tests/batches/test_create_with_bigquery.py
    --ignore google/genai/tests/batches/test_create_with_file.py
    --ignore google/genai/tests/batches/test_create_with_gcs.py
    --ignore google/genai/tests/batches/test_create_with_inlined_requests.py
    --ignore google/genai/tests/models/test_recontext_image.py
    --ignore google/genai/tests/models/test_segment_image.py
    --ignore google/genai/tests/tunings/test_cancel.py
    --ignore google/genai/tests/local_tokenizer/test_local_tokenizer.py
    --ignore google/genai/tests/local_tokenizer/test_local_tokenizer_loader.py
    --ignore google/genai/tests/shared/batches/test_create_delete.py
    --ignore google/genai/tests/shared/batches/test_create_get_cancel.py
    --ignore google/genai/tests/shared/batches/test_list.py
    --ignore google/genai/tests/shared/caches/test_create_delete.py
    --ignore google/genai/tests/shared/caches/test_create_update_get.py
    --ignore google/genai/tests/shared/caches/test_list.py
    --ignore google/genai/tests/shared/chats/test_send_message.py
    --ignore google/genai/tests/shared/chats/test_send_message_stream.py
    --ignore google/genai/tests/shared/files/test_list.py
    --ignore google/genai/tests/shared/files/test_upload_get_delete.py
    --ignore google/genai/tests/shared/models/test_compute_tokens.py
    --ignore google/genai/tests/shared/models/test_count_tokens.py
    --ignore google/genai/tests/shared/models/test_edit_image.py
    --ignore google/genai/tests/shared/models/test_embed.py
    --ignore google/genai/tests/shared/models/test_generate_content.py
    --ignore google/genai/tests/shared/models/test_generate_content_stream.py
    --ignore google/genai/tests/shared/models/test_generate_images.py
    --ignore google/genai/tests/shared/models/test_generate_videos.py
    --ignore google/genai/tests/shared/models/test_list.py
    --ignore google/genai/tests/shared/models/test_recontext_image.py
    --ignore google/genai/tests/shared/models/test_segment_image.py
    --ignore google/genai/tests/shared/models/test_upscale_image.py
    --ignore google/genai/tests/shared/tunings/test_create.py
    --ignore google/genai/tests/shared/tunings/test_create_get_cancel.py
    --ignore google/genai/tests/shared/tunings/test_list.py
    --deselect google/genai/tests/chats/test_send_message.py
    --deselect google/genai/tests/files/test_upload.py
    --deselect google/genai/tests/public_samples/test_gemini_text_only.py
    --deselect google/genai/tests/models/test_generate_content_mcp.py
    --deselect google/genai/tests/models/test_generate_content_from_apikey.py
    --deselect google/genai/tests/files/test_download.py
    --deselect google/genai/tests/tunings/test_end_to_end.py
    --deselect google/genai/tests/afc/test_generate_content_stream_afc_thoughts.py
    --deselect google/genai/tests/batches/test_embedding.py
    --deselect google/genai/tests/operations/test_get.py
  )
  cd "$srcdir"/${pkgname//google-/}-$pkgver
  PYTHONPATH=$PWD pytest "${pytest_options[@]}" ${_name//-//}/tests
}

package() {
  cd "$srcdir"/${pkgname//google-/}-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
}
