# Maintainer: Evert Vorster <superchief@evertvorster.com>

pkgname=python-outetts
pkgver=0.4.4
pkgrel=1
pkgdesc='OuteAI Text-to-Speech (TTS) — multi-backend TTS with voice cloning'
arch=('any')
url='https://github.com/edwko/OuteTTS'
license=('Apache')
depends=(
  'python'
  'python-pytorch'
  'python-torchaudio'
  'python-scipy'
  'python-numpy'
  'python-soundfile'
  'python-sounddevice'
  'python-huggingface-hub'
  'python-transformers'
  'python-requests'
  'python-tqdm'
  'python-pyyaml'
  'python-inflect'
  'python-loguru'
  'python-matplotlib'
  'python-einops'
  'python-ftfy'
  'python-aiohttp'
)
makedepends=('python-installer' 'python-wheel')
source=("outetts-${pkgver}-py3-none-any.whl::https://files.pythonhosted.org/packages/1b/ea/980e108960caeacc6de1cbf5d5ba61a74b86869ac56bb1321eb18706f1b0/outetts-${pkgver}-py3-none-any.whl")
noextract=("outetts-${pkgver}-py3-none-any.whl")
b2sums=('3845737ebce9f7760e0d93b7aa8382fb3c7f7370aff876eed02b0236a1316e7121c982c8f1c0752f69a6bddea55088c9d8f98664a1eec9691710322fb7ea6568')

prepare() {
  cd "$srcdir"
  # Unpack the wheel to patch pinned deps
  python -m wheel unpack "outetts-${pkgver}-py3-none-any.whl"
  # Relax pinned transformers version to coexist with system 5.x
  sed -i 's/transformers==4\.52\.3/transformers>=4.52.3/' \
    "outetts-${pkgver}/outetts-${pkgver}.dist-info/METADATA"
  cd "$srcdir"
  # Repack the wheel with patched deps
  rm -f "outetts-${pkgver}-py3-none-any.whl"
  python -m wheel pack "outetts-${pkgver}"
}

package() {
  cd "$srcdir"
  python -m installer --destdir="$pkgdir" dist/*.whl 2>/dev/null || \
    python -m installer --destdir="$pkgdir" "outetts-${pkgver}-py3-none-any.whl"
  install -Dm644 "${srcdir}/outetts-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}" 2>/dev/null || true
}
