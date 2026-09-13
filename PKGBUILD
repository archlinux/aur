# Maintainer: Smoolak <smoolak@gmail.com>
# Contributor: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-compressed-tensors
_pkgname=compressed-tensors
pkgver=0.18.0
pkgrel=1
pkgdesc="versatile and efficient way to store and manage compressed tensor data"
arch=('any')
url='https://github.com/neuralmagic/compressed-tensors'
license=(Apache-2.0)
depends=(
  python
  python-huggingface-hub
  python-loguru
  python-numpy
  python-psutil
  python-pydantic
  'python-pytorch>=2.10'
  python-safetensors
  python-tqdm
  'python-transformers>=4.45'
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-setuptools-scm
  python-wheel
)
checkdepends=(
  jupyter-nbconvert
  jupyter-nbformat
  python-accelerate
  python-pytest
)
optdepends=(
  'python-accelerate: interoperability with Accelerate model offloading'
)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/neuralmagic/compressed-tensors/archive/refs/tags/${pkgver}.tar.gz"
  cpu-only-test-suite.patch
  initialize-qparams-deterministically.patch
)
sha256sums=(
  'c12f758ecabfb5f5311882534e8741fbbfd5c1aceb17d988f66daf131ce6cfe1'
  'd1da8acf16a9eb8ef6dbaf04ff9ad5d9c9538ae5f2bad0a9bbadd58a248185a7'
  'ea707e9f5fec80bc51d9ef6706c29103993d0089f88995c86d6f25acd6b04bb3'
)
prepare(){
  cd $_pkgname-$pkgver
  sed -i -E 's|setuptools_scm[=<>]+[0-9.]+|setuptools_scm|' pyproject.toml
  patch -Np1 -i "$srcdir/cpu-only-test-suite.patch"
  # Calibration parameters must never inherit allocator garbage. In
  # particular, an uninitialized NaN makes two otherwise identical enabled
  # forwards compare unequal and can leak undefined values before calibration.
  patch -Np1 -i "$srcdir/initialize-qparams-deterministically.patch"
  # Keep the CPU sharded-MoE dispatch test collectible without a physical
  # accelerator. Accelerator cases retain upstream's requires_gpu markers.
  python - <<'PY'
from pathlib import Path
p = Path('tests/test_offload/test_dispatch.py')
s = p.read_text()
old = 'ACCELERATOR_TYPE = torch.accelerator.current_accelerator().type'
assert s.count(old) == 1
p.write_text(s.replace(old, '_accelerator = torch.accelerator.current_accelerator()\nACCELERATOR_TYPE = _accelerator.type if _accelerator is not None else "cuda"'))
# The helper always initializes CUDA tensors, even for the cpu/meta-labelled
# parameters. Pytest ignores marks on non-test helpers; place upstream's
# existing GPU requirement on the three actual entry points instead.
p = Path('tests/test_compressors/test_compress_decompress_module.py')
s = p.read_text()
for name in ('test_compress_decompress_module',
             'test_compress_decompress_module_mxfp4',
             'test_compress_decompress_embedding'):
    old = f'def {name}('
    assert s.count(old) == 1, name
    s = s.replace(old, '@requires_gpu\n' + old)
p.write_text(s)
PY
}
build() {
  cd $_pkgname-$pkgver
  BUILD_TYPE=release SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver} \
    python -m build --wheel --no-isolation
}
check() {
  cd $_pkgname-$pkgver
  rm -rf "$srcdir/_check"
  python -m installer --destdir="$srcdir/_check" dist/*.whl
  local _site="$srcdir/_check/usr/lib/python$(python -c \
    'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')/site-packages"

  # Run every local CPU test against the actual built wheel.  Besides the
  # integration marker, upstream leaves a few named Hugging Face downloads
  # unmarked; the exact nodes below are the network-only cases.  The four
  # serialization parameters explicitly request CUDA offloading.
  # test_apply_model fetches nm-testing/tinysmokellama-3.2; checkpoint-name
  # cases fetch llava-hf, gated google/gemma-4 and Qwen Hub configurations.
  HF_HUB_OFFLINE=1 TRANSFORMERS_OFFLINE=1 \
    PYTHONPATH="$_site" \
    python -m pytest -ra tests -m 'not integration' \
      --ignore=tests/test_compressors/model_compressors/test_transformers_integration.py \
      --deselect=tests/test_quantization/lifecycle/test_apply.py::test_apply_model \
      --deselect='tests/test_quantization/test_quant_config.py::test_map_to_checkpoint_names[llava]' \
      --deselect='tests/test_quantization/test_quant_config.py::test_map_to_checkpoint_names[gemma4]' \
      --deselect='tests/test_quantization/test_quant_config.py::test_map_to_checkpoint_names[qwen2_vl]' \
      --deselect=tests/test_utils/test_match.py::TestMatchNamedModules::test_expand_targets_with_llama_stories \
      --deselect=tests/test_quantization/lifecycle/test_apply.py::test_target_prioritization \
      --deselect=tests/test_quantization/lifecycle/test_apply.py::test_apply_quantization_config_tinyllama \
      --deselect=tests/test_quantization/lifecycle/test_apply.py::test_from_pretrained \
      --deselect=tests/test_quantization/lifecycle/test_apply.py::test_serialize_config_tinyllama \
      --deselect=tests/test_quantization/lifecycle/test_apply.py::test_apply_quantization_config \
      --deselect=tests/test_quantization/lifecycle/test_apply.py::test_multi_apply_quantization_config \
      --deselect=tests/test_quantization/lifecycle/test_apply.py::test_apply_kv_cache \
      --deselect=tests/test_quantization/lifecycle/test_apply.py::test_apply_attention \
      --deselect=tests/test_quantization/lifecycle/test_dynamic_lifecycle.py::test_apply_tinyllama_dynamic_activations \
      --deselect='tests/test_transform/factory/test_serialization.py::test_serialization[True-True-hadamard]' \
      --deselect='tests/test_transform/factory/test_serialization.py::test_serialization[True-True-random-hadamard]' \
      --deselect='tests/test_transform/factory/test_serialization.py::test_serialization[True-False-hadamard]' \
      --deselect='tests/test_transform/factory/test_serialization.py::test_serialization[True-False-random-hadamard]'

  # Meaningful local workflow: attach a real W4A16 scheme to a Linear layer,
  # pack its weights, then restore the original tensor shape and dtype.
  PYTHONPATH="$_site" python - <<'PY'
import torch
from torch import nn
from compressed_tensors.compressors import ModelCompressor
from compressed_tensors.compressors.base import decompress_module
from compressed_tensors.quantization import (
    apply_quantization_config,
    preset_name_to_scheme,
    QuantizationConfig,
)

layer = nn.Linear(256, 256, bias=False, dtype=torch.bfloat16)
original_shape = layer.weight.shape
config = QuantizationConfig(
    config_groups={"w4": preset_name_to_scheme("W4A16", ["Linear"])}
)
apply_quantization_config(layer, config)
ModelCompressor.from_pretrained_model(layer).compress_model(layer)
assert hasattr(layer, "weight_packed") and not hasattr(layer, "weight")
decompress_module(layer)
assert layer.weight.shape == original_shape
assert layer.weight.dtype == torch.bfloat16
print("W4A16 pack/decompress:", tuple(layer.weight.shape), layer.weight.dtype)
PY
}

package() {
  cd $_pkgname-$pkgver
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
# vim:set ts=2 sw=2 et:
