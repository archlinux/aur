mrfragger github.com/mrfagger/substitcher
pkgname=substitcher-bin
pkgver=26.11.16
pkgrel=1
pkgdesc="Audiobook encoder and player with subtitle support"
arch=('x86_64')
url="https://github.com/mrfragger/substitcher"
license=('MIT')
depends=('gtk3')
provides=('substitcher')
conflicts=('substitcher')
source=("https://github.com/mrfragger/substitcher/releases/download/v${pkgver}/substitcher-x64.AppImage")
sha256sums=('ccad9f7c2594e68014ee1517be96f8ee49eeae6e6e0035232d07c8ba613c02bb')

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
