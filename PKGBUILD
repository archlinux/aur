# Maintainer: Ishan Parihar <ishanp at protonmail dot com>
pkgname=neverwrite-bin
pkgver=0.3.5
pkgrel=1
pkgdesc='The bastard son between Cursor and Obsidian - local-first knowledge workspace with AI'
arch=('x86_64')
url='https://neverwrite.app/'
license=('Apache-2.0')
depends=('electron' 'libnotify' 'libxtst' 'nss' 'libxss' 'gtk3' 'mesa')
optdepends=('libappindicator-gtk3: Tray icon support')
options=('!strip')
source=("${url}releases/download/v${pkgver}/NeverWrite-${pkgver}-x64.AppImage"
        "neverwrite.desktop"
        "neverwrite.png")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
    chmod +x "NeverWrite-${pkgver}-x64.AppImage"
    # Extract the AppImage to get the icon
    if [ -f "NeverWrite-${pkgver}-x64.AppImage" ]; then
        # Try to extract icon from AppImage
        if ./NeverWrite-${pkgver}-x64.AppImage --appimage-extract > /dev/null 2>&1; then
            # Look for icon in extracted files
            find squashfs-root -name "*.png" -o -name "*.svg" | head -1 || true
        fi
    fi
}

package() {
    # Install the AppImage
    install -Dm755 "NeverWrite-${pkgver}-x64.AppImage" "${pkgdir}/opt/neverwrite/NeverWrite-${pkgver}.AppImage"

    # Create wrapper script
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/neverwrite" <<EOF
#!/bin/sh
exec /opt/neverwrite/NeverWrite-${pkgver}.AppImage "\$@"
EOF

    # Install desktop file
    install -Dm644 "neverwrite.desktop" "${pkgdir}/usr/share/applications/neverwrite.desktop"

    # Install icon
    install -Dm644 "neverwrite.png" "${pkgdir}/usr/share/pixmaps/neverwrite.png"
}
