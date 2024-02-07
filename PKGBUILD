# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-outlines
_pkgname=${pkgname#python-}
pkgver=0.0.27
_commit=1626ceaeb0611dd0c4439948072577ca05152f6e
pkgrel=1
pkgdesc="Guided text generation"
arch=(any)
url="https://github.com/outlines-dev/outlines"
license=(Apache-2.0)
depends=(
  python
  python-cloudpickle
  python-diskcache
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
optdepends=(
  # 'python-vllm: deploy as LLM service' # Not packaged yet
  'python-fastapi: deploy as LLM service'
  'uvicorn: deploy as LLM service'
  'python-llama-cpp: llama.cpp backend'
)

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

  local ignored_tests=(
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
  local ignored_tests_arg=$(printf " --ignore=%s" "${ignored_tests[@]}")

  local deselected_tests=(
    # Fails due to the following import error:
    #   ImportError: /usr/lib/python3.11/site-packages/tokenizers/tokenizers.cpython-311-x86_64-linux-gnu.so: undefined symbol: OnigDefaultSyntax
    tests/test_function.py::test_function_basic
    tests/fsm/test_regex.py::test_create_fsm_index_tokenizer
  )
  local deselected_tests_arg=$(printf " --deselect=%s" "${deselected_tests[@]}")

  rm -rf tmp_install
  python -m installer --destdir=tmp_install dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  # shellcheck disable=SC2086
  pytest \
    $ignored_tests_arg \
    $deselected_tests_arg
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
