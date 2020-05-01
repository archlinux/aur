# Maintainer: Felix Golatofski <contact@xdfr.de>
_pkgname=freifunk-meet-desktop
pkgname=${_pkgname}-bin
pkgver=2.0.10
pkgrel=1
pkgdesc="Jitsi Meet desktop application powered by Electron"
arch=('x86_64')
url="https://github.com/freifunkMUC/jitsi-meet-electron"
license=('Apache')
provides=(${_pkgname})
conflicts=(${_pkgname})
depends=()
makedepends=('coreutils')
backup=()

options=(!strip)
source=("ffmuc-meet-${arch[0]}-${pkgver}.AppImage::https://github.com/freifunkMUC/jitsi-meet-electron/releases/download/v${pkgver//_/-}/ffmuc-meet-${arch[0]}.AppImage"
        "${_pkgname}.desktop")
sha256sums=('d9b9e9f4f1fb5575e8c96ca70a9d2ccd8e7626ca34351861d465d225e0efe55b'
            'd180773e67b25db81c6279ca34d0c2dad0b8d0172554723105ad54f4c939d573')


prepare() {
    chmod u+x      ${srcdir}/ffmuc-meet-${arch[0]}-${pkgver}.AppImage

    ${srcdir}/ffmuc-meet-${arch[0]}-${pkgver}.AppImage --appimage-extract
}

package() {
    find           ${srcdir}/squashfs-root/locales/ -type d -exec chmod 755 {} +
    find           ${srcdir}/squashfs-root/resources/ -type d -exec chmod 755 {} +

    install -d     ${pkgdir}/opt/${_pkgname}
    cp -r          ${srcdir}/squashfs-root/*                       ${pkgdir}/opt/${_pkgname}

    # remove broken or unused files and directories
    rm -r          ${pkgdir}/opt/${_pkgname}/usr/
    rm             ${pkgdir}/opt/${_pkgname}/AppRun
    rm             ${pkgdir}/opt/${_pkgname}/ffmuc-meet.desktop
    rm             ${pkgdir}/opt/${_pkgname}/ffmuc-meet.png

    find           ${srcdir}/squashfs-root/usr/share/icons/ -type d -exec chmod 755 {} +

    install -d     ${pkgdir}/usr/share/icons
    cp -r          ${srcdir}/squashfs-root/usr/share/icons/hicolor ${pkgdir}/usr/share/icons/hicolor

    install -d     ${pkgdir}/usr/bin
    ln -s          ../../opt/${_pkgname}/ffmuc-meet                ${pkgdir}/usr/bin/${_pkgname}

    install -Dm644 ${srcdir}/${_pkgname}.desktop                   ${pkgdir}/usr/share/applications/${_pkgname}.desktop
}
