# Maintainer: Roman Kupriyanov <mr.eshua@gmail.com>
_pkgname=jitsi-meet-desktop
pkgname=${_pkgname}-bin
pkgver=2.8.9
pkgrel=1
pkgdesc="Jitsi Meet desktop application powered by Electron"
arch=('x86_64')
url="https://github.com/jitsi/jitsi-meet-electron"
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
sha256sums=('3ec30fd1b0f195702446edc181a51672a9d37d428e181f35a074fde178bcb7c1'
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
    # Since 2.8.4 jitsi-meet is a bash script that needs to point to jitsi-meet.bin, the bash script that jitsi ships is broken without this
    cat > ${pkgdir}/opt/${_pkgname}/jitsi-meet << EOF
#!/bin/bash
/opt/${_pkgname}/jitsi-meet.bin --no-sandbox "\$@"
EOF

    find           ${srcdir}/squashfs-root/usr/share/icons/ -type d -exec chmod 755 {} +

    install -d     ${pkgdir}/usr/share/icons
    cp -r          ${srcdir}/squashfs-root/usr/share/icons/hicolor ${pkgdir}/usr/share/icons/hicolor

    install -d     ${pkgdir}/usr/bin
    ln -s          ../../opt/${_pkgname}/jitsi-meet                ${pkgdir}/usr/bin/${_pkgname}

    install -Dm644 ${srcdir}/${_pkgname}.desktop                   ${pkgdir}/usr/share/applications/${_pkgname}.desktop
}
