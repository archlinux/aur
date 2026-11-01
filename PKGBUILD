# Maintainer: Smoolak <smoolak@gmail.com>
pkgname=python-utmos-pytorch
pkgver=0.1.0
pkgrel=1
pkgdesc='Fairseq-free PyTorch implementation of UTMOS speech quality prediction'
arch=(any)
url='https://github.com/Blinorot/utmos-pytorch'
license=(MIT)
depends=(python 'python-pytorch>=2.2.0' 'python-huggingface-hub>=0.20')
makedepends=(python-build python-installer 'python-setuptools>=69' python-wheel)
_commit=fad24d9b173153353c8e276b5b6780c8a9e319b8
source=("utmos-pytorch-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('4a4b586ab77907639473257a0148b9377765682a2bf9a0b4e53f2f6e9d890faf')

prepare() {
  cd "utmos-pytorch-$_commit"
  # Upstream data-files otherwise puts third-party notices in /usr/LICENSES.
  sed -i 's/^"LICENSES" = /"share\/licenses\/python-utmos-pytorch" = /' pyproject.toml
}

build() {
  cd "utmos-pytorch-$_commit"
  python -m build --wheel --no-isolation
}

check() {
  cd "utmos-pytorch-$_commit"
  # The legacy three-way test needs fairseq, original checkpoints and LibriSpeech.
  # Run its offline collation helper and the packaged model's forward path here.
  # Pretrained Torch/TorchScript speech scoring is validated after installation.
  python -m installer --destdir="$srcdir/check" dist/*.whl
  local site_packages=("$srcdir"/check/usr/lib/python*/site-packages)
  PYTHONPATH="${site_packages[0]}" python - <<'PYTEST'
import ast
from pathlib import Path
import torch
from torch.nn.utils.rnn import pad_sequence
from utmos_pytorch.utmos_torch import UTMOSModel

source = ast.parse(Path("test.py").read_text())
collate = next(node for node in source.body
               if isinstance(node, ast.FunctionDef) and node.name == "collate_fn")
namespace = {"pad_sequence": pad_sequence}
exec(compile(ast.Module(body=[collate], type_ignores=[]), "test.py", "exec"), namespace)
batch = namespace["collate_fn"]([torch.zeros(1, 16000), torch.zeros(1, 12000)])
assert batch.shape == (2, 1, 16000)
torch.set_num_threads(2)
model = UTMOSModel().eval()
with torch.inference_mode():
    scores = model(batch, torch.zeros(2, dtype=torch.int),
                   torch.full((2,), 288, dtype=torch.int))
assert scores.ndim == 3 and scores.shape[0] == 2 and scores.shape[-1] == 1
assert scores.shape[1] > 0 and torch.isfinite(scores).all()
print("Upstream collation and built-wheel model forward path: PASS")
PYTEST
}

package() {
  cd "utmos-pytorch-$_commit"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
