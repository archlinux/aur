# Maintainer: Berk Kucuk <berkkucukk@proton.me>
pkgname=linux-chan-ai
pkgver=1.0.0
pkgrel=1
pkgdesc="AI-powered Linux assistant with anime personality"
arch=('any')
url="https://github.com/berk-kucuk/Linux-Chan-AI"
license=('MIT')
depends=(
    'python'
    'python-pyqt5'
)
install=linux-chan-ai.install
source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/berk-kucuk/Linux-Chan-AI/archive/refs/tags/v$pkgver.tar.gz"
)
sha256sums=('8d10b2c53d9ecd383569dc488196b13ffad120e6d4ea8871f13ce24c71f9d9ea')

package() {
    cd "Linux-Chan-AI-$pkgver"

    # Application files
    install -dm755 "$pkgdir/usr/share/$pkgname"
    cp -r . "$pkgdir/usr/share/$pkgname/"
    rm -f "$pkgdir/usr/share/$pkgname/install.sh"

    # Wrapper script
    install -dm755 "$pkgdir/usr/bin"
    printf '#!/bin/sh\nexec /usr/share/linux-chan-ai/venv/bin/python /usr/share/linux-chan-ai/main.py "$@"\n' \
        > "$pkgdir/usr/bin/$pkgname"
    chmod 755 "$pkgdir/usr/bin/$pkgname"

    # Desktop entry
    install -Dm644 "Linux-Chan-AI.desktop" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"
    sed -i \
        -e "s|Exec=.*|Exec=/usr/bin/linux-chan-ai|" \
        -e "s|Icon=.*|Icon=linux-chan-ai|" \
        "$pkgdir/usr/share/applications/$pkgname.desktop"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
