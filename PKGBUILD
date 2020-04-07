# Maintainer: Roman Kupriyanov <mr.eshua@gmail.com>
_pkgname=jitsi-meet-desktop
pkgname=${_pkgname}-bin
pkgver=1.1.1
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
source=("https://github.com/jitsi/jitsi-meet-electron/releases/download/v${pkgver//_/-}/jitsi-meet-${arch[0]}.AppImage"
        "${_pkgname}.desktop"
        "LICENSE")
md5sums=('decaf85bd761fba1b0e2382a94ec6580'
         '29958e7cd823712ff8f25b5e62db9b2b'
         '7d8b7b31deb068490b271e7aea6c08ce')


prepare() {
    chmod u+x      ${srcdir}/jitsi-meet-${arch[0]}.AppImage

    ${srcdir}/jitsi-meet-${arch[0]}.AppImage --appimage-extract
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
    install -Dm444 ${srcdir}/LICENSE                               ${pkgdir}/usr/share/LICENSES/${_pkgname}/LICENSE
}
