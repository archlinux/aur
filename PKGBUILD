# Maintainer: Ackerman
pkgname=root-app-bin
_pkgname=root-app
pkgver=0.9.86
pkgrel=2
pkgdesc="Root - The Discord alternative for communities"
arch=('x86_64' 'aarch64')
url="https://www.rootapp.com"
license=('Proprietary')
depends=('fuse2' 'gtk3' 'nss' 'libnotify' 'zlib' 'hicolor-icon-theme')
provides=('root-app')
conflicts=('root-app')
options=('!strip')

# Source URLs for both architectures
source_x86_64=("${pkgname}-${pkgver}-x86_64.AppImage::https://installer.rootapp.com/installer/Linux/X64/Root.AppImage")
source_aarch64=("${pkgname}-${pkgver}-aarch64.AppImage::https://installer.rootapp.com/installer/Linux/Arm64/Root.AppImage")

# CHECKSUMS
sha256sums_x86_64=('1fc2c73d77cc9b29a211bf202a1c59c12e3adca2d4aecaef27da54491fa6a5f5')
sha256sums_aarch64=('fe0bba052d095666158a39ff90042046b3fb728f6c9b4170474e60239892cfcb')

prepare() {
    # Make them executable so we can extract them
    chmod +x "$srcdir"/*.AppImage
}

package() {
    # 1. Select the correct AppImage for the current architecture
    if [ "$CARCH" = "x86_64" ]; then
        _appimage="$srcdir/${pkgname}-${pkgver}-x86_64.AppImage"
    else
        _appimage="$srcdir/${pkgname}-${pkgver}-aarch64.AppImage"
    fi

    # 2. Install the AppImage file to /opt
    install -Dm755 "$_appimage" "$pkgdir/opt/$_pkgname/$_pkgname.AppImage"

    # 3. Create the /usr/bin symlink
    install -d "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/$_pkgname.AppImage" "$pkgdir/usr/bin/rootapp"

    # 4. Extract content to find Icon and Desktop file
    "$_appimage" --appimage-extract > /dev/null

    # 5. ICON INSTALLATION
    find "squashfs-root" -maxdepth 1 -type f -name '*.png' -exec install -Dm644 {} \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/rootapp.png" \; -quit

    # 6. DESKTOP FILE INSTALLATION
    _desktop=$(find "squashfs-root" -maxdepth 1 -name "*.desktop" | head -n 1)

    if [ -n "$_desktop" ]; then
        install -Dm644 "$_desktop" "$pkgdir/usr/share/applications/rootapp.desktop"
        
        sed -i "s|^Exec=.*|Exec=rootapp|g" "$pkgdir/usr/share/applications/rootapp.desktop"
        
        sed -i "s|^Icon=.*|Icon=rootapp|g" "$pkgdir/usr/share/applications/rootapp.desktop"
    else
        # Create a desktop file
        echo "[Desktop Entry]
Name=Root
Exec=rootapp
Icon=rootapp
Type=Application
Categories=Network;" > "$pkgdir/usr/share/applications/rootapp.desktop"
        chmod 644 "$pkgdir/usr/share/applications/rootapp.desktop"
    fi
    
    # Clean up extraction folder
    rm -rf squashfs-root
}
