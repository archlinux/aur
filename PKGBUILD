# Maintainer: David Keegan <me@davidkeegan.com>
pkgname=piper-speak
pkgver=2.0.1
pkgrel=1
pkgdesc="Simple text-to-speech wrapper for Piper TTS on Linux"
arch=('x86_64')
url="https://github.com/kgn/piper-speak"
license=('MIT')
depends=('piper-tts' 'pipewire-pulse' 'wl-clipboard')
makedepends=('go')
optdepends=('libnotify: for speak-selection notifications')
source=("$pkgname-$pkgver.tar.gz::https://github.com/kgn/piper-speak/archive/refs/tags/v$pkgver.tar.gz"
        "https://huggingface.co/rhasspy/piper-voices/resolve/main/en/en_US/lessac/medium/en_US-lessac-medium.onnx"
        "https://huggingface.co/rhasspy/piper-voices/resolve/main/en/en_US/lessac/medium/en_US-lessac-medium.onnx.json")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

build() {
    cd "$pkgname-$pkgver"
    go build -o piper-speak ./cmd/piper-speak/
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 piper-speak "$pkgdir/usr/bin/piper-speak"
    install -Dm755 scripts/speak-selection "$pkgdir/usr/bin/speak-selection"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Install default voice model
    install -Dm644 "$srcdir/en_US-lessac-medium.onnx" "$pkgdir/usr/share/piper-speak/voices/en_US-lessac-medium.onnx"
    install -Dm644 "$srcdir/en_US-lessac-medium.onnx.json" "$pkgdir/usr/share/piper-speak/voices/en_US-lessac-medium.onnx.json"
}
