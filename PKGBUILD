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
sha256sums=('c4e13a0899635f8c29872222a9e4d86b5e5e06a54aa2cc8d682c327015ddbf61')

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
