# Maintainer: Mathys Lopinto <mathys@mathys.ovh>
# Implementation to AUR from aaddrick/claude-desktop-debian github repository

pkgname=claude-desktop-appimage
pkgver=1.1.9+claude0.14.10
pkgrel=1
pkgdesc="Claude Desktop for Linux - AppImage version from aaddrick/claude-desktop-debian"
arch=('x86_64')
url="https://github.com/aaddrick/claude-desktop-debian"
license=('MIT' 'Apache')
depends=('fuse2' 'qt5-base' 'qt6-base')
options=(!strip)
provides=('claude-desktop')
conflicts=('claude-desktop')

# AppImage source
_appimage_name="claude-desktop-0.14.10-amd64.AppImage"
source=("${_appimage_name}::https://github.com/aaddrick/claude-desktop-debian/releases/download/v${pkgver}/${_appimage_name}"
        "claude-desktop.desktop")
noextract=("${_appimage_name}")

# File checksums
sha256sums=('b821ebdbd737bbb132a897ea5ab0f0024fc48fac5cd1eb34dfb32fe07f1d7334'
            'ab0469e2e127050193ca556f87af8914d93bbde8f31d673a2f279aedbc944f3d')

prepare() {
    # Make the AppImage executable
    chmod +x "${srcdir}/${_appimage_name}"
    
    # Extract the AppImage to inspect its contents
    "${srcdir}/${_appimage_name}" --appimage-extract > /dev/null 2>&1
}

package() {
    # Install the AppImage to /opt
    install -Dm755 "${srcdir}/${_appimage_name}" "${pkgdir}/opt/claude-desktop/claude-desktop.AppImage"
    
    # Add a symlink to /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/opt/claude-desktop/claude-desktop.AppImage" "${pkgdir}/usr/bin/claude-desktop"
    
    # Install the .desktop file
    install -Dm644 "${srcdir}/claude-desktop.desktop" "${pkgdir}/usr/share/applications/claude-desktop.desktop"
    
    # Install icons from the extracted AppImage
    if [ -d "${srcdir}/squashfs-root" ]; then
        # Install the icon if it exists
        if [ -f "${srcdir}/squashfs-root/io.github.aaddrick.claude-desktop-debian.png" ]; then
            # Install in pixmaps
            install -Dm644 "${srcdir}/squashfs-root/io.github.aaddrick.claude-desktop-debian.png" \
                "${pkgdir}/usr/share/pixmaps/claude-desktop.png"
            # Install in hicolor icon theme
            install -Dm644 "${srcdir}/squashfs-root/io.github.aaddrick.claude-desktop-debian.png" \
                "${pkgdir}/usr/share/icons/hicolor/256x256/apps/claude-desktop.png"
            # Install with original name too
            install -Dm644 "${srcdir}/squashfs-root/io.github.aaddrick.claude-desktop-debian.png" \
                "${pkgdir}/usr/share/pixmaps/io.github.aaddrick.claude-desktop-debian"
            install -Dm644 "${srcdir}/squashfs-root/io.github.aaddrick.claude-desktop-debian.png" \
                "${pkgdir}/usr/share/pixmaps/io.github.aaddrick.claude-desktop-debian.png"
        fi
    fi
}
