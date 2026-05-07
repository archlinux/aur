# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=sglang-git
_pkgname=sglang
pkgver=r12426.0588e9044
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
  'python-fastapi'
  'python-starlette'
  'python-openai'
  'python-huggingface-hub'
  'python-pillow'
  'python-packaging'
  'python-psutil'
  'python-scipy'
  'python-sentencepiece'
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
  'git'
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
conflicts=('sglang')

_models=(
  'deepseek_v4_flash'
  'gemma_4_e2b'
  'gemma_4_e4b'
  'gemma_4_26b_a4b'
  'gemma_4_26b_a4b_fp8'
  'gemma_4_26b_a4b_nvfp4'
  'gemma_4_31b'
  'gemma_4_31b_fp8'
  'gemma_4_31b_nvfp4'
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
  'qwen3.6_27b_nvfp4'
  'qwen3.6_35b_a3b'
  'qwen3.6_35b_a3b_fp8'
  'qwen3.6_35b_a3b_awq_int4'
  'qwen3.6_35b_a3b_gptq_int4'
  'qwen3.6_35b_a3b_autoround_int4'
  'qwen3.6_35b_a3b_nvfp4'
)

# Mark every shipped conf as backup so pacman preserves user edits and
# emits .pacnew on package-side changes instead of silently overwriting.
backup=('etc/sglang/sglang.conf' 'etc/sglang/sglang.env')
for _m in "${_models[@]}"; do
  backup+=("etc/sglang/${_m}.conf")
done
source=("${_pkgname}::git+https://github.com/williamjameshandley/sglang.git#branch=wjh/v4-flash-mxfp4-routed-experts"
        'sglang@.service'
        'sglang.conf'
        'sglang.env'
        'sglang.sysusers'
        'deepseek_v4.jinja'
        "${_models[@]/%/.conf}")
sha256sums=('SKIP')
for _ in 'sglang@.service' 'sglang.conf' 'sglang.env' 'sglang.sysusers' 'deepseek_v4.jinja' "${_models[@]}"; do
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
  # Workaround: deepseek-ai/DeepSeek-V4-Flash ships tokenizer_config.json
  # without a chat_template field, and sglang has no built-in deepseek-v4
  # template. Lifted from DeepSeek-V3.2-Exp, which uses the same special
  # tokens. Remove once upstream ships a chat_template for V4-Flash.
  install -Dm644 "${srcdir}/deepseek_v4.jinja" "${pkgdir}/etc/sglang/deepseek_v4.jinja"
}
