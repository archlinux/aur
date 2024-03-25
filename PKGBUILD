# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=python-outlines
_pkgname=${pkgname#python-}
pkgver=0.0.37
_commit=803439a83d15ea4fcc452e1c367ffb41feb39ac2
pkgrel=1
pkgdesc="Guided text generation"
arch=(any)
url="https://github.com/outlines-dev/outlines"
license=(Apache-2.0)
depends=(
  python
  python-cloudpickle
  python-datasets
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
  python-accelerate
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
sha256sums=('942957ed6a00e8ac4096c1524f093d77614b8f6e9e9d39c69ffb5f1028989cc2')
validpgpkeys=('968479A1AFF927E37D1A566BB5690EEEBB952194') # GitHub <noreply@github.com>

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

  rm -rf tmp_install
  python -m installer --destdir=tmp_install dist/*.whl

  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  export PYTHONPATH="$PWD/tmp_install/$site_packages"
  # Ignored test requires python-llama-cpp which I'm currently unable to
  # install.
  pytest \
    --ignore tests/models/test_llama_cpp.py \
    --ignore tests/generate/test_integration_llamacpp.py \
    --deselect tests/models/test_openai.py::test_openai_call
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
