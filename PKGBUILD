# Maintainer: roughcast-finali <aur.archlinux.org.eggbeater055@passmail.com>

pkgname=wave-bin
_pkgname=WAVE
pkgver=1.1.4
pkgrel=1
pkgdesc="Modern and sleek cross-platform music streaming player"
arch=('x86_64')
url="https://waveapp.pages.dev"
license=('GPL-2.0-only')
depends=(
    'gtk3'
    'mpv'
    'hicolor-icon-theme'
    'libsecret'
    'alsa-lib'
)
provides=('wave' 'wave-app' 'wave-music')
conflicts=('wave' 'wave-app' 'wave-music')
options=('!strip')

_appimage="${pkgname}-${pkgver}.AppImage"
source=("${_appimage}::https://github.com/ayman708-UX/WAVE/releases/download/v${pkgver}/WAVE-Linux-x86_64.AppImage"
        "wave.desktop")
noextract=("${_appimage}")
sha256sums=('61c187dbd8af5463e06c4e7b5eae016bf75aa3afb0413548831676039b9b3304'
            'f3fc91c30000b23a9fd7c7ad2f1979528e398157d813516fbcdd52c9c5ce7d7d')

prepare() {
    chmod +x "${_appimage}"
    rm -rf squashfs-root
    ./"${_appimage}" --appimage-extract
}

package() {
    # Install application bundle to /opt/wave
    install -dm755 "${pkgdir}/opt/wave"
    cp -ra "${srcdir}/squashfs-root/data" "${pkgdir}/opt/wave/"
    cp -ra "${srcdir}/squashfs-root/lib" "${pkgdir}/opt/wave/"
    install -Dm755 "${srcdir}/squashfs-root/wave" "${pkgdir}/opt/wave/wave"

    # Install binary symlink
    install -dm755 "${pkgdir}/usr/bin"
    ln -s /opt/wave/wave "${pkgdir}/usr/bin/wave"

    # Install desktop entry
    install -Dm644 "${srcdir}/wave.desktop" "${pkgdir}/usr/share/applications/wave.desktop"

    # Install icons in standard sizes and pixmaps
    install -Dm644 "${srcdir}/squashfs-root/WAVE.png" "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/wave.png"
    install -Dm644 "${srcdir}/squashfs-root/WAVE.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/wave.png"
    install -Dm644 "${srcdir}/squashfs-root/WAVE.png" "${pkgdir}/usr/share/pixmaps/wave.png"
    install -Dm644 "${srcdir}/squashfs-root/WAVE.png" "${pkgdir}/usr/share/pixmaps/WAVE.png"
}
