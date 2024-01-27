# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-outlines
_pkgname=${pkgname#python-}
pkgver=0.0.25
_commit=c2b0f4fb188648b7a4d266132cb13f9108600178
pkgrel=1
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
  git
  python-build
  python-installer
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  python-pytest
  python-pytest-benchmark
  python-pytest-mock
  python-responses
)
optdepends=('python-llama-cpp: llama.cpp backend')

source=("git+$url.git#commit=$_commit")
sha256sums=('SKIP')

_archive="$_pkgname"

pkgver() {
  cd "$_archive"

  git describe --tags
}

build() {
  cd "$_archive"

  python -m build --wheel --no-isolation
}

check() {
  cd "$_archive"

  _ignored_tests=(
    # Fails due to the following import error:
    #   ImportError: /usr/lib/python3.11/site-packages/tokenizers/tokenizers.cpython-311-x86_64-linux-gnu.so: undefined symbol: OnigDefaultSyntax
    tests/benchmark/test_benchmark_json_schema.py
    tests/benchmark/test_benchmark_numba_compile.py
    tests/benchmark/test_benchmark_regex_fsm.py
    tests/generate/test_integration_transfomers.py
    tests/models/test_transformers.py

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

  rm -rf tmp_install
  _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m installer --destdir=tmp_install dist/*.whl

  export PYTHONPATH="$PWD/tmp_install/$_site_packages"
  # shellcheck disable=SC2086
  pytest \
    $_ignored_tests_arg \
    $_deselected_tests_arg
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
