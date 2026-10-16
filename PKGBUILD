# Maintainer: Aidan Heeney <aidan.heeney@proton.me>
pkgname=squelch
pkgver=0.5.0
pkgrel=1
pkgdesc='Push-to-talk speech-to-text on GPU: Parakeet/Whisper, mic-array beamforming, Menu-key dictation'
arch=('x86_64')
url='https://github.com/ieatfood314/squelch'
license=('MIT')
depends=('python' 'python-evdev' 'python-numpy' 'python-pyqt6' 'ydotool'
         'wl-clipboard' 'libnotify' 'pipewire' 'vulkan-icd-loader' 'kanata'
         'playerctl')
makedepends=('git' 'cmake' 'vulkan-headers' 'spirv-headers')
optdepends=('python-huggingface_hub: alternative model downloads')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "whisper.cpp::git+https://github.com/ggml-org/whisper.cpp.git#commit=0c7be696371069e0baa2515ed7aa08d5a5473aa6")
sha256sums=('62383fc426515fb07dbb7c4722c8ff19a7bc6b5ee91f2a40b497384b96bb2c6c'
            'SKIP')
options=('!debug')

build() {
  cmake -S "$srcdir/whisper.cpp" -B "$srcdir/build" \
    -DGGML_VULKAN=ON -DCMAKE_BUILD_TYPE=Release
  cmake --build "$srcdir/build" --config Release -j"$(nproc)" \
    --target whisper-server whisper-cli parakeet-cli
}

package() {
  install -Dm755 "$srcdir/build/bin/whisper-server" \
    "$srcdir/build/bin/whisper-cli" "$srcdir/build/bin/parakeet-cli" \
    -t "$pkgdir/usr/bin/"
  install -d "$pkgdir/usr/lib/"
  for f in "$srcdir/build/bin"/libwhisper.so* \
           "$srcdir/build/bin"/libparakeet.so* \
           "$srcdir/build/bin"/libggml*.so*; do
    [ -e "$f" ] || continue
    cp -d "$f" "$pkgdir/usr/lib/$(basename "$f")"
  done
  chmod 755 "$pkgdir"/usr/lib/lib*.so*
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 src/squelch src/squelch-ptt src/squelch-parakeet-server \
    src/squelch-tray src/squelch-vram src/squelch-setup-models \
    -t "$pkgdir/usr/bin/"
  install -Dm644 systemd/*.service -t "$pkgdir/usr/lib/systemd/user/"
  install -Dm644 desktop/squelch.desktop -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md kanata/snippet.kbd -t \
    "$pkgdir/usr/share/doc/$pkgname/"
}
