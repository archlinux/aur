# Maintainer: Edmundo Sanchez <zomundo at gmail dot com>
pkgname=biscuit
pkgver=1.2.13
pkgrel=1.2
pkgdesc='A browser where you can organize your apps'
arch=('x86_64')
url='https://eatbiscuit.com/'
license=('Apache')
depends=('gtk3' 'libxss' 'libindicator-gtk2' 'nss' 'dbus-glib' 'libdbusmenu-gtk2')
source=(
    "https://github.com/agata/dl.biscuit/releases/download/v${pkgver}/Biscuit-${pkgver}.AppImage"
)

sha256sums=('aaee6df6209831dc4bbdd4c62b3d11493c91cbe85ed169a048ee242fc16cc470')

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