# Maintainer: Edmundo Sanchez <zomundo at gmail dot com>
pkgname=twos
pkgbase=twos-appimage
pkgver=1.20.6
pkgrel=1
pkgdesc='A simple and beautiful way to capture your thoughts, organize your life, and get things done.'
arch=('x86_64')
url='https://twosapp.com/'
license=('unset')
depends=('gtk3' 'libxss' 'libindicator-gtk2' 'nss' 'dbus-glib' 'libdbusmenu-gtk2')
source=(
    "https://www.twosapp.com/api/desktop/updates/Twos-${pkgver}.AppImage"
)
sha256sums=('f1b4d02ad93dde3577d735f4324e9d178c34a84caff80120436fa56748aa5bdd')

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

    # Upstream binary/desktop renamed to newtwos; keep Arch package name "twos".
    sed -i -e 's|^Exec=.*|Exec=twos|' -e 's|^Icon=.*|Icon=newtwos|' \
        "${pkgdir}/usr/lib/${pkgname}/newtwos.desktop"
    ln -sf "/usr/lib/${pkgname}/newtwos.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    ln -sf "/usr/lib/${pkgname}/newtwos" "${pkgdir}/usr/bin/${pkgname}"
}
