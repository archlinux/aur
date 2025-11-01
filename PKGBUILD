# Maintainer: Your Name <your.email@example.com>
pkgname=collapseloader-bin
pkgver=0.2.2
_commit=494cbb5
pkgrel=1
pkgdesc="GUI utility for launching Minecraft clients (precompiled binary)"
arch=('x86_64')
url="https://github.com/dest4590/CollapseLoader"
license=('MIT')
depends=('webkit2gtk' 'gtk3' 'libayatana-appindicator')
provides=('collapseloader')
conflicts=('collapseloader' 'collapseloader-git')
source=("collapseloader-${pkgver}.AppImage::https://github.com/dest4590/CollapseLoader/releases/download/prerelease-v${pkgver}-${_commit}/collapseloader_${pkgver}_amd64.AppImage")
sha256sums=('SKIP')
noextract=("collapseloader-${pkgver}.AppImage")

prepare() {
    # Make AppImage executable
    chmod +x "${srcdir}/collapseloader-${pkgver}.AppImage"
    
    # Extract AppImage contents
    cd "${srcdir}"
    "${srcdir}/collapseloader-${pkgver}.AppImage" --appimage-extract
}

package() {
    # Install the actual binary from extracted AppImage
    install -Dm755 "${srcdir}/squashfs-root/usr/bin/collapseloader" "${pkgdir}/usr/bin/collapseloader"
    
    # DO NOT copy system libraries - they already exist in the system
    # Only copy application-specific resources if needed
    
    # Install desktop file
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/collapseloader.desktop" <<EOF
[Desktop Entry]
Version=latest
Type=Application
Name=CollapseLoader
Comment=GUI utility for launching Minecraft clients (stable)
Exec=collapseloader
Icon=collapseloader
Terminal=false
Categories=Game;
Keywords=minecraft;launcher;
EOF
    
    # Install icon from extracted AppImage
    if [ -f "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/collapseloader.png" ]; then
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/collapseloader.png" \
            "${pkgdir}/usr/share/pixmaps/collapseloader.png"
    elif [ -f "${srcdir}/squashfs-root/collapseloader.png" ]; then
        install -Dm644 "${srcdir}/squashfs-root/collapseloader.png" \
            "${pkgdir}/usr/share/pixmaps/collapseloader.png"
    elif [ -f "${srcdir}/squashfs-root/.DirIcon" ]; then
        install -Dm644 "${srcdir}/squashfs-root/.DirIcon" \
            "${pkgdir}/usr/share/pixmaps/collapseloader.png"
    fi
}
