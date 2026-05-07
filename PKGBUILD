# Maintainer: DarKouto (Daniel Couto) <https://github.com/DarKouto>
pkgname=lyra-music-bin
pkgver=1.0.4
pkgrel=6
pkgdesc="Lyra Music Desktop - Official AppImage version"
arch=('x86_64')
url="https://github.com/Lyra-Music-App/Lyra-Desktop-Releases"
license=('custom')
depends=('fuse2' 'zlib' 'hicolor-icon-theme')
options=('!strip' '!debug')

source=("${pkgname}-${pkgver}.AppImage::${url}/releases/download/v${pkgver}/Lyra-Music-${pkgver}-x86_64.AppImage")
sha256sums=('26248b6566acf794182ef0adf29c6807705a8efb7a2f9491b74928a7dd735f6b')

# Extract AppImage contents to the squashfs-root folder
prepare() {
    cd "${srcdir}"
    chmod +x "${pkgname}-${pkgver}.AppImage"
    ./${pkgname}-${pkgver}.AppImage --appimage-extract > /dev/null
}

package() {
    cd "${srcdir}"

    # Installing the binary
    install -dm755 "${pkgdir}/opt/${pkgname}"
    install -Dm755 "${pkgname}-${pkgver}.AppImage" "${pkgdir}/opt/${pkgname}/${pkgname}.AppImage"

    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/opt/${pkgname}/${pkgname}.AppImage" "${pkgdir}/usr/bin/lyra-music"

    # Installing Icons
    local icon_src="squashfs-root/usr/share/icons/hicolor/1024x1024/apps/lyra-desktop.png"
    for size in 1024x1024 512x512 256x256 128x128 64x64; do
        install -dm755 "${pkgdir}/usr/share/icons/hicolor/${size}/apps"
        install -m644 "${icon_src}" "${pkgdir}/usr/share/icons/hicolor/${size}/apps/lyra-desktop.png"
    done

    # Adjusting Pixmaps (KDE Plasma)
    install -dm755 "${pkgdir}/usr/share/pixmaps"
    install -m644 "${icon_src}" "${pkgdir}/usr/share/pixmaps/lyra-desktop.png"

    # Adjusting Desktop Entry
    sed -i "s|Exec=.*|Exec=/usr/bin/lyra-music|" "squashfs-root/lyra-desktop.desktop"
    sed -i "s|Icon=.*|Icon=lyra-desktop|" "squashfs-root/lyra-desktop.desktop"
    install -Dm644 "squashfs-root/lyra-desktop.desktop" "${pkgdir}/usr/share/applications/lyra-music.desktop"
}
