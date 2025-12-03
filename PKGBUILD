# Maintainer: Leonie Ain <me@koyu.space>
pkgname=mrupdater
pkgver=1.7.0
pkgrel=2
pkgdesc="ModRetro's official tool for updating your Chromatic firmware"
arch=('x86_64')
url="https://modretro.com"
license=('unknown')
depends=('fuse2' 'zlib')
source=(
    'mrupdater.zip::https://s3.us-east-1.amazonaws.com/updates.modretro.com/apps/MRUpdater-linux-x86_64.zip'
    'mrupdater.desktop'
    '99-modretro.rules'
)
sha256sums=('4eaffc24ad54a63ab983ae03278f3cc011c41356f17cb63cc1c6e1d6cc193551'
            'd9f9ed521e6b1fa7a1ed29706ecd9c82e0fab325d569e0b23bc602da2723c20c'
            '850c99f36f919d337070a22d8d0b711f85d140d0e7e744cc9545d52d8a51de32')
options=('!strip')

package() {
    cd "$srcdir"
    
    # Find the AppImage file
    appimage=$(find . -name "*.AppImage" -type f | head -n 1)
    
    if [ -z "$appimage" ]; then
        error "No AppImage found in the archive"
        return 1
    fi
    
    # Extract icon from AppImage
    chmod +x "$appimage"
    "$appimage" --appimage-extract >/dev/null 2>&1 || true
    
    # Find and install icon
    if [ -d "squashfs-root" ]; then
        # Look for icon files
        icon=$(find squashfs-root -name "*.png" -o -name "*.svg" | grep -i icon | head -n 1)
        if [ -n "$icon" ]; then
            iconext="${icon##*.}"
            install -Dm644 "$icon" "$pkgdir/usr/share/pixmaps/mrupdater.$iconext"
        fi
    fi
    
    # Install the AppImage
    install -Dm755 "$appimage" "$pkgdir/usr/bin/mrupdater"
    
    # Install desktop entry from srcdir
    install -Dm644 "$srcdir/mrupdater.desktop" "$pkgdir/usr/share/applications/mrupdater.desktop"
    
    # Install udev rules
    install -Dm644 "$srcdir/99-modretro.rules" "$pkgdir/etc/udev/rules.d/99-modretro.rules"
}
