# Maintainer: sunkhan
pkgname=decibell
pkgver=0.2.0
pkgrel=4
pkgdesc="Decentralized text, voice chat, and streaming app"
arch=('x86_64')
url="https://github.com/sunkhan/decibell"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'libappindicator-gtk3'
    'librsvg'
    'pipewire'
    'libpipewire'
    'opus'
    'ffmpeg'
    'dbus'
    'gtk3'
)
provides=('decibell')
conflicts=('decibell-bin' 'decibell-git')
options=('!strip')
source=(
    "${pkgname}-${pkgver}.AppImage::https://github.com/sunkhan/decibell/releases/download/v${pkgver}/Decibell_${pkgver}_amd64.AppImage"
    "decibell.desktop"
)
sha256sums=('SKIP' 'SKIP')

prepare() {
    chmod +x "${srcdir}/${pkgname}-${pkgver}.AppImage"
    "${srcdir}/${pkgname}-${pkgver}.AppImage" --appimage-extract

    # Remove bundled libs that conflict with host audio/video stack
    cd "${srcdir}/squashfs-root/usr/lib"
    rm -f libpulse*.so* libpipewire*.so* libsndfile*.so*
    rm -f libavcodec*.so* libavformat*.so* libavutil*.so* libavdevice*.so*
    rm -f libavfilter*.so* libswresample*.so* libswscale*.so* libpostproc*.so*
    rm -f libopus*.so* libasyncns*.so*
}

package() {
    # Install extracted app to /opt
    install -d "${pkgdir}/opt/decibell"
    cp -a "${srcdir}/squashfs-root/usr/bin" "${pkgdir}/opt/decibell/"
    cp -a "${srcdir}/squashfs-root/usr/lib" "${pkgdir}/opt/decibell/"

    # Launcher script
    install -d "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/decibell" << 'LAUNCHER'
#!/bin/sh
export LD_LIBRARY_PATH="/opt/decibell/lib:${LD_LIBRARY_PATH}"
exec /opt/decibell/bin/decibell "$@"
LAUNCHER
    chmod 755 "${pkgdir}/usr/bin/decibell"

    # Desktop entry
    install -Dm644 "${srcdir}/decibell.desktop" \
        "${pkgdir}/usr/share/applications/decibell.desktop"

    # Icons
    cd "${srcdir}/squashfs-root"
    for icon in usr/share/icons/hicolor/*/apps/decibell.png; do
        size_dir="$(echo "$icon" | grep -oP 'hicolor/\K[^/]+')"
        install -Dm644 "$icon" \
            "${pkgdir}/usr/share/icons/hicolor/${size_dir}/apps/decibell.png"
    done
}
