# Maintainer: Julian Price <juliangreyprice@gmail.com>
# Previous Maintainer: Thor K. H. <thor alfakrøll roht dott no>
# Previous Co-Maintainer: Mubashshir <ahmubashshir@gmail.com>
# Contributor: Tim Besard <tim $dot$ besard $at$ gmail $dot$ com>
# Contributor: Jelle van der Waa <jellevdwaa @ gmail.com>
# Contributor: Pieter Kokx <pieter $at$ kokx $dot$ .nl>

pkgname=whatpulse
pkgver=latest
pkgrel=2
pkgdesc="Measures your keyboard, mouse, app usage, network traffic and uptime."
arch=('x86_64')
url="https://www.whatpulse.org"
license=('custom:whatpulse_tos')

depends=(
    freetype2 xcb-util-image libxkbcommon libxkbcommon-x11 xcb-util-renderutil gcc-libs dbus krb5
    xcb-util-wm glib2 libx11 fontconfig libglvnd xcb-util-keysyms openssl-1.1 glibc libxcb zlib
    hicolor-icon-theme
)
makedepends=(imagemagick patchelf)
optdepends=('libpcap: for capturing network statistics')

source=(
    "whatpulse.desktop"
    "whatpulse.sh"
    "LICENSE"
)
source_x86_64=("${pkgname}.AppImage::https://releases.whatpulse.org/latest/linux/whatpulse-linux-latest_amd64.AppImage")

sha256sums=('SKIP' 'SKIP' 'SKIP')
sha256sums_x86_64=('SKIP')

prepare() {
    chmod +x "${pkgname}.AppImage"
    ./"${pkgname}.AppImage" --appimage-extract
    mv squashfs-root sfs
    find sfs/usr/{bin,lib,plugins} -type f -exec \
        patchelf --set-rpath '/usr/lib/whatpulse/lib:/usr/lib' '{}' + 2>/dev/null || true
}

package() {
    install -Dm755 whatpulse.sh "${pkgdir}/usr/bin/whatpulse"
    install -Dm755 sfs/usr/bin/whatpulse "${pkgdir}/usr/lib/whatpulse/whatpulse"

    find sfs/usr/lib -type f -exec \
        install -Dm644 '{}' "${pkgdir}/usr/lib/whatpulse/lib/$(basename '{}')" \;

    find sfs/usr/plugins -type f -exec \
        sh -c 'dst="${pkgdir}/usr/lib/whatpulse/plugins/${1#sfs/usr/plugins/}"; install -Dm644 "$1" "$dst"' _ '{}' \;

    install -Dm644 whatpulse.desktop "${pkgdir}/usr/share/applications/whatpulse.desktop"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    for size in 16 20 22 24 28 32 36 44 48 64 72 96 128 150 192 256 310 384 512 1024; do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps"
        magick \
            sfs/whatpulse.png \
            -resize "${size}x${size}" \
            -background none -gravity center -extent "${size}x${size}" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/whatpulse.png"
    done
}
