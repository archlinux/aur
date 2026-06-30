# Maintainer: poco <poco.a5v92@simplelogin.com>

pkgname=radaromega-appimage
_pkgname=RadarOmega
pkgver=5.7.2
pkgrel=3
pkgdesc="High-resolution NEXRAD radar weather app (requires subscription)"
arch=('x86_64')
url="https://www.radaromega.com/"
license=('proprietary')
depends=('zlib' 'hicolor-icon-theme' 'fuse2')
options=(!strip)

# Replace the URL below with the direct download link for the Linux AppImage
source=("${pkgname}-${pkgver}.AppImage::https://dl.todesktop.com/200402kk4yak2og/linux/appImage/x64")
sha256sums=('c8f3b2bbb56ed37d1c2fb815b4d851e0083e073d07f038942571a615f828b845')

prepare() {
    cd "$srcdir"
    chmod +x "${pkgname}-${pkgver}.AppImage"
    # Extract the AppImage cleanly to pull desktop and icon configurations
    ./"${pkgname}-${pkgver}.AppImage" --appimage-extract
}

package() {
    # 1. Install the main AppImage binary
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/usr/bin/radaromega"

    # 2. Move into the extracted folder to set up desktop integrations
    cd "${srcdir}/squashfs-root"

    # Find, modify, and install the .desktop file
    local desktop_file=$(find . -maxdepth 1 -name "*.desktop" -print -quit)
    if [ -n "$desktop_file" ]; then
        sed -i 's|Exec=.*|Exec=/usr/bin/radaromega %U|' "$desktop_file"
        sed -i 's|Icon=.*|Icon=radaromega|' "$desktop_file"
        install -Dm644 "$desktop_file" "${pkgdir}/usr/share/applications/radaromega.desktop"
    fi

    # Find and install the application icon
    local icon_file=$(find . -maxdepth 1 \( -name "*.png" -o -name "*.svg" \) -print -quit)
    if [ -n "$icon_file" ]; then
        local ext="${icon_file##*.}"
        install -Dm644 "$icon_file" "${pkgdir}/usr/share/pixmaps/radaromega.${ext}"
    fi
}
