# Maintainer: ncihnegn
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-vllm-cuda
_pkgname=vllm
pkgver=0.19.0
pkgrel=2
pkgdesc="high-throughput and memory-efficient inference and serving engine for LLMs"
arch=('x86_64')
url='https://github.com/vllm-project/vllm'
license=(Apache-2.0)
provides=(python-vllm)
conflicts=(python-vllm)
# To be reviewed.
depends=(
  numactl
  python-aiohttp
  python-blake3
  python-boto3
  python-cachetools
  python-cloudpickle
  python-diskcache
  python-einops
  python-fastapi
  python-gguf
  python-huggingface-hub
  python-ijson
  python-importlib-metadata
  python-model-hosting-container-standards
  python-msgspec
  python-openai
  python-openai-harmony
  python-opencv
  python-partial-json-parser
  python-prometheus-fastapi-instrumentator
  python-psutil
  python-pybase64
  python-py-cpuinfo
  python-pydantic
  python-pytorch
  python-pyzmq
  python-soundfile
  python-sphinx
  python-starlette
  python-sympy
  python-torchvision
  python-tqdm
  python-transformers
  python-triton
  python-uvloop
  python-watchfiles
  uvicorn
)
makedepends=(
  cmake
  cuda
  gcc
  git
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
)

# To be reviewed.
optdepends=(
  'python-datasets: tools to benchmark scripts'
  'python-compressed-tensors: required to load compressed tensor files'
  'python-lark: parsing toolkit'
  'python-mistral-common: mistral tools for opencv'
  'python-msgspec: JSON/MessagePack library with validation'
  'python-outlines: guided text generation'
  'python-pillow: required for image processing'
  'python-prometheus_client: Prometheus instrumentation library for Python applications'
  'python-torchaudio: required for image processor of minicpm-o-2.6'
  'python-tiktoken: required for DBRX tokenizer'
  'python-typing_extensions: typing hints'
  'python-xgrammar: flexible structured generation'
)

source=(
  "git+${url}#tag=v${pkgver}"
  "121.patch"
  "34770.patch"
)
sha256sums=(
  '815859b4cd87081b7b100c041de29e1c5c0b74547f4c7da21e075cfe38f52f4f'
  '41d19b77ca787dfabb4754141981780e6c761e63235fbcda7726c96535f83132'
  'b7616c4c911e85cb8aa8791e5b41317714d32e34fc9aef7ac847260aec0ad5d9'
)

prepare() {
  cd $_pkgname
  patch -Np1 -i ${srcdir}/34770.patch
  cd .deps/vllm-flash-attn-src
  git checkout .
  patch -Np1 -i ${srcdir}/121.patch
}

build() {
  cd $_pkgname

  export VLLM_TARGET_DEVICE=cuda
  # Please choose only what are suitable for your GPU(s).
  export TORCH_CUDA_ARCH_LIST="7.5 8.0 8.6 8.7 8.9 9.0 10.0 10.3 11.0 12.0 12.1"

  # Build
  python setup.py bdist_wheel --dist-dir=dist
}

package() {
  cd $_pkgname
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vim:set ts=2 sw=2 et:
