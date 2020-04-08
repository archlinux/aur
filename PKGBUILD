# Maintainer: Roman Kupriyanov <mr.eshua@gmail.com>
_pkgname=jitsi-meet-desktop
pkgname=${_pkgname}-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Jitsi Meet desktop application powered by Electron"
arch=('x86_64')
url="https://jitsi.org/jitsi-meet/"
license=('Apache')
provides=(${_pkgname})
conflicts=(${_pkgname}
           'jitsi-meet-electron')
replaces=('jitsi-meet-electron')
depends=()
makedepends=('coreutils')
backup=()

options=(!strip)
source=("jitsi-meet-${arch[0]}-${pkgver}.AppImage::https://github.com/jitsi/jitsi-meet-electron/releases/download/v${pkgver//_/-}/jitsi-meet-${arch[0]}.AppImage"
        "${_pkgname}.desktop")
sha256sums=('23f985201bc6b81e7cb045201a25c4500111d5665b4ecf1d5913220f714b9185'
            '16de58926874dd4bbb0f2a232eb7df7b57058d04637f0109cda4dbdeb0c23b9c')


prepare() {
    chmod u+x      ${srcdir}/jitsi-meet-${arch[0]}-${pkgver}.AppImage

    ${srcdir}/jitsi-meet-${arch[0]}-${pkgver}.AppImage --appimage-extract
}

package() {
    find           ${srcdir}/squashfs-root/locales/ -type d -exec chmod 755 {} +
    find           ${srcdir}/squashfs-root/resources/ -type d -exec chmod 755 {} +

    install -d     ${pkgdir}/opt/${_pkgname}
    cp -r          ${srcdir}/squashfs-root/*                       ${pkgdir}/opt/${_pkgname}

    # remove broken or unused files and directories
    rm -r          ${pkgdir}/opt/${_pkgname}/usr/
    rm             ${pkgdir}/opt/${_pkgname}/AppRun
    rm             ${pkgdir}/opt/${_pkgname}/jitsi-meet.desktop
    rm             ${pkgdir}/opt/${_pkgname}/jitsi-meet.png

    find           ${srcdir}/squashfs-root/usr/share/icons/ -type d -exec chmod 755 {} +

    install -d     ${pkgdir}/usr/share/icons
    cp -r          ${srcdir}/squashfs-root/usr/share/icons/hicolor ${pkgdir}/usr/share/icons/hicolor

    install -d     ${pkgdir}/usr/bin
    ln -s          ../../opt/${_pkgname}/jitsi-meet                ${pkgdir}/usr/bin/${_pkgname}

    install -Dm644 ${srcdir}/${_pkgname}.desktop                   ${pkgdir}/usr/share/applications/${_pkgname}.desktop
}
