# Maintainer: YangYuS8 <YangYuS8@163.com>

pkgname=hexhub-bin
pkgver=1.2.8
pkgrel=1
pkgdesc="Database, Docker, SSH, SFTP - All in one"
arch=('x86_64')
url='https://www.hexhub.cn/'
license=('GPL')
depends=('fuse2' 'gtk3')
conflicts=()
options=("!strip" "!debug")
source=("https://oss.hexhub.cn/plugin/HexHub-amd64-appimage-${pkgver}.AppImage")
sha256sums=('e9e77aecc8e869aa0d3dfb2b871692f275ce88b5e927db933156e07a4b7a673f')

_appimage="HexHub-amd64-appimage-${pkgver}.AppImage"

prepare() {
    chmod +x "$_appimage"
    ./"$_appimage" --appimage-extract
}

build() {
    # Key fix: Check for actual desktop file presence
    if [ -f "squashfs-root/hexhub.desktop" ]; then
        desktop_file="squashfs-root/hexhub.desktop"
    elif [ -f "squashfs-root/appimagetool.desktop" ]; then
        desktop_file="squashfs-root/appimagetool.desktop"
    else
        echo "Warning: Desktop file not found, will create during installation"
        return 0
    fi

    # Modify the correct desktop file
    sed -i \
        -e "s|Exec=.*|Exec=/usr/bin/hexhub|" \
        -e "s|Icon=.*|Icon=hexhub|" \
        -e "s|Name=.*|Name=HexHub|" \
        "$desktop_file"

    # Optimize AppRun working directory logic
    sed -i \
        -e 's|cd "$(dirname "$0")"|cd /opt/hexhub-bin|' \
        "squashfs-root/AppRun"
}

package() {
    # Install application files
    install -dm755 "$pkgdir/opt/$pkgname"
    cp -r squashfs-root/* "$pkgdir/opt/$pkgname"

    # Create launcher script (stable solution)
    install -dm755 "$pkgdir/usr/bin"
    cat > "$pkgdir/usr/bin/hexhub" << 'EOF'
#!/bin/sh
# Set library path and run application with GPU fallback
export LD_LIBRARY_PATH="/opt/hexhub-bin/usr/lib:${LD_LIBRARY_PATH}"
exec /opt/hexhub-bin/AppRun \
    --disable-gpu \
    --disable-software-rasterizer \
    --no-sandbox \
    "$@"
EOF
    chmod +x "$pkgdir/usr/bin/hexhub"

    # Force create correct desktop file
    install -Dm644 /dev/null "$pkgdir/usr/share/applications/hexhub.desktop"
    cat > "$pkgdir/usr/share/applications/hexhub.desktop" << 'EOF'
[Desktop Entry]
Name=HexHub
Comment=Database, Docker, SSH, SFTP - All in one
Exec=/usr/bin/hexhub
Icon=hexhub
Terminal=false
Type=Application
Categories=Development;
StartupWMClass=HexHub
EOF

    # Install icon
    install -Dm644 "$pkgdir/opt/$pkgname/hexhub.png" \
        "$pkgdir/usr/share/icons/hicolor/512x512/apps/hexhub.png"
}
