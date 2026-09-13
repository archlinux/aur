# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-neural-compressor
_pkgname=neural_compressor
_archive=neural-compressor
pkgver=3.9
pkgrel=3
pkgdesc="Intel Neural Compressor: model quantization and compression for ONNX, PyTorch, TensorFlow and JAX"
arch=('any')
url="https://github.com/intel/neural-compressor"
license=('Apache-2.0')
depends=(
    'python'
    'python-prettytable'
    'python-psutil'
    'python-py-cpuinfo'
    'python-pydantic'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-wheel'
)
checkdepends=(
    'python-accelerate'
    'python-numpy'
    'python-packaging'
    'python-psutil'
    'python-py-cpuinfo'
    'python-pydantic'
    'python-pytest'
    'python-pytorch'
    'python-transformers'
)
optdepends=(
    # PyTorch backend (extra: pt)
    'python-pytorch: PyTorch quantization backend'
    'python-accelerate: PyTorch weight-only and layer-wise quantization'
    'python-numpy: PyTorch/JAX backend'
    'python-torchao: PyTorch architecture optimization backend'
    'python-transformers: Hugging Face Transformers quantization integration'
    # TensorFlow backend (extra: tf)
    'python-tensorflow: TensorFlow quantization backend'
    'python-protobuf: TensorFlow graph utilities'
    'python-yaml: TensorFlow backend configuration'
    # JAX backend (extra: jax)
    'python-jax: JAX quantization backend'
    'python-keras: JAX/Keras backend'
    'python-ml-dtypes: JAX data type support'
    'python-deprecated: JAX backend deprecation helpers'
    'python-pillow: JAX backend image handling'
    'python-scikit-learn: JAX backend metrics'
    'python-scipy: JAX backend numerics'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9df89c5cc72a5edefd7a9765e423470e4ca03d7b0e98b16ef9f144fb1807c1e2')

build() {
    cd "$_archive-$pkgver"
    python -m build --wheel --no-isolation
}

check() {
    cd "$_archive-$pkgver"
    local _site _checkroot="$srcdir/_check"
    rm -rf "$_checkroot"
    python -m installer --destdir="$_checkroot" dist/*.whl
    _site=$(python -c 'import site; print(site.getsitepackages()[0])')

    # The default distribution intentionally has no mandatory ML framework.
    # Exercise the complete framework-independent suite plus every self-contained
    # CPU PyTorch unit group. The remaining upstream groups require IPEX, HPU,
    # XPU, CUDA, torchao/auto-round (not packaged for Arch), or download models.
    PYTHONPATH="$_checkroot$_site" pytest -ra --import-mode=importlib \
        test/common \
        test/torch/algorithms/mx_quant \
        test/torch/algorithms/weight_only/test_hqq_quantizer.py \
        test/torch/algorithms/weight_only/test_woq_module.py \
        test/torch/algorithms/weight_only/test_woq_utility.py \
        test/torch/quantization/test_mx_quant.py \
        test/torch/quantization/weight_only/test_woq_utils.py \
        test/torch/utils/test_auto_accelerator.py
    PYTHONPATH="$_checkroot$_site" python - <<'PY'
import torch

from neural_compressor.torch.quantization import RTNConfig, quantize

model = torch.nn.Sequential(torch.nn.Linear(8, 4), torch.nn.ReLU()).eval()
example = torch.randn(4, 8)
quantized = quantize(model, RTNConfig())
result = quantized(example)
assert result.shape == (4, 4)
assert torch.isfinite(result).all()
print("Intel Neural Compressor CPU quantization smoke passed")
PY
}

package() {
    cd "$_archive-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
