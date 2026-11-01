# Maintainer: Smoolak <smoolak@gmail.com>
pkgname=python-vocos
pkgver=0.1.0
pkgrel=1
pkgdesc='Fourier-based neural vocoder for high-quality audio synthesis'
arch=(any)
url='https://github.com/charactr-platform/vocos'
license=(MIT)
depends=(python python-pytorch python-torchaudio python-numpy python-scipy
         python-einops python-yaml python-huggingface-hub python-encodec)
# The public EnCodec VCS provider requires git but does not declare it.
makedepends=(git python-build python-installer python-setuptools python-wheel)
optdepends=('python-pytorch-lightning: model training'
            'python-jsonargparse: training command-line configuration'
            'python-transformers: training evaluation models'
            'python-matplotlib: training visualizations')
_commit=11b4628853c9e79dbc4577b01ecb02cfbc78255d
source=("vocos-$pkgver.tar.gz::$url/archive/$_commit.tar.gz")
sha256sums=('9ae624fb3a3d963273b4008eda54d530e6820b5a34d31495d7caa937e7e6d66b')

build() {
  cd "vocos-$_commit"
  python -m build --wheel --no-isolation
}

check() {
  cd "vocos-$_commit"
  # This release has no automated suite. Exercise its documented mel-to-audio
  # inference path offline. Pretrained copy synthesis is checked after install.
  python -m installer --destdir="$srcdir/check" dist/*.whl
  local site_packages=("$srcdir"/check/usr/lib/python*/site-packages)
  cd "$srcdir"
  PYTHONPATH="${site_packages[0]}" python - <<'PYTEST'
import torch
from vocos import Vocos
from vocos.feature_extractors import MelSpectrogramFeatures
from vocos.heads import ISTFTHead
from vocos.models import VocosBackbone

torch.set_num_threads(2)
model = Vocos(MelSpectrogramFeatures(), VocosBackbone(100, 32, 64, 2),
              ISTFTHead(32, 1024, 256)).eval()
audio = torch.sin(torch.arange(24000) * (2 * torch.pi * 440 / 24000))[None] * 0.1
features = model.feature_extractor(audio)
reconstructed = model(audio)
torch.testing.assert_close(reconstructed, model.decode(features))
assert reconstructed.shape[0] == 1 and 23000 <= reconstructed.shape[1] <= 25000
assert torch.isfinite(reconstructed).all()
print('Built-wheel mel extraction and Fourier waveform reconstruction: PASS')
PYTEST
}

package() {
  cd "vocos-$_commit"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
