# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-outlines
_name=${pkgname#python-}
pkgver=0.0.22
pkgrel=1
pkgdesc="Guided text generation"
arch=(any)
url="https://github.com/outlines-dev/outlines"
license=(Apache)
depends=(
  python
  python-fastapi
  python-interegular
  python-jinja
  python-jsonschema
  python-lark
  python-nest-asyncio
  python-numba
  python-numpy
  python-openai
  python-perscache
  python-pydantic
  python-pytorch
  python-referencing
  python-requests
  python-transformers
)
makedepends=(
  python-build
  python-installer
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-pytest
  python-responses
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  "fix-package-discovery.patch"
)
sha256sums=(
  '8e8746d38f1e18863fdba147bceb04f96ea9bc2b751f6621d137b4979f70b6b3'
  '9140b5e8436f3f75b02f74f6dabb3862f21e93e16c87e6d9a9e6209ec53a8756'
)

_archive="$_name-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/fix-package-discovery.patch"
}

build() {
  cd "$_archive"

  export SETUPTOOLS_SCM_PRETEND_VERSION="$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  # Tests fail due to the following import error:
  #   ImportError: /usr/lib/python3.11/site-packages/tokenizers/tokenizers.cpython-311-x86_64-linux-gnu.so: undefined symbol: OnigDefaultSyntax
  pytest \
    --ignore tests/models/test_llama_cpp.py \
    --ignore tests/models/test_transformers.py \
    --ignore tests/generate/test_integration_transfomers.py \
    --deselect tests/test_function.py::test_function_basic \
    --deselect tests/fsm/test_regex.py::test_create_fsm_index_tokenizer
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
