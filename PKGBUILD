# Maintainer: Premysl Srubar <premysl.srubar[äT]gmail(.)com>
# Contributor: envolution
# Contributor: txtsd <aur.archlinux@ihavea.quest>
_pkgname=llama-cpp-python
_verprefix=0.3.16
pkgname=python-llama-cpp-cuda-git
pkgrel=1
pkgver=0.3.16.r2070.8dcdbd2
pkgdesc="Python bindings for llama.cpp (git version with CUDA support)"
arch=(x86_64)
provides=(python-llama-cpp python-llama-cpp-cuda)
conflicts=(python-llama-cpp python-llama-cpp-cuda)
url="https://github.com/inference-sh/llama-cpp-python"
license=(MIT)
depends=(
  python-typing_extensions
  python-numpy
  python-diskcache
  cuda
  nvidia-utils
  python-transformers
  python-jinja
  python-huggingface-hub
  python-requests
  python-openai
)
optdepends=(
  uvicorn # python-uvicorn
  python-fastapi
  python-pydantic-settings
  python-sse-starlette
  python-pyaml
)
makedepends=(
  git
  python-scikit-build
  python-installer
  python-build
  python-wheel
  python-scikit-build-core
  gcc14
)
checkdepends=(
  python-pytest
  python-huggingface-hub
  python-scipy
  python-httpx
  python-fastapi
  python-sse-starlette
  #python-sse-starlette-context #missing but tests don't seem to require it
  python-pydantic-settings
)
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "%s.r%s.%s" "$_verprefix" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$_pkgname"
  git submodule update --init --recursive
}

build() {
  cd "$_pkgname"
  PREFIX=/usr

  
  CMAKE_ARGS="-DGGML_CUDA=on -DCUDAToolkit_ROOT=/opt/cuda -DCMAKE_CUDA_ARCHITECTURES=native" \
    NVCC_CCBIN='gcc-14' \
    python -m build --wheel --no-isolation
}

check() {
  cd "$_pkgname"
  #python -m pytest
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
}
