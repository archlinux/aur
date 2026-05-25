# Maintainer: Berk Kucuk <berkkucukk@proton.me>
pkgname=linux-chan-ai
pkgver=1.1.3
pkgrel=1
pkgdesc="Linux-themed AI chat assistant with PyQt6 GUI, edge-tts voice, and Gemini AI"
arch=('any')
url="https://github.com/berk-kucuk/Linux-Chan-AI"
license=('MIT')
depends=('python' 'mpg123')
optdepends=('ffmpeg: alternative audio backend (ffplay)'
            'mpv: alternative audio backend')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::https://github.com/berk-kucuk/Linux-Chan-AI/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d3f76ffeafd6573854127e28c98ca8a2c9dcc078f7dc98a0de5f6ea602ce02b4')

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
