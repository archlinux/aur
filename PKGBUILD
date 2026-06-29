# Maintainer: Eigent AI <https://github.com/eigent-ai>
pkgname=eigent-bin
pkgver=1.0.0
pkgrel=3
pkgdesc="AI-powered desktop agent for browser automation"
arch=('x86_64')
url="https://github.com/eigent-ai/eigent"
license=('MIT')
depends=('hicolor-icon-theme')
optdepends=(
    'tesseract: OCR support'
    'ffmpeg: video processing'
)
provides=('eigent')
conflicts=('eigent' 'eigent-git')
options=('!strip')
source=("${pkgname}-${pkgver}.AppImage::https://github.com/eigent-ai/eigent/releases/download/v${pkgver}/Eigent-${pkgver}.AppImage")
sha256sums=('SKIP')

prepare() {
    chmod +x "${pkgname}-${pkgver}.AppImage"
    "./${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -r squashfs-root/* "${pkgdir}/opt/${pkgname}/"

    # Desktop entry
    install -Dm644 "squashfs-root/eigent.desktop" "${pkgdir}/usr/share/applications/eigent.desktop"
    sed -i "s|Exec=.*|Exec=/usr/bin/eigent %U|g" "${pkgdir}/usr/share/applications/eigent.desktop"

    # Icon
    for size in 16 32 48 64 128 256 512; do
        if [[ -f "squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/eigent.png" ]]; then
            install -Dm644 "squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/eigent.png" \
                "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/eigent.png"
        fi
    done
    # Fallback icon
    [[ -f "squashfs-root/eigent.png" ]] && install -Dm644 "squashfs-root/eigent.png" \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/eigent.png"

    # Launcher script
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/eigent" << 'EOF'
#!/bin/bash
# eigent mutiert zur Laufzeit sein resources/prebuilt; /opt ist read-only.
# Pro Version einmal in ein schreibbares User-Dir spiegeln, von dort starten.
set -e
SRC=/opt/eigent-bin
DEST="${XDG_DATA_HOME:-$HOME/.local/share}/eigent-bin"
VER=$(pacman -Q eigent-bin 2>/dev/null | awk '{print $2}')
if [[ "$(cat "$DEST/.pkgver" 2>/dev/null)" != "$VER" ]]; then
    rm -rf "$DEST"; mkdir -p "$DEST"
    cp -a "$SRC/." "$DEST/"
    chmod -R u+w "$DEST"
    printf '%s' "$VER" > "$DEST/.pkgver"
fi
exec "$DEST/eigent" "$@"
EOF

    # Fix permissions. NOTE: do NOT blanket-chmod files to 644 -- the bundled
    # runtime binaries (prebuilt/bin/uv, bun, python) ship executable from the
    # AppImage and the backend spawns them; stripping +x breaks startup.
    find "${pkgdir}/opt/${pkgname}" -type d -exec chmod 755 {} \;
    chmod +x "${pkgdir}/opt/${pkgname}/eigent"
    [[ -f "${pkgdir}/opt/${pkgname}/chrome-sandbox" ]] && chmod 4755 "${pkgdir}/opt/${pkgname}/chrome-sandbox"
}
