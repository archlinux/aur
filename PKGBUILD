# Maintainer: Aidan Heeney <aidan.heeney@proton.me>
pkgname=squelch
pkgver=0.7.5
pkgrel=1
pkgdesc='Push-to-talk speech-to-text on GPU: Parakeet/Whisper, mic-array beamforming, Menu-key dictation'
arch=('x86_64')
url='https://github.com/ieatfood314/squelch'
license=('MIT')
depends=('python' 'python-evdev' 'python-numpy' 'python-pyqt6' 'ydotool'
         'wl-clipboard' 'libnotify' 'pipewire' 'vulkan-icd-loader'
         'playerctl' 'polkit' 'qt6-tools')
makedepends=('git' 'cmake' 'vulkan-headers' 'spirv-headers')
optdepends=('aspell-en: learn your vocabulary and mishearings'
            'kanata: stop the trigger key doing its own job too')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "whisper.cpp::git+https://github.com/ggml-org/whisper.cpp.git#commit=0c7be696371069e0baa2515ed7aa08d5a5473aa6")
sha256sums=('542dd0b86e8375ce2abe3b992c31d7b9cbdbccf69d0d700080277b3c1555fae6'
            'SKIP')
options=('!debug')

build() {
  cmake -S "$srcdir/whisper.cpp" -B "$srcdir/build" \
    -DGGML_VULKAN=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_SKIP_RPATH=ON
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
    src/squelch-mic-reset -t "$pkgdir/usr/bin/"
  install -Dm644 systemd/*.service -t "$pkgdir/usr/lib/systemd/user/"
  install -Dm644 systemd/system/squelch-mic-reset@.service -t \
    "$pkgdir/usr/lib/systemd/system/"
  install -Dm644 polkit/50-squelch.rules -t \
    "$pkgdir/usr/share/polkit-1/rules.d/"
  install -Dm644 desktop/squelch.desktop -t \
    "$pkgdir/usr/share/applications/"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md kanata/snippet.kbd -t \
    "$pkgdir/usr/share/doc/$pkgname/"
}
