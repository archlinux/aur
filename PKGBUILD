# Maintainer: Siiire <siiire@pm.me>
pkgname=jellyfin-desktop-git-bin
pkgver=0.r1008.72867f3
pkgrel=1
epoch=1
pkgdesc="A desktop client for Jellyfin (Nightly AppImage)"
arch=('x86_64')
url="https://github.com/jellyfin/jellyfin-desktop"
license=('GPL-2.0-only')
depends=('desktop-file-utils' 'hicolor-icon-theme')
provides=('jellyfin-desktop' 'jellyfin-desktop-git')
conflicts=('jellyfin-desktop' 'jellyfin-desktop-bin' 'jellyfin-desktop-git' 'jellyfin-desktop-cef-git')
options=('!strip')
source=("linux-appimage-${CARCH}.zip::https://nightly.link/jellyfin/jellyfin-desktop/workflows/build-linux-appimage/main/linux-appimage-${CARCH}.zip")
sha256sums=('SKIP')
prepare() {
    cd "$srcdir"
    chmod +x Jellyfin*.AppImage
    ./Jellyfin*.AppImage --appimage-extract
}
package() {
    install -d "${pkgdir}/opt/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    cp -a "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname}/"
    ln -s "/opt/${pkgname}/AppRun" "${pkgdir}/usr/bin/jellyfin-desktop"
    _desktop=$(find "${pkgdir}/opt/${pkgname}" -maxdepth 1 -name "*.desktop" -print -quit)
    install -Dm644 "$_desktop" "${pkgdir}/usr/share/applications/jellyfin-desktop.desktop"
    sed -i "s|^Exec=[^ ]*|Exec=/usr/bin/jellyfin-desktop|g" "${pkgdir}/usr/share/applications/jellyfin-desktop.desktop"
    if [ -d "${pkgdir}/opt/${pkgname}/usr/share/icons" ]; then
        install -d "${pkgdir}/usr/share/icons"
        cp -a "${pkgdir}/opt/${pkgname}/usr/share/icons/"* "${pkgdir}/usr/share/icons/"
    fi
}
