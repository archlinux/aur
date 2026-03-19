# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=sglang-git
_pkgname=sglang
pkgver=r0
pkgrel=2
pkgdesc='A fast serving framework for large language models and vision language models'
arch=('any')
url='https://github.com/sgl-project/sglang'
license=('Apache-2.0')
depends=(
  'python>=3.10'
  'python-aiohttp'
  'python-numpy'
  'python-pybase64'
  'python-partial-json-parser'
  'python-pydantic'
  'python-requests'
  'python-pytorch'
  'python-safetensors'
  'python-sgl-kernel'
  'python-torchvision'
  'python-transformers'
  'python-triton'
  'python-setproctitle'
  'python-tqdm'
  'python-orjson'
  'python-compressed-tensors'
  'python-gguf'
  'python-msgspec'
  'python-einops'
  'ipython'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-setuptools-scm'
  'git'
)
optdepends=(
  'python-anthropic: Anthropic API backend'
  'python-datasets: Dataset loading'
  'python-fastapi: API server'
  'python-grpcio: gRPC support'
  'python-huggingface-hub: Model hub access'
  'python-modelscope: ModelScope model hub'
  'ninja: Build system for JIT compilation'
  'python-openai: OpenAI-compatible API'
  'python-outlines: Structured generation'
  'python-packaging: Version utilities'
  'python-pillow: Image processing'
  'python-psutil: Process monitoring'
  'python-python-multipart: Multipart form parsing'
  'python-pyzmq: ZeroMQ messaging'
  'python-scipy: Scientific computing'
  'python-sentencepiece: Tokenization'
  'python-soundfile: Audio file support'
  'python-tiktoken: OpenAI tokenizer'
  'python-timm: Vision model library'
  'uvicorn: ASGI server'
  'python-uvloop: Fast event loop'
)
provides=('sglang')
conflicts=('sglang')
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}/python"
  cp pyproject_other.toml pyproject.toml
  rm -rf build dist *.egg-info
  # Use latest upstream tag for Python version (pkgver format isn't PEP 440)
  export SETUPTOOLS_SCM_PRETEND_VERSION="$(git describe --tags --abbrev=0 | sed 's/^v//')"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}/python"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
