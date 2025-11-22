pkgname=phantom-wallet-bin
pkgver=25.43.1
pkgrel=1
pkgdesc="A crypto wallet reimagined for DeFi & NFTs"
arch=('x86_64')
url="https://phantom.com"
license=('MIT')
depends=('hicolor-icon-theme')
optdepends=('fuse2: for direct AppImage execution'
            'fuse3: for direct AppImage execution')
options=(!strip)
source=("https://sourceforge.net/projects/phantom-wallet/files/Phantom%20Wallet-25.43.0.tar.gz/download")
sha256sums=('d04063d120df750b8d3055f38290761e6350cfa315205a86a0090780839b81f1')

prepare() {
    cd "$srcdir/Phantom Wallet-25.43.0"
    chmod +x "Phantom Wallet.AppImage"
}

package() {
    cd "$srcdir/Phantom Wallet-25.43.0"

    install -Dm755 "Phantom Wallet.AppImage" "$pkgdir/opt/${pkgname}/${pkgname}.AppImage"

    install -d "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/${pkgname}" <<'EOF'
#!/bin/bash
APPIMAGE="/opt/phantom-wallet-bin/phantom-wallet-bin.AppImage"

if [ -c /dev/fuse ] && (lsmod | grep -q fuse || modinfo fuse &>/dev/null); then
    exec "$APPIMAGE" "$@"
else
    exec "$APPIMAGE" --appimage-extract-and-run "$@"
fi
EOF

    chmod +x "$pkgdir/usr/bin/${pkgname}"

    install -Dm644 "Phantom Wallet.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
    sed -i "s|Exec=.*|Exec=Phantom Wallet %U|g" "$pkgdir/usr/share/applications/${pkgname}.desktop"

    install -Dm644 "Phantom Wallet.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"
    sed -i "s|Icon=.*|Icon=Phantom Wallet|g" "$pkgdir/usr/share/applications/${pkgname}.desktop"
}
