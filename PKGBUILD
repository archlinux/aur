# Maintainer: Mike <miguelsilva5989@gmail.com>
pkgname=streamsquire-bin
pkgver=0.2.4
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
    cd "${srcdir}/squashfs-root"

    # Install app to /opt
    install -dm755 "${pkgdir}/opt/streamsquire"
    cp -r . "${pkgdir}/opt/streamsquire/"

    # Symlink binary
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/streamsquire/AppRun "${pkgdir}/usr/bin/streamsquire"

    # Desktop entry
    local desktop_file=$(find . -maxdepth 1 -name "*.desktop" | head -1)
    if [ -n "$desktop_file" ]; then
        install -Dm644 "$desktop_file" "${pkgdir}/usr/share/applications/streamsquire.desktop"
        sed -i 's|Exec=.*|Exec=/usr/bin/streamsquire %U|' "${pkgdir}/usr/share/applications/streamsquire.desktop"
        sed -i 's|Icon=.*|Icon=streamsquire|' "${pkgdir}/usr/share/applications/streamsquire.desktop"
    fi

    # Icons
    for size in 32x32 64x64 128x128 256x256; do
        local icon=$(find . -path "*/hicolor/${size}/apps/*" -name "*.png" | head -1)
        [ -n "$icon" ] && install -Dm644 "$icon" \
            "${pkgdir}/usr/share/icons/hicolor/${size}/apps/streamsquire.png"
    done
}
