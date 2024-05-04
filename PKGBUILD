# Maintainer: Carl Smedstad <carsme@archlinux.org>

pkgname=python-outlines
_pkgname=${pkgname#python-}
pkgver=0.0.41
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
  python-pytest-mock
  python-responses
)
optdepends=(
  # 'python-vllm: deploy as LLM service' # Not packaged yet
  'python-fastapi: deploy as LLM service'
  'uvicorn: deploy as LLM service'
  'python-llama-cpp: llama.cpp backend'
)
source=("git+$url.git#tag=$pkgver")
sha256sums=('53d82a340edfaf0a066bfe74158dea1fab60a8124168ee4ba3e25ad22b73bee0')
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
  # Ignored test requires python-llama-cpp (which I'm currently unable to
  # install) and vllm which is not yet packaged.
  pytest \
    --deselect tests/benchmark \
    --deselect tests/models/test_openai.py::test_openai_call \
    --ignore tests/generate/test_integration_llamacpp.py \
    --ignore tests/generate/test_integration_vllm.py \
    --ignore tests/models/test_llama_cpp.py \
    --pythonwarnings ignore::FutureWarning
}

package() {
  cd "$_archive"

  python -m installer --destdir="$pkgdir" dist/*.whl
}
