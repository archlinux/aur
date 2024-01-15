# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-outlines
_name=${pkgname#python-}
pkgver=0.0.24
pkgrel=2
pkgdesc="Guided text generation"
arch=(any)
url="https://github.com/outlines-dev/outlines"
license=(Apache-2.0)
depends=(
  python
  python-cloudpickle
  python-diskcache
  python-fastapi
  python-interegular
  python-jinja
  python-jsonschema
  python-lark
  python-nest-asyncio
  python-numba
  python-numpy
  python-openai
  python-pydantic
  python-pytorch
  python-referencing
  python-requests
  python-tiktoken
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
optdepends=(
  'python-llama-cpp: llama.cpp backend'
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz"
  "fix-package-discovery.patch"
)
sha256sums=(
  'b50e083a86e021edb6d32800ea0334250489980577880272b8c79df15b7e203e'
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

  _ignored_tests=(
    # Fails due to the following import error:
    #   ImportError: /usr/lib/python3.11/site-packages/tokenizers/tokenizers.cpython-311-x86_64-linux-gnu.so: undefined symbol: OnigDefaultSyntax
    tests/models/test_transformers.py
    tests/generate/test_integration_transfomers.py

    # Requires python-llama-cpp which I'm currently unable to install.
    tests/models/test_llama_cpp.py
  )
  _ignored_tests_arg=$(printf " --ignore=%s" "${_ignored_tests[@]}")

  _deselected_tests=(
    # Fails due to the following import error:
    #   ImportError: /usr/lib/python3.11/site-packages/tokenizers/tokenizers.cpython-311-x86_64-linux-gnu.so: undefined symbol: OnigDefaultSyntax
    tests/test_function.py::test_function_basic
    tests/fsm/test_regex.py::test_create_fsm_index_tokenizer
  )
  _deselected_tests_arg=$(printf " --deselect=%s" "${_deselected_tests[@]}")

  # shellcheck disable=SC2086
  pytest \
    $_ignored_tests_arg \
    $_deselected_tests_arg
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
