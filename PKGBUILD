# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=echomusic-appimage
_pkgname=echomusic
pkgver="2.1.9"
pkgrel=1
pkgdesc="EchoMusic desktop client AppImage"
arch=('x86_64')
url='https://github.com/hoowhoami/EchoMusic'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret' 'fuse2')
optdepends=('libappindicator-gtk3: tray indicator support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip')
source_x86_64=("EchoMusic-2.1.9-linux-x86_64.AppImage::https://github.com/hoowhoami/EchoMusic/releases/download/v2.1.9/EchoMusic-2.1.9-linux-x86_64.AppImage")
sha512sums_x86_64=('afff75a4ae1bff4b9409415000fc5b4587e23dcd1f43b8b05726ca882bb8964c22113c4faab8b985cd09edbe6b98e43e616f3742c565b5ca45253b2d53acda7a')
noextract=("EchoMusic-${pkgver}-linux-x86_64.AppImage")

prepare() {
    chmod +x "${srcdir}/EchoMusic-${pkgver}-linux-x86_64.AppImage"
    rm -rf "${srcdir}/squashfs-root"
    "${srcdir}/EchoMusic-${pkgver}-linux-x86_64.AppImage" --appimage-extract

    sed -i -E "s|^Exec=.*|Exec=/usr/bin/${_pkgname} %U|" "${srcdir}/squashfs-root/echo-music.desktop"
    sed -i -E "s|^Icon=.*|Icon=${_pkgname}|" "${srcdir}/squashfs-root/echo-music.desktop"
}

package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"

    install -Dm755 "${srcdir}/EchoMusic-${pkgver}-linux-x86_64.AppImage" "${pkgdir}/opt/${_pkgname}/${_pkgname}.AppImage"
    ln -s "/opt/${_pkgname}/${_pkgname}.AppImage" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/squashfs-root/echo-music.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/echo-music.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
}
