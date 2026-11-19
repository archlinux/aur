# Maintainer: Aidan Heeney <aidan.heeney@proton.me>
pkgname=squelch
pkgver=0.12.2
pkgrel=1
pkgdesc='Push-to-talk speech-to-text on GPU: Parakeet/Whisper, mic-array beamforming, Menu-key dictation'
arch=('x86_64')
url='https://github.com/ieatfood314/squelch'
license=('MIT')
depends=('python' 'python-evdev' 'python-numpy' 'python-pyqt6' 'ydotool'
         'wl-clipboard' 'libnotify' 'pipewire' 'vulkan-icd-loader'
         'playerctl' 'polkit' 'qt6-tools' 'wireplumber' 'libxkbcommon'
         'glib2' 'layer-shell-qt')
makedepends=('git' 'cmake' 'vulkan-headers' 'spirv-headers')
optdepends=('aspell-en: learn your vocabulary and mishearings'
            'python-gobject: see edits to dictations through accessibility'
            'at-spi2-core: see edits to dictations through accessibility'
            'kanata: stop the trigger key doing its own job too')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "whisper.cpp::git+https://github.com/ggml-org/whisper.cpp.git#commit=0c7be696371069e0baa2515ed7aa08d5a5473aa6")
sha256sums=('a35e11387b0a88b37936131e8cc3f3e5d3c120a500089fa811aaa2e7f36aa90f'
            'SKIP')
options=('!debug')

build() {
  cmake -S "$srcdir/whisper.cpp" -B "$srcdir/build" \
    -DGGML_VULKAN=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_SKIP_RPATH=ON
  cmake --build "$srcdir/build" --config Release -j"$(nproc)" \
    --target whisper-server whisper-cli parakeet-cli
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  packaging/install-engine "$pkgdir" "$srcdir/build"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm644 README.md kanata/snippet.kbd -t \
    "$pkgdir/usr/share/doc/$pkgname/"
}
