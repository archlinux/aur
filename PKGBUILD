# Maintainer: Julian Price <juliangreyprice@gmail.com>
# Previous Maintainer: Thor K. H. <thor alfakrøll roht dott no>
# Previous Co-Maintainer: Mubashshir <ahmubashshir@gmail.com>
# Contributor: Tim Besard <tim $dot$ besard $at$ gmail $dot$ com>
# Contributor: Jelle van der Waa <jellevdwaa @ gmail.com>
# Contributor: Pieter Kokx <pieter $at$ kokx $dot$ .nl>

pkgname=whatpulse
pkgver=7.0
pkgrel=1
pkgdesc="Measures your keyboard, mouse, app usage, network traffic and uptime."
arch=('x86_64')
url="https://www.whatpulse.org"
license=('custom:whatpulse_tos')

depends=(
    freetype2 xcb-util-image libxkbcommon libxkbcommon-x11 xcb-util-renderutil gcc-libs dbus krb5
    xcb-util-wm glib2 libx11 fontconfig libglvnd xcb-util-keysyms openssl glibc libxcb zlib
    hicolor-icon-theme qt6-base qt6-httpserver qt6-websockets qt6-charts qt6-svg qt6-5compat
)
makedepends=(imagemagick patchelf)
optdepends=(
    'libpcap: for capturing network statistics'
    'qt6-wayland: for native Wayland support'
    'qt6-imageformats: for additional image format support'
)

source=(
    "whatpulse.desktop"
    "whatpulse.sh"
    "LICENSE"
)
source_x86_64=("${pkgname}-${pkgver}-amd64.AppImage::https://releases.whatpulse.org/latest/linux/whatpulse-linux-latest_amd64.AppImage")

sha256sums=('1684ff01ea3521a9a0dc3a13454c76a0085135698a602ee5ff80018b485520c8'
            '4298c2809c78bd35e2640e2a27b4a16794d83008574c9a1fa410ee4d79455c4e'
            'cfea47f15bb3ba2494a7b1d50367139dc12709fc1e8ba0b25d86ee5f09748619')
sha256sums_x86_64=('caaa6eb39c10ee679f1536d991b54ca3318332a7fcdc3674c8aaf4c9a2d3c83d')

prepare() {
    chmod +x "${pkgname}-${pkgver}-amd64.AppImage"
    ./"${pkgname}-${pkgver}-amd64.AppImage" --appimage-extract
    mv squashfs-root sfs
    find sfs/usr/lib -name "libQt6*.so*" -delete
    rm -rf sfs/usr/lib/qt6
    rm -f sfs/usr/lib/libssl.so* sfs/usr/lib/libcrypto.so*
    rm -f sfs/usr/lib/libfreetype.so* sfs/usr/lib/libfontconfig.so*
    rm -f sfs/usr/lib/libglib*.so* sfs/usr/lib/libgio*.so*
    rm -f sfs/usr/lib/libpcre2-8.so*
    rm -f sfs/usr/lib/libmount.so* sfs/usr/lib/libblkid.so* sfs/usr/lib/libselinux.so*
    rm -f sfs/usr/lib/libdbus*.so*
    rm -f sfs/usr/lib/libsystemd.so*
    rm -f sfs/usr/lib/libicu*.so*
    patchelf --set-rpath '/usr/lib/whatpulse/lib:/usr/lib/qt6:/usr/lib' sfs/usr/bin/whatpulse
    patchelf --set-rpath '/usr/lib/whatpulse/lib:/usr/lib/qt6:/usr/lib' sfs/usr/bin/whatpulse-collector
    patchelf --set-rpath '/usr/lib/whatpulse/lib:/usr/lib/qt6:/usr/lib' sfs/usr/bin/crashpad_handler
    find sfs/usr/lib -type f -exec \
        patchelf --set-rpath '/usr/lib/whatpulse/lib:/usr/lib/qt6:/usr/lib' '{}' + 2>/dev/null || true
}

package() {
    install -Dm755 whatpulse.sh "${pkgdir}/usr/bin/whatpulse"
    install -Dm755 sfs/usr/bin/whatpulse "${pkgdir}/usr/lib/whatpulse/whatpulse"
    install -Dm755 sfs/usr/bin/whatpulse-collector "${pkgdir}/usr/lib/whatpulse/whatpulse-collector"
    install -Dm755 sfs/usr/bin/crashpad_handler "${pkgdir}/usr/lib/whatpulse/crashpad_handler"
    ln -s /usr/lib/whatpulse/whatpulse-collector "${pkgdir}/usr/bin/whatpulse-collector"

    if [ -d "sfs/usr/lib" ]; then
        find sfs/usr/lib -type f -name "*.so*" | while read lib; do
            install -Dm644 "$lib" "${pkgdir}/usr/lib/whatpulse/lib/$(basename "$lib")"
        done
        find sfs/usr/lib -type f ! -name "*.so*" | while read lib; do
            install -Dm644 "$lib" "${pkgdir}/usr/lib/whatpulse/lib/$(basename "$lib")"
        done
    fi

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
