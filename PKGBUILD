# Maintainer: Xhelliom
pkgname=loquivox
pkgver=1.1.1
pkgrel=1
# whisper.cpp engine version — keep in sync with packaging/whisper-cpp.version
_whispercpp_ver=1.8.6
pkgdesc="Voice-Assistant & AI Companion for Linux (push-to-talk voice dictation)"
arch=('x86_64' 'aarch64')
url="https://github.com/Xhelliom/loquivox"
license=('MIT')
depends=(
  'python'
  'python-numpy'
  'python-scipy'
  'python-sounddevice'   # AUR — audio capture + TTS playback (PortAudio)
  'python-evdev'
  'python-groq'          # AUR — default transcription backend
  'python-gobject'
  'python-cairo'
  'python-tomlkit'
  'gtk3'
  'webkit2gtk-4.1'
  'libayatana-appindicator'
  'speexdsp'
)
optdepends=(
  # --- X11 session tools ---
  'xdotool: keystroke injection (X11)'
  'xclip: clipboard access (X11)'
  'xorg-xprop: focused-terminal detection (X11)'
  'gnome-screenshot: screen capture for the vision feature (X11)'
  # --- Wayland session tools ---
  'wtype: keystroke injection (Wayland)'
  'wl-clipboard: clipboard access (Wayland)'
  'grim: screen capture for the vision feature (Wayland)'
  'gtk-layer-shell: overlay positioning (Wayland)'
  # --- optional cloud transcription backends ---
  'python-openai: OpenAI realtime streaming backend'
  'python-deepgram-sdk: Deepgram streaming backend'
  # Offline transcription (whisper.cpp) is built in — see build()/package().
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' 'cmake')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "whisper.cpp-$_whispercpp_ver.tar.gz::https://github.com/ggml-org/whisper.cpp/archive/refs/tags/v$_whispercpp_ver.tar.gz"
)
# Replace both with updpkgsums output once the v$pkgver tag exists.
sha256sums=('ba17870bcd40701679e0d1335a2590154ffd1c0cfcfb7eddd33b6df9f6c9c113'
            'f8e632016ceae556f3132a16c7f704be1e7715595041f474fa81a2b64c1abf7c')

build() {
  # 1) the Python application wheel
  cd "$srcdir/loquivox-$pkgver"
  python -m build --wheel --no-isolation

  # 2) the offline engine: a self-contained, statically-linked whisper-cli
  #    (BUILD_SHARED_LIBS=OFF → single binary, no libwhisper/libggml .so deps)
  cd "$srcdir/whisper.cpp-$_whispercpp_ver"
  cmake -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_SHARED_LIBS=OFF \
    -DWHISPER_BUILD_TESTS=OFF \
    -DWHISPER_BUILD_EXAMPLES=ON \
    -DWHISPER_BUILD_SERVER=OFF
  cmake --build build -j"$(nproc)" --target whisper-cli
}

package() {
  cd "$srcdir/loquivox-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # offline engine, discovered by the backend at <prefix>/lib/loquivox/
  install -Dm755 "$srcdir/whisper.cpp-$_whispercpp_ver/build/bin/whisper-cli" \
    "$pkgdir/usr/lib/$pkgname/whisper-cli"

  install -Dm644 packaging/loquivox.desktop \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 assets/logo.png \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 LICENSE \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
