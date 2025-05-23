# Maintainer: 0xGingi <gingi@example.com>
pkgname=t3-chat-electron-git
_pkgname=t3-chat-electron
pkgver=1.0.0.r6.6c23952
pkgrel=1
pkgdesc="A Desktop Application for using T3 AI Chat"
arch=('x86_64')
url="https://github.com/0xGingi/T3_Chat_Electron"
license=('MIT')
depends=('electron' 'gtk3' 'libxss' 'nss')
makedepends=('git' 'bun')
optdepends=('libappindicator-gtk3: for tray icon support')
source=("git+https://github.com/0xGingi/T3_Chat_Electron.git")
sha256sums=('SKIP')

pkgver() {
    cd "T3_Chat_Electron"
    printf "1.0.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "T3_Chat_Electron"
    bun install
    bun run compile
}

package() {
    cd "T3_Chat_Electron"
    
    install -dm755 "$pkgdir/usr/lib/$_pkgname"
    cp -r build "$pkgdir/usr/lib/$_pkgname/"
    cp package.json "$pkgdir/usr/lib/$_pkgname/"
    cp -r icons "$pkgdir/usr/lib/$_pkgname/"
    
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/$_pkgname" << EOF
#!/bin/bash
cd /usr/lib/$_pkgname
exec electron . "\$@"
EOF
    chmod +x "$pkgdir/usr/bin/$_pkgname"
    
    install -Dm644 "aur/t3-chat-desktop.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    
    for size in 32x32 128x128; do
        install -Dm644 "icons/$size.png" "$pkgdir/usr/share/icons/hicolor/$size/apps/$_pkgname.png"
    done
    
    install -Dm644 "icons/icon.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
    
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
} 
