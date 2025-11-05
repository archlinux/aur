# Maintainer: BoredYama sagargaud88@gmail.com

pkgname=capacities-bin
pkgver=1.54.17
pkgrel=1
pkgdesc="A note-taking app for organizing your knowledge"
arch=('x86_64')
url="https://capacities.io"
license=('custom')
depends=('fuse2' 'zlib' 'hicolor-icon-theme')
provides=('capacities')
conflicts=('capacities')
options=(!strip)
source=("${pkgname}-${pkgver}.AppImage::https://capacities-desktop-app.fra1.cdn.digitaloceanspaces.com/Capacities-${pkgver}.AppImage")
sha256sums=('e40f8bad35f5a4c4b12575ff23b8101b266f6617f841be4cd2c66711cb8fd844')

prepare() {
    chmod +x "${pkgname}-${pkgver}.AppImage"
    ./"${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
    # Install the AppImage
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" \
        "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"
    
    # Create launcher script
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/capacities" << 'EOF'
#!/bin/sh
exec /opt/capacities-bin/capacities-bin.AppImage "$@"
EOF
    chmod +x "${pkgdir}/usr/bin/capacities"
    
    # Install desktop file
    install -Dm644 "${srcdir}/squashfs-root/capacities.desktop" \
        "${pkgdir}/usr/share/applications/capacities.desktop"
    
    # Fix Exec line in desktop file
    sed -i 's|Exec=AppRun|Exec=/usr/bin/capacities|g' \
        "${pkgdir}/usr/share/applications/capacities.desktop"
    
    # Install icons
    for size in 16 32 48 64 128 256 512; do
        if [ -f "${srcdir}/squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/capacities.png" ]; then
            install -Dm644 \
                "${srcdir}/squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/capacities.png" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/capacities.png"
        fi
    done
    
    # Fallback icon
    if [ -f "${srcdir}/squashfs-root/capacities.png" ]; then
        install -Dm644 "${srcdir}/squashfs-root/capacities.png" \
            "${pkgdir}/usr/share/pixmaps/capacities.png"
    fi
}
