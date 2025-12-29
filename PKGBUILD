# Maintainer: Edmundo Sanchez <zomundo at gmail dot com>
pkgname=twos
pkgbase=twos-appimage
pkgver=7.5.0
pkgrel=1
pkgdesc='A simple and beautiful way to capture your thoughts, organize your life, and get things done.'
arch=('x86_64')
url='https://twosapp.com/'
license=('unset')
depends=('gtk3' 'libxss' 'libindicator-gtk2' 'nss' 'dbus-glib' 'libdbusmenu-gtk2')
source=(
    "https://twos.s3.us-west-2.amazonaws.com/mac/Twos-${pkgver}.AppImage"
)
sha256sums=('083e0d3ce0621726ab94bab19178a8169d0f3e69a0f06db1c825e5626265573f')

prepare() {
    chmod u+x ./Twos-${pkgver}.AppImage
    ./Twos-${pkgver}.AppImage --appimage-extract
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

    sed -i -e 's/AppRun/twos/' "${pkgdir}/usr/lib/${pkgname}/twos.desktop"
    ln -s "/usr/lib/${pkgname}/twos.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    ln -s "/usr/lib/${pkgname}/twos" "${pkgdir}/usr/bin/${pkgname}"
}
