# Maintainer: Edmundo Sanchez <zomundo at gmail dot com>
pkgname=taskade
pkgbase=taskade-appimage
pkgver=4.2.10
pkgrel=1.1
pkgdesc='Get things done with task lists, workflow automation, and real-time collaboration.'
arch=('x86_64')
url='https://taskade.com/'
license=('unset')
depends=('gtk3' 'libxss' 'libindicator-gtk2' 'nss' 'dbus-glib' 'libdbusmenu-gtk2')
source=(
    "https://apps.taskade.com/updates/Taskade_${pkgver}_x86_64.AppImage"
)
sha256sums=('a4bd021d878c1a00be2fb77e570aa60ecd49663b6a4a52771f48fdf536e93f3b')

prepare() {
    chmod u+x ./Taskade_${pkgver}_x86_64.AppImage
    ./Taskade_${pkgver}_x86_64.AppImage --appimage-extract
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
