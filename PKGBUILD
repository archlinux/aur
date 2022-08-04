# Maintainer: Edmundo Sanchez <zomundo at gmail dot com>
pkgname=biscuit
pkgver=1.2.27
pkgrel=1.8
pkgdesc='A browser where you can organize your apps'
arch=('x86_64')
url='https://eatbiscuit.com/'
license=('Apache')
depends=('gtk3' 'libxss' 'libindicator-gtk2' 'nss' 'dbus-glib' 'libdbusmenu-gtk2')
source=(
    "https://github.com/agata/dl.biscuit/releases/download/v${pkgver}/Biscuit-${pkgver}.AppImage"
)

sha256sums=('a1cec154f0f5ae2b676e28c60c486ff69f457ff71e976d8c1df80a5a4b8c717b')

prepare() {
    chmod u+x ./Biscuit-${pkgver}.AppImage
    ./Biscuit-${pkgver}.AppImage --appimage-extract
}

package() {
    install -dm755 "${pkgdir}/usr/lib"
    install -dm755 "${pkgdir}/usr/share"
    install -dm755 "${pkgdir}/usr/bin"
    install -dm755 "${pkgdir}/usr/share/applications"

    cp -a "${srcdir}/squashfs-root" "${pkgdir}/usr/lib/${pkgname}"
    find "${pkgdir}/usr/lib/${pkgname}" -type d -exec chmod 755 "{}" \;

    cp -a "${srcdir}/squashfs-root/usr/share/icons" "${pkgdir}/usr/share"
    chmod -R 755 "${pkgdir}/usr/share/icons"

    sed -i -e 's/AppRun/biscuit/' "${pkgdir}/usr/lib/${pkgname}/biscuit.desktop"
    ln -s "/usr/lib/${pkgname}/biscuit.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    ln -s "/usr/lib/${pkgname}/biscuit" "${pkgdir}/usr/bin/${pkgname}"
}
