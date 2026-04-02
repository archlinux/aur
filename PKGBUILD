# Maintainer: sunkhan
pkgname=decibell
pkgver=0.2.0
pkgrel=3
pkgdesc="Decentralized text, voice chat, and streaming app"
arch=('x86_64')
url="https://github.com/sunkhan/decibell"
license=('MIT')
depends=(
    'fuse2'
)
provides=('decibell')
conflicts=('decibell-bin' 'decibell-git')
options=('!strip')
source=(
    "${pkgname}-${pkgver}.AppImage::https://github.com/sunkhan/decibell/releases/download/v${pkgver}/Decibell_${pkgver}_amd64.AppImage"
    "decibell.desktop"
)
sha256sums=('SKIP' 'SKIP')

package() {
    # Install AppImage as-is
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" \
        "${pkgdir}/opt/decibell/decibell.AppImage"

    # Launcher script
    install -d "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/decibell" << 'LAUNCHER'
#!/bin/sh
# Use host ALSA plugins so PipeWire audio routing works
export ALSA_PLUGIN_DIR=/usr/lib/alsa-lib
export LD_PRELOAD=/usr/lib/libasound.so.2
exec /opt/decibell/decibell.AppImage --no-sandbox "$@"
LAUNCHER
    chmod 755 "${pkgdir}/usr/bin/decibell"

    # Desktop entry
    install -Dm644 "${srcdir}/decibell.desktop" \
        "${pkgdir}/usr/share/applications/decibell.desktop"

    # Extract icon from AppImage
    cd "${srcdir}"
    chmod +x "${pkgname}-${pkgver}.AppImage"
    "./${pkgname}-${pkgver}.AppImage" --appimage-extract "usr/share/icons/*" 2>/dev/null || true
    if [ -d squashfs-root/usr/share/icons ]; then
        for icon in squashfs-root/usr/share/icons/hicolor/*/apps/decibell.png; do
            size_dir="$(echo "$icon" | grep -oP 'hicolor/\K[^/]+')"
            install -Dm644 "$icon" \
                "${pkgdir}/usr/share/icons/hicolor/${size_dir}/apps/decibell.png"
        done
    fi
}
