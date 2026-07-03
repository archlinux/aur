# Maintainer: AlphaJack <alphajack at tuta dot io>
# Co-maintainer: Evert Vorster <evorster at gmail dot com>

pkgname="coqui-tts"
pkgver=0.27.5
pkgrel=2
pkgdesc="Deep learning for Text to Speech (hybrid venv)"
arch=('any')
url="https://github.com/idiap/coqui-ai-TTS"
license=('MPL-2.0')
provides=("tts" "python-tts")
conflicts=("tts" "python-tts")
replaces=("python-tts" "tts")
depends=('uv'
         'python-pytorch-cuda'
         'python-torchaudio'
         'python-torchcodec'
         'python-numpy'
         'python-scipy'
         'python-soundfile'
         'python-librosa'
         'python-inflect'
         'python-tqdm'
         'python-anyascii'
         'python-yaml'
         'python-fsspec'
         'python-packaging'
         'python-typing_extensions'
         'python-matplotlib'
         'python-transformers'
         'python-huggingface-hub')
source=('0001-replace-pyin-with-yin.patch')
sha256sums=('e5d00022730c5cce0e5a5b0cba0f64159efc9d9fab8864d9bc00276a0c2d98c3')

makedepends=('uv')

build() {
  # Create venv inheriting system packages (torch, numpy, scipy, librosa, etc.)
  uv venv --system-site-packages --clear venv
  source venv/bin/activate

  # Install coqui-tts and any deps not on the system (AUR-only packages).
  # uv will install newer deps into the venv as needed.
  uv pip install 'coqui-tts==0.27.5'

  _sp="venv/lib/python3.14/site-packages"

  # Patch: librosa 0.11.0 removed pyin and magphase; use yin and np.abs
  patch -Np1 -d "$_sp" < "$srcdir/0001-replace-pyin-with-yin.patch"

  # Patch: transformers 5 removed isin_mps_friendly; PyTorch has torch.isin
  sed -i 's/from transformers\.pytorch_utils import isin_mps_friendly as isin/isin = torch.isin/' \
    "$_sp/TTS/tts/layers/tortoise/autoregressive.py"
}

package() {
  _optdir="$pkgdir/opt/$pkgname"
  install -d "$_optdir"
  cp -r venv "$_optdir/"

  # Relocate venv: rewrite build-dir paths to install path
  _oldpath="$srcdir"
  _newpath="/opt/$pkgname"
  find "$_optdir/venv" -type f \( -name '*.cfg' -o -name 'activate*' -o -name '*.nu' -o -name '*.bat' -o -name '*.csh' -o -name '*.fish' \) \
    -exec sed -i "s|$_oldpath|$_newpath|g" {} + 2>/dev/null
  # Fix shebangs in bin/ scripts
  sed -i "s|$_oldpath/venv|$_newpath/venv|g" "$_optdir/venv/bin"/* 2>/dev/null || true

  # Clean up caches
  rm -rf "$_optdir/venv/cache"
  find "$_optdir/venv" -name '__pycache__' -type d -exec rm -rf {} + 2>/dev/null

  # Wrapper scripts
  install -d "$pkgdir/usr/bin"

  {
    echo '#!/bin/bash'
    echo 'exec /opt/coqui-tts/venv/bin/tts "$@"'
  } > "$pkgdir/usr/bin/tts"
  chmod 755 "$pkgdir/usr/bin/tts"

  {
    echo '#!/bin/bash'
    echo 'exec /opt/coqui-tts/venv/bin/tts-server "$@"'
  } > "$pkgdir/usr/bin/tts-server"
  chmod 755 "$pkgdir/usr/bin/tts-server"
}
