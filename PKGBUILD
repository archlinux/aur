# Maintainer: Devel <Denislav08@proton.me>
# Contributor: tychy

pkgname=upnote-bin
pkgver=9.17.4
pkgrel=1
pkgdesc="A modern note-taking app with Markdown support"
arch=('x86_64')
url="https://getupnote.com/"
license=('LicenseRef-Proprietary')
depends=('fuse2' 'gtk3' 'nss')
provides=('upnote')
conflicts=('upnote' 'upnote-appimage')
options=('!strip')
source=("UpNote-${pkgver}.AppImage::https://download.getupnote.com/app/UpNote.AppImage"
        "upnote.desktop")
sha256sums=('773e80e30081c3e8feb5aefd1854f3d420b2b940c387e0e004036768b08e1398'
            'b40297727050ae7e01632053e1de4437982cc9495ba0ab3cb67f0ebc583ec8c7')
noextract=("UpNote-${pkgver}.AppImage")

prepare() {
    chmod +x "UpNote-${pkgver}.AppImage"
    ./UpNote-${pkgver}.AppImage --appimage-extract &>/dev/null
}

package() {
    install -Dm755 "UpNote-${pkgver}.AppImage" "${pkgdir}/opt/upnote/upnote.AppImage"
    install -Dm644 "upnote.desktop" "${pkgdir}/usr/share/applications/upnote.desktop"

    # Install icon
    if [[ -f "squashfs-root/upnote.png" ]]; then
        install -Dm644 "squashfs-root/upnote.png" "${pkgdir}/usr/share/pixmaps/upnote.png"
    elif [[ -f "squashfs-root/icon.png" ]]; then
        install -Dm644 "squashfs-root/icon.png" "${pkgdir}/usr/share/pixmaps/upnote.png"
    fi

    # Install license
    find squashfs-root -maxdepth 1 -iname 'LICENSE*' -exec install -Dm644 {} "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" \; 2>/dev/null || true

    # Create launcher script
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/upnote/upnote.AppImage "${pkgdir}/usr/bin/upnote"
}
