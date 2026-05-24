# Maintainer: Berk Kucuk <berkkucukk@proton.me>
pkgname=linux-chan-ai
pkgver=1.0.0
pkgrel=1
pkgdesc="Linux-themed AI chat assistant with PyQt6 GUI and voice support"
arch=('any')
url="https://github.com/berk-kucuk/Linux-Chan-AI"
license=('MIT')
depends=('python')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/berk-kucuk/Linux-Chan-AI/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('debdaaebd2b0e44a9c9366d0ffa5d8992985a22ddbe991f9855b7807b24c69a7')

prepare() {
    cd "Linux-Chan-AI-${pkgver}"
    sed -i 's|os.makedirs("temp_voice", exist_ok=True)|os.makedirs("/tmp/linux-chan-ai", exist_ok=True)|' linux-chan.py
    sed -i 's|path = "temp_voice/voice.mp3"|path = "/tmp/linux-chan-ai/voice.mp3"|' linux-chan.py
}

package() {
    cd "Linux-Chan-AI-${pkgver}"

    install -Dm755 linux-chan.py "$pkgdir/usr/share/Linux-Chan-AI/linux-chan.py"
    install -Dm644 requirements.txt "$pkgdir/usr/share/Linux-Chan-AI/requirements.txt"

    local icon
    for icon in icons/*; do
        install -Dm644 "$icon" "$pkgdir/usr/share/Linux-Chan-AI/icons/$(basename "$icon")"
    done

    install -Dm644 Linux-Chan-AI.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i \
        -e "s|Exec=.*|Exec=/usr/bin/linux-chan-ai|" \
        -e "s|Icon=.*|Icon=/usr/share/Linux-Chan-AI/icons/arch-chan_mini.png|" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/linux-chan-ai" << 'EOF'
#!/bin/sh
exec /usr/share/Linux-Chan-AI/python-env/bin/python3 /usr/share/Linux-Chan-AI/linux-chan.py "$@"
EOF
}
