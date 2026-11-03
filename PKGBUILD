# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-diffsynth
_pkgname=diffsynth
pkgver=2.2.0
pkgrel=1
pkgdesc="Enjoy the magic of Diffusion models! Diffusion engine by the ModelScope team"
arch=('any')
url="https://github.com/modelscope/DiffSynth-Studio"
license=('Apache-2.0')
depends=(
    'python'
    'python-pytorch>=2.0'
    'python-torchvision'
    'python-transformers'
    'python-huggingface-hub'
    'python-imageio'
    'python-imageio-ffmpeg'
    'python-safetensors'
    'python-einops'
    'python-sentencepiece'
    'python-protobuf'
    'python-modelscope'
    # ModelScope Hub imports cryptography but its public recipe omits it.
    'python-cryptography'
    'python-ftfy'
    'python-pandas'
    'python-accelerate'
    'python-peft'
    'python-datasets'
    'python-numpy'
    'python-packaging'
    'python-pillow'
    'python-regex'
    'python-tqdm'
    'python-typing_extensions'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools>=77'
)
optdepends=(
    'python-av: audio extra (av/torchaudio/torchcodec/librosa)'
    'python-torchaudio: audio extra'
    'python-torchcodec: audio extra'
    'python-librosa: audio extra'
    'python-streamlit: web UI'
    'python-bitsandbytes: quantized Ideogram text encoder'
    'python-deepspeed: DeepSpeed training and checkpointing'
    'python-facexlib: face recognition pipelines'
    'python-flash-attn: FlashAttention 2 acceleration'
    'python-insightface: face analysis pipelines'
    'python-lpips: perceptual training loss'
    'python-pywavelets: steerable pyramid utilities'
    'python-wandb: Weights & Biases training logger'
    'python-xformers: xFormers attention acceleration'
    'python-opencv: face restoration and image-processing pipelines'
    'python-comfy-kitchen: quantization kernels (quant extra)'
    'python-torchao>=0.16: TorchAO quantization (quant extra)'
    'python-tiktoken: Yue2 tokenization'
)
_commit=543bf843411a32e1520301a5f8a09e2c0ae27a1d
_archive="DiffSynth-Studio-${_commit}"
source=("${pkgname}-${_commit}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha256sums=('8545685dc77b257397c1af6494a39a9188dede057e5ccc1951aa4fa16e060d4e')

build() {
    cd "$srcdir/${_archive}"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/${_archive}"
    local _check="$srcdir/diffsynth-check" _site
    rm -rf "$_check"
    python -m installer --destdir="$_check" dist/*.whl
    _site="$_check$(python -c 'import sysconfig; print(sysconfig.get_path("purelib"))')"
    cd "$srcdir"
    # Upstream's only "unit_test.py" is a seven-GPU orchestration script that
    # downloads and trains full diffusion models. Exercise its offline core
    # instead: data ingestion, image preprocessing, attention, and autograd.
    CUDA_VISIBLE_DEVICES='' DIFFSYNTH_ATTENTION_IMPLEMENTATION=torch \
        PYTHONPATH="$_site" DIFFSYNTH_CHECK_SITE="$_site" python -P - <<'PY'
import json
import os
import tempfile
from pathlib import Path

import torch
import torch.nn.functional as F
from PIL import Image

import diffsynth
from diffsynth import UnifiedDataset, attention_forward, gradient_checkpoint_forward
assert Path(diffsynth.__file__).resolve().is_relative_to(Path(os.environ["DIFFSYNTH_CHECK_SITE"]).resolve())

with tempfile.TemporaryDirectory() as directory:
    root = Path(directory)
    Image.new("RGB", (24, 18), (32, 96, 160)).save(root / "sample.png")
    (root / "metadata.json").write_text(
        json.dumps([{"image": "sample.png", "caption": "blue test frame"}])
    )
    dataset = UnifiedDataset(
        base_path=str(root),
        metadata_path=str(root / "metadata.json"),
        data_file_keys=("image",),
        main_data_operator=UnifiedDataset.default_image_operator(
            str(root), height=16, width=16
        ),
    )
    item = dataset[0]
    assert item["image"].size == (16, 16)
    assert item["caption"] == "blue test frame"

torch.manual_seed(7)
q = torch.randn(2, 3, 5, 4, requires_grad=True)
k = torch.randn(2, 3, 5, 4, requires_grad=True)
v = torch.randn(2, 3, 5, 4, requires_grad=True)
out = attention_forward(q, k, v, compatibility_mode=True)
expected = F.scaled_dot_product_attention(q, k, v)
assert out.shape == (2, 3, 5, 4)
assert torch.allclose(out, expected)

layer = torch.nn.Linear(4, 3)
checkpointed = gradient_checkpoint_forward(
    layer, True, False, out.reshape(-1, 4)
)
loss = checkpointed.square().mean()
loss.backward()
assert q.grad is not None and torch.isfinite(q.grad).all()
assert layer.weight.grad is not None and torch.isfinite(layer.weight.grad).all()
print({"dataset_items": len(dataset), "attention_shape": tuple(out.shape), "loss": loss.item()})
PY
}

package() {
    cd "$srcdir/${_archive}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
