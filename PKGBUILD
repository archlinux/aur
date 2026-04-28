# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=sglang
pkgver=0.5.10.post1
pkgrel=4
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
  'python-xgrammar'
  'ipython'
  'python-fastapi'
  'python-starlette'
  'python-openai'
  'python-huggingface-hub'
  'python-pillow'
  'python-packaging'
  'python-psutil'
  'python-scipy'
  'python-sentencepiece'
  'python-soundfile'
  'python-pyzmq'
  'python-python-multipart'
  'uvicorn'
  'python-flashinfer'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
  'python-setuptools-scm'
)
optdepends=(
  'python-anthropic: Anthropic API backend'
  'python-datasets: Dataset loading'
  'python-grpcio: gRPC support'
  'python-modelscope: ModelScope model hub'
  'ninja: Build system for JIT compilation'
  'python-outlines: Structured generation'
  'python-tiktoken: OpenAI tokenizer'
  'python-tilelang: DeepSeek V4 model support'
  'python-timm: Vision model library'
  'python-uvloop: Fast event loop'
)
provides=('sglang')
conflicts=('sglang-git')

_models=(
  'gemma_4_e2b'
  'gemma_4_e4b'
  'gemma_4_26b_a4b'
  'gemma_4_31b'
  'gemma_4_31b_fp8'
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
  'qwen3.6_27b'
  'qwen3.6_27b_fp8'
  'qwen3.6_27b_awq_int4'
  'qwen3.6_27b_gptq_int4'
  'qwen3.6_27b_autoround_int4'
  'qwen3.6_35b_a3b'
  'qwen3.6_35b_a3b_fp8'
  'qwen3.6_35b_a3b_nvfp4'
)

backup=('etc/sglang/sglang.conf' 'etc/sglang/sglang.env')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
        'sglang@.service'
        'sglang.conf'
        'sglang.env'
        'sglang.sysusers'
        "${_models[@]/%/.conf}")
sha256sums=('2080e7d8802094ae2b92dead1c6788b7aa2a2ccd06d8ba221bbc5b43d4cb7786')
for _ in 'sglang@.service' 'sglang.conf' 'sglang.env' 'sglang.sysusers' "${_models[@]}"; do
  sha256sums+=('SKIP')
done

build() {
  cd "${pkgname}-${pkgver}/python"
  cp pyproject_other.toml pyproject.toml
  rm -rf build dist *.egg-info
  export SETUPTOOLS_SCM_PRETEND_VERSION="${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}/python"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 "${srcdir}/sglang@.service" "${pkgdir}/usr/lib/systemd/system/sglang@.service"
  install -Dm644 "${srcdir}/sglang.sysusers" "${pkgdir}/usr/lib/sysusers.d/sglang.conf"
  install -Dm644 "${srcdir}/sglang.conf" "${pkgdir}/etc/sglang/sglang.conf"
  install -Dm600 "${srcdir}/sglang.env" "${pkgdir}/etc/sglang/sglang.env"
  for model in "${_models[@]}"; do
    install -Dm644 "${srcdir}/${model}.conf" "${pkgdir}/etc/sglang/${model}.conf"
  done
}
