# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: envolution
# Contributor: Carl Smedstad <carsme@archlinux.org>

pkgname=python-cohere
pkgdesc='Python Library for Accessing the Cohere API'
pkgver=7.1.1
_commit=953f5a198de356fdf773e33f5a7be8cfc2d7a947 # only released via PyPI
pkgrel=1
url='https://github.com/cohere-ai/cohere-python'
arch=(any)
license=('MIT')
checkdepends=(
  'python-pytest'
  'python-pytest-asyncio'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-poetry'
  'python-wheel'
)
depends=(
  'python'
  'python-fastavro'
  'python-httpx'
  'python-pydantic'
  'python-pydantic-core'
  'python-requests'
  'python-tokenizers'
  'python-typing_extensions'
)
optdepends=(
  'python-httpx-aiohttp: aiohttp client'
  'python-oci: Oracle Cloud Infrastructure client'
  'python-boto3: AWS client'
  'python-botocore: AWS client'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_commit}.tar.gz")
b2sums=('dbb90cce9ae1fb3311f1c48e43161572c37111d8c8838749a8a960e4a75db12d6874d3739c51b0f21525b0ec4663d66f381ba56d461cc774960f58a257361b69')

build() {
  cd "cohere-python-${_commit}"

  python -m build --wheel --no-isolation
}

check() {
  cd "cohere-python-${_commit}"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl

  # Only run tests that do not require a valid API key. The one below is a mock
  # one and is required for test collection.
  export CO_API_KEY=sk-dBAe8c5a9bc4294cca9bed292cd61e0ff9030bB94647adfb
  test-env/bin/python -P -m pytest \
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
  cd "cohere-python-${_commit}"

  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -vD -t "${pkgdir}/usr/share/licenses/${pkgname}/" -m644 LICENSE
}
