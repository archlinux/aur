# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=sglang-git
_pkgname=sglang
pkgver=r11993.d773133086
pkgrel=1
pkgdesc='A fast serving framework for large language models and vision language models'
arch=('x86_64')
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
  'python-sgl-kernel-git'
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
  'python-soundfile'
  'python-xgrammar'
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
  'python-multipart: Multipart form parsing'
  'python-pyzmq: ZeroMQ messaging'
  'python-scipy: Scientific computing'
  'python-sentencepiece: Tokenization'
  'python-soundfile: Audio file support'
  'python-tiktoken: OpenAI tokenizer'
  'python-tilelang: DeepSeek V4 model support'
  'python-timm: Vision model library'
  'uvicorn: ASGI server'
  'python-uvloop: Fast event loop'
)
provides=('sglang')
conflicts=('sglang')

_models=(
  'gemma_4_e2b'
  'gemma_4_e4b'
  'gemma_4_26b_a4b'
  'gemma_4_31b'
  'qwen3.5_0.8b'
  'qwen3.5_2b'
  'qwen3.5_4b'
  'qwen3.5_9b'
  'qwen3.5_27b'
  'qwen3.5_27b_fp8'
  'qwen3.5_27b_gptq_int4'
  'qwen3.5_35b_a3b'
  'qwen3.5_35b_a3b_fp8'
  'qwen3.5_35b_a3b_gptq_int4'
  'qwen3.5_122b_a10b'
  'qwen3.5_122b_a10b_fp8'
  'qwen3.5_122b_a10b_gptq_int4'
  'qwen3.5_397b_a17b'
  'qwen3.5_397b_a17b_fp8'
  'qwen3.5_397b_a17b_gptq_int4'
)

backup=('etc/sglang/sglang.conf' 'etc/sglang/sglang.env')
source=("${_pkgname}::git+https://github.com/sgl-project/sglang.git#branch=amd/deepseek_v4"
        'sglang@.service'
        'sglang.conf'
        'sglang.env'
        'sglang.sysusers'
        "${_models[@]/%/.conf}")
sha256sums=('SKIP')
for _ in 'sglang@.service' 'sglang.conf' 'sglang.env' 'sglang.sysusers' "${_models[@]}"; do
  sha256sums+=('SKIP')
done

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_pkgname}/python"
  cp pyproject_other.toml pyproject.toml
  rm -rf build dist *.egg-info
  # Use latest upstream tag for Python version (pkgver format isn't PEP 440)
  export SETUPTOOLS_SCM_PRETEND_VERSION="$(git tag -l 'v[0-9]*' --sort=-v:refname | head -1 | sed 's/^v//')"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}/python"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "${srcdir}/sglang@.service" "${pkgdir}/usr/lib/systemd/system/sglang@.service"
  install -Dm644 "${srcdir}/sglang.sysusers" "${pkgdir}/usr/lib/sysusers.d/sglang.conf"
  install -Dm644 "${srcdir}/sglang.conf" "${pkgdir}/etc/sglang/sglang.conf"
  install -Dm600 "${srcdir}/sglang.env" "${pkgdir}/etc/sglang/sglang.env"
  for model in "${_models[@]}"; do
    install -Dm644 "${srcdir}/${model}.conf" "${pkgdir}/etc/sglang/${model}.conf"
  done
}
