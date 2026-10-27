# Maintainer: Jatin K Malik <jatinkrmalik@gmail.com>
# Updated by .github/workflows/release.yml on v* tags. Setup: docs/AUR.md

pkgname=vocalinux
# AUR pkgver cannot contain hyphens (v0.14.0-beta -> 0.14.0beta).
pkgver=0.18.5
_tag=0.18.5
# PEP 440-normalized sdist version may differ from a prerelease tag.
_version=0.18.5
pkgrel=1
pkgdesc="Free, offline voice dictation for Linux"
arch=('any')
url="https://github.com/VocaHQ/vocalinux"
license=('AGPL-3.0-only')
depends=(
  'python>=3.11'
  'python-gobject'
  'gtk3'
  'libayatana-appindicator'
  'ibus'
  'gobject-introspection'
  'python-cairo'
  'python-pynput'
  'python-pywhispercpp'
  'python-pyaudio'
  'portaudio'
  'python-numpy'
  'python-requests'
  'python-pysocks'
  'python-tqdm'
  'python-psutil'
  'python-evdev'
  'python-xlib'
  'hicolor-icon-theme'
)
# --no-isolation uses distro python-setuptools (Arch extra is 84+).
# pyproject.toml build-system.requires must accept that version.
makedepends=(
  'python-build'
  'python-installer'
  'python-wheel'
  'python-setuptools'
)
optdepends=(
  'python-pywhispercpp-cpu: CPU-only whisper.cpp backend (default provider)'
  'python-pywhispercpp-cuda: NVIDIA GPU whisper.cpp backend'
  'python-pywhispercpp-rocm: AMD GPU whisper.cpp backend'
  'python-onnxruntime: Silero VAD'
  # One line per selectable engine. Without it the engine is offered in
  # Settings and fails at import, which is how vosk and whisper shipped too.
  'python-vosk: Vosk engine'
  'python-openai-whisper: OpenAI Whisper engine'
  'python-sherpa-onnx: Parakeet TDT 0.6B engine'
  'python-faster-whisper: faster-whisper engine'
  'xdotool: X11 injection fallback'
  'xclip: X11 clipboard tools (copy/paste injection fallbacks)'
  'wl-clipboard: Wayland clipboard (wl-copy/wl-paste) injection fallbacks'
  'wtype: Wayland keystroke injection fallback'
)
conflicts=('vocalinux-git')
source=("${pkgname}-${_version}.tar.gz::https://github.com/VocaHQ/vocalinux/releases/download/v${_tag}/${pkgname}-${_version}.tar.gz")
# Canonical release sdist, also published on PyPI. prepare_aur_source.py verifies
# its checksum/provenance before pinning the next version; publication never rehashes.
sha256sums=('1def4d8f0f14f2df2f2fee64ca29e6865e3d82e551f7d465c2a78ec6d4d72b1d')

build() {
  cd "${pkgname}-${_version}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${_version}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 vocalinux.desktop "${pkgdir}/usr/share/applications/vocalinux.desktop"

  for icon in resources/icons/scalable/*.svg; do
    install -Dm644 "$icon" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/$(basename "$icon")"
  done
}
