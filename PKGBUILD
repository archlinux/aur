# Maintainer: KAUN<kaunkrishna@duck.com>
pkgname=echo-music-desktop-bin
pkgver=1.0
pkgrel=1
pkgdesc="A modern YouTube Music Client for Desktop with synced lyrics and offline playback"
arch=('x86_64')
url="https://github.com/EchoMusicApp/Echo-Music-Desktop"
license=('GPL3')
depends=('mpv' 'gtk3' 'hicolor-icon-theme')
provides=('echo-music-desktop')
conflicts=('echo-music-desktop')
options=('!strip')

source=("https://github.com/EchoMusicApp/Echo-Music-Desktop/releases/download/v${pkgver}/EchoMusic.AppImage")
sha256sums=('f3e2b758f80c4603528e858d5983766ee87f63920c0b734beeea6cf48f2d0a2d')

prepare() {
    cd "${srcdir}"
    chmod +x EchoMusic.AppImage
    
    if [ -d "squashfs-root" ]; then
        rm -rf squashfs-root
    fi
    
    ./EchoMusic.AppImage --appimage-extract
}

package() {
    install -d "${pkgdir}/opt/${pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/pixmaps"
    install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"

    cp -r "${srcdir}/squashfs-root/"* "${pkgdir}/opt/${pkgname}/"

    echo -e '#!/bin/sh\ncd /opt/echo-music-desktop-bin && ./AppRun "$@"' > "${pkgdir}/usr/bin/echo-music-desktop"
    chmod +x "${pkgdir}/usr/bin/echo-music-desktop"

    if [ -f "${srcdir}/squashfs-root/echo.png" ]; then
        local icon_src="${srcdir}/squashfs-root/echo.png"
    else
        local icon_src=$(ls "${srcdir}/squashfs-root/"*.png | head -n1)
    fi

    install -Dm644 "${icon_src}" "${pkgdir}/usr/share/pixmaps/echo-music-desktop.png"
    install -Dm644 "${icon_src}" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/echo-music-desktop.png"

    local desktop_file=$(ls "${srcdir}/squashfs-root/"*.desktop | head -n1)
    install -Dm644 "${desktop_file}" "${pkgdir}/usr/share/applications/echo-music-desktop.desktop"

    sed -i "s|^Exec=.*|Exec=echo-music-desktop|" "${pkgdir}/usr/share/applications/echo-music-desktop.desktop"
    sed -i "s|^Icon=.*|Icon=echo-music-desktop|" "${pkgdir}/usr/share/applications/echo-music-desktop.desktop"
}
