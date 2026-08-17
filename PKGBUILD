# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=echomusic-appimage
_pkgname=echomusic
pkgver="2.3.0"
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
source_x86_64=("EchoMusic-2.3.0-linux-x86_64.AppImage::https://github.com/hoowhoami/EchoMusic/releases/download/v2.3.0/EchoMusic-2.3.0-linux-x86_64.AppImage")
sha512sums_x86_64=('e92af7318a91b85826c5fb7e349208fd6eaae0fbfa100ecdca5f2875701d9570a16a0eec1a92dd1db24f44f8ca69152ca47685708b6b850a22862ac1630c133f')
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
