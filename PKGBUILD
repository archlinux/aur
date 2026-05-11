# Maintainer: Will Handley <williamjameshandley@gmail.com>

pkgname=python-chatterbox-tts
_pkgname=chatterbox_tts
pkgver=0.1.7
pkgrel=2
pkgdesc='Open-source TTS and Voice Conversion by Resemble AI (zero-shot voice cloning)'
arch=('any')
url='https://github.com/resemble-ai/chatterbox'
license=('MIT')
depends=(
  'python'
  'python-pytorch-opt-cuda'
  'python-torchaudio'
  'python-transformers'
  'python-diffusers'
  'python-numpy'
  'python-librosa'
  'python-omegaconf'
  'python-safetensors'
  'python-pyloudnorm'
  # Runtime deps not yet packaged for Arch — first-import will fail until these land:
  #   python-conformer       (used by models/s3gen/matcha/decoder.py)
  #   python-s3tokenizer     (used by models/s3tokenizer/s3tokenizer.py)
  #   python-resemble-perth  (imported as `perth` at top of tts_turbo.py)
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
source=("https://files.pythonhosted.org/packages/c4/b1/8f1203e868111a45b566a79a4f56cd7843c420dfda709b81cebee55afa10/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ed8afae83819b40a25927c2ef3bcc67f928bdfcf434c1376c972e6039252a187')

prepare() {
  cd "${_pkgname}-${pkgver}"

  # Strip strict == pins so wheel metadata reflects what we're actually
  # running against (system python-transformers 5.7, python-pytorch 2.11,
  # python-diffusers latest, etc.) rather than upstream's frozen 2024 set.
  # Also drop multilingual + UI deps — Turbo English doesn't use them.
  python <<'PY'
import re
data = open('pyproject.toml').read()
data = re.sub(r'"([a-z0-9_-]+)==[\d.]+[^"]*"', r'"\1"', data)
for drop in ('gradio', 'spacy-pkuseg', 'pykakasi'):
    data = re.sub(rf'\s*"{drop}[^"]*",?\n', '', data)
open('pyproject.toml', 'w').write(data)
PY

  # Upstream issue #499 / PR #500: numpy 2.0+ NEP-50 scalar promotion
  # turns a np.float64 gain into a float64 audio array, breaking everything
  # downstream that assumes float32. Force the gain to a plain Python float.
  # Drop this patch when chatterbox >= 0.1.8 ships the upstream fix.
  sed -i 's/wav = wav \* gain_linear/wav = wav * float(gain_linear)/' \
    src/chatterbox/tts_turbo.py
}

build() {
  cd "${_pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
