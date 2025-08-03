# Maintainer: Ben Copeland <ben at copeland $dot$ me uk>
# Based on original by Thor K. H. and others
pkgname=whatpulse-appimage
pkgver=5.10.3
pkgrel=1
pkgdesc="Measures your keyboard, mouse and application usage, network traffic and uptime."
arch=('x86_64')
url="https://www.whatpulse.org"
license=('custom:whatpulse_tos')
depends=(
    'freetype2' 'xcb-util-image' 'libxkbcommon' 'libxkbcommon-x11'
    'xcb-util-renderutil' 'gcc-libs' 'dbus' 'krb5' 'xcb-util-wm'
    'glib2' 'libx11' 'fontconfig' 'libglvnd' 'xcb-util-keysyms'
    'openssl' 'glibc' 'libxcb' 'zlib' 'hicolor-icon-theme'
)
makedepends=(
    'imagemagick'
    'patchelf'
)
optdepends=(
    'libpcap: for capturing network statistics'
)
source=(
    'whatpulse.desktop'
    'whatpulse.sh'
    'LICENSE'
)
source_x86_64=("${pkgname}-latest-amd64.AppImage::https://releases.whatpulse.org/latest/linux/whatpulse-linux-latest_amd64.AppImage")
sha256sums=(
    'SKIP'
    'SKIP'
    'SKIP'
)
sha256sums_x86_64=('SKIP')
noextract=("${pkgname}-latest-amd64.AppImage")

_extract() {
    ./"${pkgname}-latest-amd64.AppImage" --appimage-extract "$1"
}

prepare() {
    chmod +x "${pkgname}-latest-amd64.AppImage"

    _extract usr/bin/whatpulse
    _extract usr/lib
    _extract usr/plugins
    _extract 'whatpulse.png'
    _extract 'usr/share/icons/hicolor/512x512/apps/whatpulse.png'

    ln -sf squashfs-root sfs

    find sfs/usr/lib -type f -not -name 'libQt6*.so.*' -not -name 'libicu*.so.*' -delete
    find sfs/usr/plugins -type f -name 'libqsql*.so' -not -name 'libqsqlite.so' -delete

    find sfs/usr/{bin,lib,plugins} -type f -executable \
        -exec patchelf --set-rpath '/usr/lib/whatpulse/lib:/usr/lib' '{}' + 2>/dev/null || true
}

package() {
    install -Dm755 whatpulse.sh "${pkgdir}/usr/bin/whatpulse"
    install -Dm755 sfs/usr/bin/whatpulse "${pkgdir}/usr/lib/whatpulse/whatpulse"

    find sfs/usr/lib -type f -exec install -Dm644 -t "${pkgdir}/usr/lib/whatpulse/lib" '{}' +

    find sfs/usr/plugins -mindepth 1 -type d \
        -not \( -name imageformats -or -name xcbglintegrations \) -printf '%f\0' |
        xargs -0I '<>' find 'sfs/usr/plugins/<>' -type f \
            -exec install -Dm644 -t "${pkgdir}/usr/lib/whatpulse/plugins/<>" '{}' +

    install -Dm644 whatpulse.desktop "${pkgdir}/usr/share/applications/whatpulse.desktop"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

    for size in 16 20 22 24 28 32 36 44 48 64 72 96 128 150 192 256 310 384 512 1024; do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
        magick sfs/whatpulse.png \
            +gravity -crop 615x680+0+0 +repage \
            -resize "${size}x${size}" -background none \
            -gravity center -extent "${size}x${size}" \
            xc:"#656565" -channel RGB -clut \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/whatpulse.png"
    done

    # Note: Network monitoring capabilities are disabled to prevent segfaults
    # If you need network monitoring, uncomment the following line:
    # setcap cap_net_raw,cap_net_admin=eip "${pkgdir}/usr/lib/whatpulse/whatpulse"

}
