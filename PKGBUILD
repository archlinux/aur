# Maintainer: Xyqra <xyqra@xyqra.ch>
pkgname=moltorino-bin
pkgver=7.5.5
pkgrel=1
pkgdesc="A fork of Chatterino7 with pinned messages, polls, predictions, and more"
arch=('x86_64')
url="https://moltorino.com"
license=('GPL-3.0-or-later')
depends=('fuse2')
options=('!strip')
provides=('moltorino')
conflicts=('moltorino')
DLAGENTS=('https::/usr/bin/curl -L %u -o %o')
source=("Moltorino.AppImage::https://moltorino.com/downloads/Moltorino.AppImage")
sha256sums=('SKIP')

prepare() {
    chmod +x "${srcdir}/Moltorino.AppImage"
    "${srcdir}/Moltorino.AppImage" --appimage-extract
}

package() {
    install -Dm755 "${srcdir}/Moltorino.AppImage" "${pkgdir}/opt/moltorino/Moltorino.AppImage"

    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/moltorino" << 'WRAPPER'
#!/bin/sh
exec /opt/moltorino/Moltorino.AppImage "$@"
WRAPPER
    chmod +x "${pkgdir}/usr/bin/moltorino"

    install -Dm644 "${srcdir}/squashfs-root/usr/share/applications/com.moltobenne.moltorino.desktop" \
        "${pkgdir}/usr/share/applications/com.moltobenne.moltorino.desktop"
    sed -i 's|Exec=.*|Exec=moltorino|' "${pkgdir}/usr/share/applications/com.moltobenne.moltorino.desktop"

    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/com.moltobenne.moltorino.png" \
        "${pkgdir}/usr/share/icons/hicolor/256x256/apps/com.moltobenne.moltorino.png"
}
