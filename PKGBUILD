# Maintainer: Edmundo Sanchez <zomundo at gmail dot com>
pkgname=taskade
pkgbase=taskade-appimage
pkgver=4.2.2
pkgrel=1.0
pkgdesc='Get things done with task lists, workflow automation, and real-time collaboration.'
arch=('x86_64')
url='https://taskade.com/'
license=('unset')
depends=('gtk3' 'libxss' 'libindicator-gtk2' 'nss' 'dbus-glib' 'libdbusmenu-gtk2')
source=(
    "https://apps.taskade.com/updates/Taskade-${pkgver}.AppImage"
)
sha256sums=('3b719db714806202708b1d05587dd3ce4450c065679f80756f71c09ec259d1cd')

prepare() {
    chmod u+x ./Taskade-${pkgver}.AppImage
    ./Taskade-${pkgver}.AppImage --appimage-extract
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

    sed -i -e 's/AppRun/taskade/' "${pkgdir}/usr/lib/${pkgname}/taskade.desktop"
    ln -s "/usr/lib/${pkgname}/taskade.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    ln -s "/usr/lib/${pkgname}/taskade" "${pkgdir}/usr/bin/${pkgname}"
}
