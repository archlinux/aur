# shellcheck shell=bash disable=SC2034,SC2154
# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: Wu Zhenyu <wuzhenyu@ustc.edu>
_pkgname=torchao
pkgname=python-$_pkgname
pkgver=0.18.0
pkgrel=1
pkgdesc='PyTorch architecture optimization and quantization library'
arch=('x86_64')
url='https://github.com/pytorch/ao'
license=('BSD-3-Clause')
options=('!debug')
depends=(
  'glibc'
  'libgcc'
  'libstdc++'
  'python'
  'python-pytorch>=2.11'
  'python-typing_extensions'
)
makedepends=(
  'google-glog'
  'libgomp'
  'ninja'
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'python-expecttest'
  'python-hypothesis'
  'python-numpy'
  'python-packaging'
  'python-parameterized'
  'python-pytest'
  'python-pytest-xdist'
  'python-sentencepiece'
  'python-tiktoken'
  'python-yaml'
)
optdepends=(
  'python-blobfile: distributed checkpoint and model utilities'
  'python-fire: prototype command-line tools'
  'python-matplotlib: visualization utilities'
  'python-numpy: model and prototype utilities'
  'python-pandas: model evaluation utilities'
  'python-pytest: torchao.testing utilities and bundled prototype test helpers'
  'python-safetensors: safetensors quantization support'
  'python-scipy: SAM model utilities'
  'python-sentencepiece: tokenizer integration'
  'python-tabulate: tabular reporting'
  'python-tiktoken: tokenizer integration'
  'python-torchvision: bundled SAM model support'
  'python-tqdm: model evaluation progress reporting'
  'python-transformers: Hugging Face model integrations'
  'python-triton: Triton kernels'
  'python-yaml: experimental MPS shader code generation'
)
_cutlass_commit=e51efbfe18fe4f4cbb66ab814c55bf4aa0185491
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "cutlass-$_cutlass_commit.tar.gz::https://github.com/NVIDIA/cutlass/archive/$_cutlass_commit.tar.gz"
  'Exclude-test-suite-from-wheel.patch'
  'Build-portable-CPU-kernels.patch'
)
sha256sums=(
  '7b91e1a96cecb891e11f925ebaf93fd6b6b7dab52594f3b683338f8ecedbebf4'
  '1fc686a38edacbb5b7416c2835efb6801d2a583a7942bb5b78ac6f4999cd73a1'
  '1589d42e5c8c4d992d7a2247c3da14f77cc7828697c9a691be6f05acc26b0f1f'
  '8ada853f6956591cf9860e25d577a8d39e362323c94a06d23a22f05c55043e5c'
)

prepare() {
  cd "ao-$pkgver"
  rm -rf third_party/cutlass
  cp -a "$srcdir/cutlass-$_cutlass_commit" third_party/cutlass
  patch -Np1 --fuzz=0 -i "$srcdir/Exclude-test-suite-from-wheel.patch"
  patch -Np1 --fuzz=0 -i "$srcdir/Build-portable-CPU-kernels.patch"
  # These tests intentionally invoke quantizers that set recommended global
  # precision flags. PyTorch 2.14 requires tests to restore those flags before
  # tearDown; use its own restoration decorator, keeping the leak check active.
  sed -i '/^    def test_dynamic_quant_gpu_singleline(/i\    @common_utils.recover_orig_fp32_precision' \
    test/quantization/test_quant_api.py
}

build() {
  cd "ao-$pkgver"
  export VERSION_SUFFIX=''
  export USE_CPP=1
  export USE_CPU_KERNELS=1
  python -m build --wheel --no-isolation
}

check() {
  local _source_dir="$srcdir/ao-$pkgver"
  local _test_dir="$srcdir/test-work"
  local _test_venv="$srcdir/test-venv"

  rm -rf "$_test_dir" "$_test_venv"
  cp -a "$_source_dir/test" "$_test_dir"
  python -m venv --system-site-packages "$_test_venv"
  "$_test_venv/bin/python" -m installer "$_source_dir"/dist/*.whl
  cd "$_test_dir"
  CUDA_VISIBLE_DEVICES='' PYTHONDONTWRITEBYTECODE=1 \
    "$_test_venv/bin/python" -m pytest -vv -n auto \
      core \
      dtypes/test_bitpacking.py \
      quantization/test_observer.py \
      quantization/test_qat.py \
      quantization/test_quant_api.py \
      quantization/test_quant_primitives.py \
      quantization/quantize_/workflows/int4 \
      quantization/quantize_/workflows/int8 \
      quantization/quantize_/workflows/intx \
      sparsity/test_sparse_api.py \
      sparsity/test_supermask.py \
      test_low_bit_optim.py \
      test_ops.py \
      test_utils.py

  CUDA_VISIBLE_DEVICES='' PYTHONDONTWRITEBYTECODE=1 \
    "$_test_venv/bin/python" - <<'PY'
import torch
import torchao
from torchao.quantization import Int8WeightOnlyConfig, quantize_

model = torch.nn.Sequential(
    torch.nn.Linear(8, 16),
    torch.nn.ReLU(),
    torch.nn.Linear(16, 4),
).eval()
quantize_(model, Int8WeightOnlyConfig())
output = model(torch.randn(3, 8))
assert output.shape == (3, 4)
assert torch.isfinite(output).all()
assert torchao.__version__ == "0.18.0"
PY
}

package() {
  cd "ao-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
