# Maintainer: Edmundo Sanchez <zomundo at gmail dot com>
# Contributor: Felix Golatofski <contact@xdfr.de>

pkgname=marktext-appimage
pkgver=0.16.2
pkgrel=1
pkgdesc='A simple and elegant open-source markdown editor that focused on speed and usability.'
arch=('x86_64')
url='https://marktext.app'
license=('Apache')
depends=('dbus-glib' 'nss' 'libxss' 'libdbusmenu-gtk2' 'libindicator-gtk2' 'gtk3' 'libsecret' 'libxkbfile')
source=(
    "https://github.com/marktext/marktext/releases/download/v${pkgver}/marktext-${arch}.AppImage"
)

sha256sums=('27a35e16099f9019b7bc77955efb096628ffba663f5f5cfb6e674ab1374d6e47')

prepare() {
    chmod u+x ./marktext-${arch}.AppImage
    ./marktext-${arch}.AppImage --appimage-extract
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

    sed -i -e "s/AppRun/${pkgname}/" "${pkgdir}/usr/lib/${pkgname}/marktext.desktop"
    ln -s "/usr/lib/${pkgname}/marktext.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    ln -s "/usr/lib/${pkgname}/marktext" "${pkgdir}/usr/bin/${pkgname}"
}
