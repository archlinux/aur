# Maintainer: Siiire <siiire@pm.me>
pkgname=jellyfin-desktop-git-bin
pkgver=0.r1046.8d7ba66
pkgrel=1
epoch=1
pkgdesc="A desktop client for Jellium (Nightly AppImage)"
arch=('x86_64')
url="https://github.com/andrewrabert/jellium-desktop"
license=('GPL-2.0-only')
depends=('desktop-file-utils' 'hicolor-icon-theme')
provides=('jellyfin-desktop' 'jellyfin-desktop-git' 'jellium-desktop')
conflicts=('jellyfin-desktop' 'jellyfin-desktop-bin' 'jellyfin-desktop-git' 'jellyfin-desktop-cef-git' 'jellium-desktop')
options=('!strip')
source=("linux-appimage-${CARCH}.zip::https://nightly.link/andrewrabert/jellium-desktop/workflows/build-linux-appimage/main/linux-appimage-${CARCH}.zip")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir"
    chmod +x *.AppImage
    ./*.AppImage --appimage-extract
}

package() {
    install -d "${pkgdir}/opt/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"

    # Extract all contents into the opt directory
    cp -a "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname}/"

    # Create the new Jellium binary symlink
    ln -s "/opt/${pkgname}/AppRun" "${pkgdir}/usr/bin/jellium-desktop"
    
    # Create a legacy Jellyfin symlink so existing users' shortcuts and scripts do not break
    ln -s "/opt/${pkgname}/AppRun" "${pkgdir}/usr/bin/jellyfin-desktop"

    # Dynamically find the new desktop file regardless of its name
    _desktop=$(find "${pkgdir}/opt/${pkgname}" -maxdepth 1 -name "*.desktop" -print -quit)
    
    # Install it to the system under the new name
    install -Dm644 "$_desktop" "${pkgdir}/usr/share/applications/jellium-desktop.desktop"

    # Correct the execution path inside the desktop file to point to the new symlink
    sed -i "s|^Exec=[^ ]*|Exec=/usr/bin/jellium-desktop|g" "${pkgdir}/usr/share/applications/jellium-desktop.desktop"

    # Safely move icons if they exist
    if [ -d "${pkgdir}/opt/${pkgname}/usr/share/icons" ]; then
        install -d "${pkgdir}/usr/share/icons"
        cp -a "${pkgdir}/opt/${pkgname}/usr/share/icons/"* "${pkgdir}/usr/share/icons/"
    fi
}
