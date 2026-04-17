# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=echomusic-appimage
_pkgname=echomusic
pkgver="2.1.5"
pkgrel=1
pkgdesc="EchoMusic desktop client AppImage"
arch=('x86_64')
url='https://github.com/hoowhoami/EchoMusic'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: tray indicator support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
makedepends=('7zip')
options=('!strip')
source_x86_64=("EchoMusic-${pkgver}-linux-x86_64.AppImage::https://github.com/hoowhoami/EchoMusic/releases/download/v${pkgver}/EchoMusic-${pkgver}-linux-x86_64.AppImage")
sha512sums_x86_64=('SKIP')

prepare() {
    chmod +x "${srcdir}/EchoMusic-${pkgver}-linux-x86_64.AppImage"
    rm -rf "${srcdir}/squashfs-root"
    7z x "${srcdir}/EchoMusic-${pkgver}-linux-x86_64.AppImage" -o"${srcdir}/squashfs-root"

    sed -i -E "s|^Exec=.*|Exec=/usr/bin/${_pkgname} %U|" "${srcdir}/squashfs-root/echo-music.desktop"
    sed -i -E "s|^Icon=.*|Icon=${_pkgname}|" "${srcdir}/squashfs-root/echo-music.desktop"
}

package() {
    install -d "${pkgdir}/opt/${_pkgname}"
    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/applications"
    install -d "${pkgdir}/usr/share/icons/hicolor/256x256/apps"

    cp -a "${srcdir}/squashfs-root/." "${pkgdir}/opt/${_pkgname}/"

    ln -s "/opt/${_pkgname}/AppRun" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/squashfs-root/echo-music.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/256x256/apps/echo-music.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
}
