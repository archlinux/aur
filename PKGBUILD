# Maintainer: Siiire <siiire@pm.me>
pkgname=jellium-desktop-bin
pkgver=0.r1156.1b73a13
pkgrel=2
epoch=1
pkgdesc="An unofficial desktop client for Jellyfin"
arch=('x86_64')
url="https://github.com/andrewrabert/jellium-desktop"
license=('GPL-2.0-only')
depends=('glibc' 'gcc-libs' 'hicolor-icon-theme')
provides=('jellyfin-desktop' 'jellium-desktop')
conflicts=('jellyfin-desktop' 'jellyfin-media-player' 'jellium-desktop')
options=('!strip')
source=("${pkgname}-${pkgver}-${CARCH}.zip::https://nightly.link/andrewrabert/jellium-desktop/workflows/build-linux-appimage/main/linux-appimage-${CARCH}.zip")
sha256sums=('SKIP')

prepare() {
    cd "$srcdir"
    rm -rf squashfs-root
    chmod +x *.AppImage
    ./*.AppImage --appimage-extract

    # Normalize broken 700 directory permissions from upstream AppImage
    chmod -R u+rwX,go+rX,go-w "${srcdir}/squashfs-root"
}

package() {
    install -d "${pkgdir}/opt/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"

    cp -a "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname}/"

    ln -s "/opt/${pkgname}/AppRun" "${pkgdir}/usr/bin/jellium-desktop"
    ln -s "/opt/${pkgname}/AppRun" "${pkgdir}/usr/bin/jellyfin-desktop"

    _desktop=$(find "${pkgdir}/opt/${pkgname}" -maxdepth 1 -name "*.desktop" -print -quit)
    _desktop_name=$(basename "$_desktop")
    install -Dm644 "$_desktop" "${pkgdir}/usr/share/applications/${_desktop_name}"
    sed -i "s|^Exec=[^ ]*|Exec=/usr/bin/jellium-desktop|g" "${pkgdir}/usr/share/applications/${_desktop_name}"

    if [ -d "${pkgdir}/opt/${pkgname}/usr/share/icons" ]; then
        install -d "${pkgdir}/usr/share/icons"
        cp -a "${pkgdir}/opt/${pkgname}/usr/share/icons/"* "${pkgdir}/usr/share/icons/"
        rm -rf "${pkgdir}/opt/${pkgname}/usr/share/icons"
    fi
}
