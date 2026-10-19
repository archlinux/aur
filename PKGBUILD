# Maintainer: Zachary Jones <jazzplayerl9@gmail.com>
pkgname=hueforge-bin
pkgver=0.9.4.4
pkgrel=1
pkgdesc="Color filament painting software for 3D printing"
arch=('x86_64')
url="https://thehueforge.com"
license=('custom:proprietary')
depends=(
    'fuse2'
    'libxcb'
    'xcb-util-cursor'
    'libxkbcommon-x11'
    'zlib'
    'hicolor-icon-theme'
)
optdepends=(
    'vulkan-icd-loader: for Vulkan rendering backend support'
    'uucp: group membership required for TD1 USB serial access'
)
provides=("hueforge=${pkgver}")
conflicts=('hueforge')
install=hueforge.install
options=('!strip')

# HueForge is proprietary software.
# Place 'HueForge_Linux_v${pkgver}.AppImage' in the same directory as this PKGBUILD.
source=("local://HueForge_Linux_v${pkgver}.AppImage")
sha256sums=('f35fce870ec9939a8116b0ffd447561c4e0c76c89943b9d19c3d320178e8c649')

prepare() {
    chmod +x "$srcdir/HueForge_Linux_v${pkgver}.AppImage"
    cd "$srcdir"

    # Extract desktop file and icons directly from the AppImage
    ./"HueForge_Linux_v${pkgver}.AppImage" --appimage-extract "HueForge.desktop"
    ./"HueForge_Linux_v${pkgver}.AppImage" --appimage-extract "usr/share/icons/*"

    # Normalize desktop file for desktop integration
    sed -i \
        -e 's|^Exec=.*|Exec=hueforge %U|' \
        -e 's|^Icon=.*|Icon=hueforge|' \
        -e 's|^Categories=.*|Categories=Graphics;3DGraphics;|' \
        "squashfs-root/HueForge.desktop"

    # Append additional desktop metadata
    {
        echo "Comment=Color filament painting software for 3D printing"
        echo "StartupWMClass=HueForge"
        echo "Keywords=3d;printing;filament;painting;hueforge;"
    } >> "squashfs-root/HueForge.desktop"
}

package() {
    # 1. Install AppImage binary into /opt/hueforge/
    install -Dm755 "$srcdir/HueForge_Linux_v${pkgver}.AppImage" "$pkgdir/opt/hueforge/HueForge.AppImage"

    # 2. Generate and install CLI launcher script to /usr/bin/hueforge & HueForge alias
    install -d "$pkgdir/usr/bin"
    cat << 'EOF' > "$pkgdir/usr/bin/hueforge"
#!/bin/sh
exec /opt/hueforge/HueForge.AppImage "$@"
EOF
    chmod 755 "$pkgdir/usr/bin/hueforge"
    ln -s hueforge "$pkgdir/usr/bin/HueForge"

    # 3. Install desktop entry
    install -Dm644 "$srcdir/squashfs-root/HueForge.desktop" "$pkgdir/usr/share/applications/hueforge.desktop"

    # 4. Install application icons extracted from AppImage
    install -Dm644 "$srcdir/squashfs-root/usr/share/icons/hicolor/256x256/apps/HueForge.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/hueforge.png"
    install -Dm644 "$srcdir/squashfs-root/usr/share/icons/hicolor/256x256/apps/HueForge.png" \
        "$pkgdir/usr/share/pixmaps/hueforge.png"
}
