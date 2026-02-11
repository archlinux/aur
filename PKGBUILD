# Maintainer: Ackerman
pkgname=root-app-bin
_pkgname=root-app
pkgver=0.9.86
pkgrel=1
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
    # Make them executable
    chmod +x "$srcdir"/*.AppImage
}

package() {
    # 1. Determine which architecture
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

    # 4. Extract content to get Icon and Desktop file
    "$_appimage" --appimage-extract > /dev/null

    # 5. Install Icon
    install -Dm644 "squashfs-root/rootapp.png" \
        "$pkgdir/usr/share/icons/hicolor/256x256/apps/rootapp.png"

    # 6. Install Desktop File
    install -Dm644 "squashfs-root/rootapp.desktop" \
        "$pkgdir/usr/share/applications/rootapp.desktop"

    # Fix the 'Exec' line to point to the installed binary
    sed -i "s|Exec=AppRun|Exec=rootapp|g" "$pkgdir/usr/share/applications/rootapp.desktop"
    
    # Fix the 'Icon' line to match the icon name installed
    sed -i "s|Icon=rootapp|Icon=rootapp|g" "$pkgdir/usr/share/applications/rootapp.desktop"
}
