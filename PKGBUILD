# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=echomusic-appimage
_pkgname=echomusic
pkgver="2.2.3"
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
source_x86_64=("EchoMusic-2.2.3-linux-x86_64.AppImage::https://github.com/hoowhoami/EchoMusic/releases/download/v2.2.3/EchoMusic-2.2.3-linux-x86_64.AppImage")
sha512sums_x86_64=('9d5be713f6f2257f54487b2d2f707e9d224df62b8cdb9d09c2aeded62c786ade68a06565618c7dd2ee0a0061a7c66f8f02b0d25d8ffd78db5d745f2de3a2960a')
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
