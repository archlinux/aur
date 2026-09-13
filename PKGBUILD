# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=python-diffsynth
_pkgname=diffsynth
pkgver=2.1.7
pkgrel=1
pkgdesc="Enjoy the magic of Diffusion models! Diffusion engine by the ModelScope team"
arch=('any')
url="https://github.com/modelscope/DiffSynth-Studio"
license=('Apache-2.0')
depends=(
    'python'
    'python-pytorch'
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
    'python-setuptools'
)
optdepends=(
    'python-av: audio extra (av/torchaudio/torchcodec/librosa)'
    'python-torchaudio: audio extra'
    'python-torchcodec: audio extra'
    'python-librosa: audio extra'
    'python-streamlit: all extra (web UI)'
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
)
_commit=7822d1781287971d24bf94e09bd487ce21ee08d8
_archive=DiffSynth-Studio
source=("git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
    cd "$srcdir/${_archive}"
    python -m build --wheel --no-isolation
}

check() {
    cd "$srcdir/${_archive}"
    # Upstream's only "unit_test.py" is a seven-GPU orchestration script that
    # downloads and trains full diffusion models. Exercise its offline core
    # instead: data ingestion, image preprocessing, attention, and autograd.
    CUDA_VISIBLE_DEVICES='' DIFFSYNTH_ATTENTION_IMPLEMENTATION=torch \
        PYTHONPATH="$PWD:$PYTHONPATH" python - <<'PY'
import json
import tempfile
from pathlib import Path

import torch
import torch.nn.functional as F
from PIL import Image

from diffsynth import UnifiedDataset, attention_forward, gradient_checkpoint_forward

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
