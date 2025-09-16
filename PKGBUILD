# Maintainer: Mathys Lopinto <mathys@mathys.ovh>
# Implementation to AUR from aaddrick/claude-desktop-debian github repository

pkgname=claude-desktop-appimage
pkgver=1.1.5+claude0.13.11
pkgrel=3
pkgdesc="Claude Desktop for Linux - AppImage version from aaddrick/claude-desktop-debian"
arch=('x86_64')
url="https://github.com/aaddrick/claude-desktop-debian"
license=('MIT' 'Apache')
depends=('fuse2')
options=(!strip)
provides=('claude-desktop')
conflicts=('claude-desktop')

# AppImage source
_appimage_name="claude-desktop-0.13.11-amd64.AppImage"
source=("${_appimage_name}::https://github.com/aaddrick/claude-desktop-debian/releases/download/v${pkgver}/${_appimage_name}"
        "claude-desktop.desktop")
noextract=("${_appimage_name}")

# File checksums
sha256sums=('90a9edcd5cbde4d5dea61f5940cd56bc03ee3561a3badcf51cd0d6dd4303aed8'
            '6cb35430398ef6b534ec5ee2d50c90a6d370d318f40b9f7d42e9545b196af56e')

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
            install -Dm644 "${srcdir}/squashfs-root/io.github.aaddrick.claude-desktop-debian.png" \
                "${pkgdir}/usr/share/pixmaps/claude-desktop.png"
        fi
    fi
}
