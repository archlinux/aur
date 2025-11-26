# Maintainer: Julian Price <juliangreyprice@gmail.com>
# Previous Maintainer: Thor K. H. <thor alfakrøll roht dott no>
# Previous Co-Maintainer: Mubashshir <ahmubashshir@gmail.com>
# Contributor: Tim Besard <tim $dot$ besard $at$ gmail $dot$ com>
# Contributor: Jelle van der Waa <jellevdwaa @ gmail.com>
# Contributor: Pieter Kokx <pieter $at$ kokx $dot$ .nl>

pkgname=whatpulse
pkgver=5.11.2
pkgrel=1
pkgdesc="Measures your keyboard, mouse, app usage, network traffic and uptime."
arch=('x86_64')
url="https://www.whatpulse.org"
license=('custom:whatpulse_tos')

depends=(
    freetype2 xcb-util-image libxkbcommon libxkbcommon-x11 xcb-util-renderutil gcc-libs dbus krb5
    xcb-util-wm glib2 libx11 fontconfig libglvnd xcb-util-keysyms openssl-1.1 glibc libxcb zlib
    hicolor-icon-theme qt6-base qt6-httpserver
)
makedepends=(imagemagick patchelf)
optdepends=('libpcap: for capturing network statistics')

source=(
    "whatpulse.desktop"
    "whatpulse.sh"
    "LICENSE"
)
source_x86_64=("${pkgname}-${pkgver}-amd64.AppImage::https://releases-dev.whatpulse.org/$pkgver/linux/whatpulse-linux-${pkgver}_amd64.AppImage")

sha256sums=('5a4a6676a6b513824eeac8a2accd6de9e8bd2bc11b3e2967fa2b2a18d29fa35d'
            'a57d62d6b70fdb06eb69df7965f5a49327f83c5251ea8de5918b3c61516c2b45'
            'cfea47f15bb3ba2494a7b1d50367139dc12709fc1e8ba0b25d86ee5f09748619')
sha256sums_x86_64=('58e2255bd31e5af25e18e58fc05f74301e5a75336198fc773c99b6784bf967bf')

prepare() {
    chmod +x "${pkgname}-${pkgver}-amd64.AppImage"
    ./"${pkgname}-${pkgver}-amd64.AppImage" --appimage-extract
    mv squashfs-root sfs
    find sfs/usr/lib -name "libQt6*.so*" ! -name "*HttpServer*" -delete
    rm -rf sfs/usr/lib/qt6
    rm -f sfs/usr/lib/libssl.so* sfs/usr/lib/libcrypto.so*
    rm -f sfs/usr/lib/libfreetype.so* sfs/usr/lib/libfontconfig.so*
    rm -f sfs/usr/lib/libglib*.so* sfs/usr/lib/libgio*.so*
    rm -f sfs/usr/lib/libdbus*.so*
    patchelf --set-rpath '/usr/lib/whatpulse/lib:/usr/lib/qt6:/usr/lib' sfs/usr/bin/whatpulse
    find sfs/usr/{lib,plugins} -type f -exec \
        patchelf --set-rpath '/usr/lib/whatpulse/lib:/usr/lib/qt6:/usr/lib' '{}' + 2>/dev/null || true
}

package() {
    install -Dm755 whatpulse.sh "${pkgdir}/usr/bin/whatpulse"
    install -Dm755 sfs/usr/bin/whatpulse "${pkgdir}/usr/lib/whatpulse/whatpulse"

    if [ -d "sfs/usr/lib" ]; then
        find sfs/usr/lib -type f -name "*.so*" | while read lib; do
            install -Dm644 "$lib" "${pkgdir}/usr/lib/whatpulse/lib/$(basename "$lib")"
        done
        find sfs/usr/lib -type f ! -name "*.so*" | while read lib; do
            install -Dm644 "$lib" "${pkgdir}/usr/lib/whatpulse/lib/$(basename "$lib")"
        done
    fi

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
