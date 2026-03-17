# Maintainer: Mike <miguelsilva5989@gmail.com>
pkgname=streamsquire-bin
pkgver=0.2.11
pkgrel=1
pkgdesc="AI streaming assistant — auto-clips, chat monitoring, transcription"
arch=('x86_64')
url="https://streamsquire.app"
license=('custom')
depends=('webkit2gtk-4.1' 'libappindicator-gtk3')
provides=('streamsquire')
conflicts=('streamsquire')
source=("streamsquire-${pkgver}.AppImage::https://releases.streamsquire.app/v${pkgver}/streamsquire-linux-x64.AppImage")
sha256sums=('SKIP')
options=(!strip !debug)

prepare() {
    chmod +x "${srcdir}/streamsquire-${pkgver}.AppImage"
    "${srcdir}/streamsquire-${pkgver}.AppImage" --appimage-extract
}

package() {
    # Install app to /opt
    install -dm755 "${pkgdir}/opt/streamsquire"
    cp -ra "${srcdir}/squashfs-root/." "${pkgdir}/opt/streamsquire/"
    chmod -R a+rX "${pkgdir}/opt/streamsquire/"

    # Launcher script (symlink breaks AppRun's dirname resolution)
    install -dm755 "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/streamsquire" <<'LAUNCHER'
#!/bin/bash
exec /opt/streamsquire/AppRun "$@"
LAUNCHER
    chmod 755 "${pkgdir}/usr/bin/streamsquire"

    # Desktop entry
    install -Dm644 "${srcdir}/squashfs-root/StreamSquire.desktop" \
        "${pkgdir}/usr/share/applications/streamsquire.desktop"
    sed -i 's|Exec=.*|Exec=/usr/bin/streamsquire %U|' \
        "${pkgdir}/usr/share/applications/streamsquire.desktop"
    sed -i 's|Icon=.*|Icon=streamsquire|' \
        "${pkgdir}/usr/share/applications/streamsquire.desktop"

    # Icons
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/32x32/apps/streamsquire-shell.png" \
        "${pkgdir}/usr/share/icons/hicolor/32x32/apps/streamsquire.png"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/128x128/apps/streamsquire-shell.png" \
        "${pkgdir}/usr/share/icons/hicolor/128x128/apps/streamsquire.png"
}
