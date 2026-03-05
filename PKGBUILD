# Maintainer: Shuv <shuv@example.com>

pkgname=shuvoice-git
pkgver=0.1.2.r0
pkgrel=1
pkgdesc="Streaming speech-to-text overlay for Hyprland/Wayland with pluggable ASR backends"
arch=('x86_64')
url='https://github.com/shuv1337/shuvoice'
license=('MIT')
provides=('shuvoice')
conflicts=('shuvoice')

# NOTE:
# - Default Sherpa backend runtime is included via python-sherpa-onnx
#   (typically provided by python-sherpa-onnx-bin on AUR).
# - NeMo/Moonshine backends are optional and can be installed via distro packages or pip/uv.
# - python-pytorch-cuda enables GPU acceleration for NeMo/Sherpa CUDA backends.
depends=(
  'python'
  'python-numpy'
  'python-sounddevice'
  'python-sherpa-onnx'
  'gtk4'
  'gtk4-layer-shell'
  'python-gobject'
  'wtype'
  'wl-clipboard'
  'portaudio'
  'pipewire'
  'pipewire-audio'
  'pipewire-alsa'
)
optdepends=(
  'python-pytorch-cuda: GPU acceleration for NeMo and Sherpa CUDA backends'
  'python-tomli: TOML parsing for Python < 3.11'
  'python-nemo-toolkit: NeMo ASR backend (if packaged for your Arch setup)'
  'python-pip: install optional backend wheels (nemo-toolkit[asr], useful-moonshine-onnx)'
  'ydotool: alternative text injection utility'
  'espeak-ng: TTS engine for scripts/tts_roundtrip.py'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-hatchling'
)
source=('git+https://github.com/shuv1337/shuvoice.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/shuvoice"
  printf "0.1.2.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/shuvoice"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/shuvoice"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 examples/config.toml "$pkgdir/usr/share/doc/$pkgname/config.toml.example"
  install -Dm644 packaging/systemd/user/shuvoice.service "$pkgdir/usr/lib/systemd/user/shuvoice.service"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -d "$pkgdir/usr/share/doc/$pkgname/docs/assets/branding"
  install -d "$pkgdir/usr/share/doc/$pkgname/docs/assets/screenshots"
  install -m644 docs/assets/branding/*.png "$pkgdir/usr/share/doc/$pkgname/docs/assets/branding/"
  install -m644 docs/assets/screenshots/*.png "$pkgdir/usr/share/doc/$pkgname/docs/assets/screenshots/"
}
