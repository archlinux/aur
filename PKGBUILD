# Maintainer: Ackerman
pkgname=root-app-bin
_pkgname=root-app
pkgver=0.9.86
pkgrel=4
pkgdesc="Root - The Discord alternative (Universal Extracted Build)"
arch=('x86_64' 'aarch64')
url="https://www.rootapp.com"
license=('Proprietary')

# Standard dependencies
depends=('gtk3' 'nss' 'libnotify' 'zlib' 'hicolor-icon-theme' 'alsa-lib' 
         'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'icu' 
         'fontconfig' 'freetype2' 'libglvnd')

provides=('root-app')
conflicts=('root-app')
options=('!strip')

source_x86_64=("${pkgname}-${pkgver}-x86_64.AppImage::https://installer.rootapp.com/installer/Linux/X64/Root.AppImage")
source_aarch64=("${pkgname}-${pkgver}-aarch64.AppImage::https://installer.rootapp.com/installer/Linux/Arm64/Root.AppImage")

sha256sums_x86_64=('1fc2c73d77cc9b29a211bf202a1c59c12e3adca2d4aecaef27da54491fa6a5f5')
sha256sums_aarch64=('fe0bba052d095666158a39ff90042046b3fb728f6c9b4170474e60239892cfcb')

prepare() {
    chmod +x "$srcdir"/*.AppImage
}

package() {
    # 1. Select Architecture
    if [ "$CARCH" = "x86_64" ]; then
        _appimage="$srcdir/${pkgname}-${pkgver}-x86_64.AppImage"
    else
        _appimage="$srcdir/${pkgname}-${pkgver}-aarch64.AppImage"
    fi

    # 2. Extract AppImage
    "$_appimage" --appimage-extract > /dev/null

    # 3. Install Directory
    install -d "$pkgdir/opt/$_pkgname"
    cp -r "squashfs-root/"* "$pkgdir/opt/$_pkgname/"

    # 4. Fix Permissions
    chmod 755 "$pkgdir/opt/$_pkgname/AppRun"
    find "$pkgdir/opt/$_pkgname" -name "chrome_crashpad_handler" -exec chmod 755 {} \;

    # 5. Symlink to /usr/bin
    install -d "$pkgdir/usr/bin"
    ln -s "/opt/$_pkgname/AppRun" "$pkgdir/usr/bin/rootapp"

    # 6. Install Icon
    find "$pkgdir/opt/$_pkgname" -maxdepth 1 -name "*.png" -exec install -Dm644 {} \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/rootapp.png" \; -quit

    # 7. Create/Install Desktop File
    install -d "$pkgdir/usr/share/applications"
    
    if [ -f "$pkgdir/opt/$_pkgname/rootapp.desktop" ]; then
        install -Dm644 "$pkgdir/opt/$_pkgname/rootapp.desktop" \
            "$pkgdir/usr/share/applications/rootapp.desktop"
    else
        echo "[Desktop Entry]
Name=Root
Exec=rootapp %U
Icon=rootapp
Type=Application
Categories=Network;" > "$pkgdir/usr/share/applications/rootapp.desktop"
    fi

    # 8. Clean Exec line 
    sed -i "s|^Exec=.*|Exec=rootapp %U|g" "$pkgdir/usr/share/applications/rootapp.desktop"
    sed -i "s|^Icon=.*|Icon=rootapp|g" "$pkgdir/usr/share/applications/rootapp.desktop"
    
    # 9. Cleanup
    rm -rf squashfs-root
}
