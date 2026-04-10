# Maintainer: v0idhrt <https://github.com/v0idhrt>
pkgname=disarmed-bin
pkgver=0.2.0
pkgrel=2
pkgdesc="VPN client with sing-box backend"
arch=('x86_64')
url="https://github.com/v0idhrt/disarmed"
license=('GPL-3.0-only')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator')
provides=('disarmed')
conflicts=('disarmed' 'disarmed-git')
install=disarmed-bin.install
options=('!strip')

source=(
    "${pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/disarmed_${pkgver}_amd64.AppImage"
    "${pkgname}-${pkgver}-daemon::${url}/releases/download/v${pkgver}/disarmed-daemon"
    "disarmed.desktop"
    "disarmed.service"
    "LICENSE::https://raw.githubusercontent.com/v0idhrt/disarmed/main/LICENSE"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

prepare() {
    chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
    "${srcdir}/${pkgname}-${pkgver}.AppImage" --appimage-extract >/dev/null 2>&1
}

package() {
    # GUI binary
    install -Dm755 "${srcdir}/squashfs-root/usr/bin/disarmed" \
        "${pkgdir}/usr/bin/disarmed"

    # Daemon binary — GUI's find_binary() searches PATH for "disarmedd"
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}-daemon" \
        "${pkgdir}/usr/bin/disarmedd"

    # Shared libraries from AppImage
    find "${srcdir}/squashfs-root/usr/lib" -name "*.so*" -exec \
        install -Dm644 {} "${pkgdir}/usr/lib/disarmed/{}" \; 2>/dev/null || true

    # Desktop entry
    install -Dm644 "${srcdir}/disarmed.desktop" \
        "${pkgdir}/usr/share/applications/disarmed.desktop"

    # Icons from extracted AppImage
    for size in 32x32 128x128 256x256 512x512; do
        local icon="${srcdir}/squashfs-root/usr/share/icons/hicolor/${size}/apps/disarmed.png"
        if [ -f "$icon" ]; then
            install -Dm644 "$icon" \
                "${pkgdir}/usr/share/icons/hicolor/${size}/apps/disarmed.png"
        fi
    done

    # Fallback: install any icon found in the AppImage
    if [ ! -f "${pkgdir}/usr/share/icons/hicolor/128x128/apps/disarmed.png" ]; then
        local fallback
        fallback=$(find "${srcdir}/squashfs-root" -name "*.png" -path "*/icons/*" | head -1)
        if [ -n "$fallback" ]; then
            install -Dm644 "$fallback" \
                "${pkgdir}/usr/share/icons/hicolor/128x128/apps/disarmed.png"
        fi
    fi

    # Systemd service
    install -Dm644 "${srcdir}/disarmed.service" \
        "${pkgdir}/usr/lib/systemd/system/disarmed.service"

    # Config directory
    install -dm755 "${pkgdir}/etc/disarmed"

    # License
    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
