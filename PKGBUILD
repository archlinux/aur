mrfragger github.com/mrfagger/substitcher
pkgname=substitcher-bin
pkgver=26.08.12
pkgrel=1
pkgdesc="Audiobook encoder and player with subtitle support"
arch=('x86_64')
url="https://github.com/mrfragger/substitcher"
license=('MIT')
depends=('gtk3')
provides=('substitcher')
conflicts=('substitcher')
source=("https://github.com/mrfragger/substitcher/releases/download/v${pkgver}/substitcher-x64.AppImage")
sha256sums=('5e86221eb0f7dec7fb199fa07ef2d490ea8b63085ac47e43f835ca25096f54ec')

package() {
    install -Dm755 "$srcdir/substitcher-x64.AppImage" "$pkgdir/opt/substitcher/substitcher.AppImage"
    
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/substitcher" << 'EOF'
#!/bin/bash
exec /opt/substitcher/substitcher.AppImage "$@"
EOF
    
    cd "$srcdir"
    chmod +x substitcher-x64.AppImage
    ./substitcher-x64.AppImage --appimage-extract usr/share/applications/substitcher.desktop 2>/dev/null || true
    ./substitcher-x64.AppImage --appimage-extract substitcher.png 2>/dev/null || true
    
    install -Dm644 squashfs-root/substitcher.desktop "$pkgdir/usr/share/applications/substitcher.desktop"
    install -Dm644 squashfs-root/substitcher.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/substitcher.png"
    
    sed -i 's|Exec=substitcher|Exec=/usr/bin/substitcher|g' "$pkgdir/usr/share/applications/substitcher.desktop"
}
