# Maintainer: envolution
# Contributor: Carl Smedstad <carsme@archlinux.org>

pkgname=python-cohere
_pkgname=cohere-python
pkgver=5.12.0
pkgrel=2
pkgdesc="Python Library for Accessing the Cohere API"
arch=(any)
url="https://github.com/cohere-ai/cohere-python"
license=(MIT)
depends=(
  python
  python-boto3
  python-botocore
  python-fastavro
  python-httpx
  python-httpx-sse
  python-pydantic
  python-pydantic-core
  python-requests
  python-tokenizers
  python-typing_extensions
)
makedepends=(
  python-build
  python-installer
  python-poetry
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-asyncio
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d62b3f58a73e9d7ce17613b22b9a46049694f17a8b8e38473efc6ca6d30e4dbc')

build() {
  cd $_pkgname-$pkgver

  python -m build --wheel --no-isolation
}

check() {
  cd $_pkgname-$pkgver

  rm -rf tmp_install
  python -m installer --destdir=tmp_install dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages:$PYTHONPATH"
  # Only run tests that do not require a valid API key. The one below is a mock
  # one and is required for test collection.
  export CO_API_KEY=sk-dBAe8c5a9bc4294cca9bed292cd61e0ff9030bB94647adfb
  pytest \
    tests/test_async_client.py::TestClient::test_context_manager \
    tests/test_async_client.py::TestClient::test_deprecated_fn \
    tests/test_async_client.py::TestClient::test_moved_fn \
    tests/test_async_client.py::TestClient::test_stream_equals_true \
    tests/test_async_client.py::TestClient::test_token_falls_back_on_env_variable \
    tests/test_client.py::TestClient::test_context_manager \
    tests/test_client.py::TestClient::test_deprecated_fn \
    tests/test_client.py::TestClient::test_moved_fn \
    tests/test_client.py::TestClient::test_stream_equals_true \
    tests/test_client.py::TestClient::test_token_falls_back_on_env_variable \
    tests/test_embed_utils.py::TestClient::test_merge_embeddings_by_type \
    tests/test_embed_utils.py::TestClient::test_merge_embeddings_floats \
    tests/test_embed_utils.py::TestClient::test_merge_partial_embeddings_floats
}

package() {
  cd $_pkgname-$pkgver

  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
