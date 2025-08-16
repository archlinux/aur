# Maintainer: envolution
# Contributor: Wu Zhenyu <wuzhenyu@ustc.edu>
# shellcheck shell=bash disable=SC2034,SC2154

_pkgname=llama-cpp-python
pkgname=python-llama-cpp-cuda
pkgver=0.3.16
pkgrel=1
pkgdesc="Python bindings for llama.cpp"
arch=(x86_64)
provides=(python-llama-cpp)
conflicts=(python-llama-cpp)
url=https://github.com/abetlen/llama-cpp-python
license=(GPL-3.0-or-later)
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
source=("https://files.pythonhosted.org/packages/source/${_pkgname:0:1}/$_pkgname/${_pkgname//-/_}-$pkgver.tar.gz")
sha256sums=('34ed0f9bd9431af045bb63d9324ae620ad0536653740e9bb163a2e1fcb973be6')

_srcdir="llama_cpp_python-${pkgver}"
build() {
  cd $_srcdir
  PREFIX=/usr

  CMAKE_ARGS="-DGGML_CUDA=on -DCUDAToolkit_ROOT=/opt/cuda -DCMAKE_CUDA_COMPILER=/opt/cuda/bin/nvcc" \
    NVCC_CCBIN='gcc-14' \
    python -m build --wheel --no-isolation
}

check() {
  cd $_srcdir
  python -m pytest
}

package() {
  local _sys_site=$(python -c "import sysconfig; print(sysconfig.get_paths()['purelib'])")
  cd $_srcdir
  python -m installer --destdir="$pkgdir" dist/*.whl
  rm -r "$pkgdir/$_sys_site"/{lib,bin,include}
}

# vim:set ts=2 sw=2 et:
