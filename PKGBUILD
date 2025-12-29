# Maintainer: Edmundo Sanchez <zomundo at gmail dot com>
pkgname=twos
pkgbase=twos-appimage
pkgver=7.4.0
pkgrel=1
pkgdesc='A simple and beautiful way to capture your thoughts, organize your life, and get things done.'
arch=('x86_64')
url='https://twosapp.com/'
license=('unset')
depends=('gtk3' 'libxss' 'libindicator-gtk2' 'nss' 'dbus-glib' 'libdbusmenu-gtk2')
source=(
    "https://twos.s3.us-west-2.amazonaws.com/mac/Twos-${pkgver}.AppImage"
)
sha256sums=('538ed790f324d0a23d9586f1e934544e5f21c7fef23054df8adf280b6b55f04b')

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
