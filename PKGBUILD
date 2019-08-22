# Maintainer: Roman Kupriyanov <mr.eshua@gmail.com>
pkgname=jitsi-meet-electron
pkgver=1.1.1
pkgrel=1
pkgdesc="Jitsi Meet desktop application powered by Electron"
arch=('x86_64')
url="https://jitsi.org/jitsi-meet/"
license=('Apache')
provides=('jitsi-meet')
depends=('electron')
backup=()

options=(!strip)
source=("https://github.com/jitsi/jitsi-meet-electron/releases/download/v${pkgver//_/-}/jitsi-meet-${arch[0]}.AppImage"
        "jitsi-meet.desktop"
        "jitsi-meet"
        "LICENSE")
md5sums=('decaf85bd761fba1b0e2382a94ec6580'
         '38928d2f8464b0f3f52c5f437118306b'
         'c887b985dfce586bc966500ef6ea327e'
         '7d8b7b31deb068490b271e7aea6c08ce')


prepare() {
    chmod u+x ${srcdir}/jitsi-meet-${arch[0]}.AppImage
    ${srcdir}/jitsi-meet-${arch[0]}.AppImage --appimage-extract
}

package() {
    find            ${srcdir}/squashfs-root/locales/ -type d -exec chmod 755 {} +
    find            ${srcdir}/squashfs-root/resources/ -type d -exec chmod 755 {} +
    install -d      ${pkgdir}/opt/jitsi-meet
    cp -r           ${srcdir}/squashfs-root/*                           ${pkgdir}/opt/jitsi-meet
    rm -r           ${pkgdir}/opt/jitsi-meet/usr/

    find            ${srcdir}/squashfs-root/usr/share/icons/ -type d -exec chmod 755 {} +
    install -d      ${pkgdir}/usr/share/icons
    cp -r           ${srcdir}/squashfs-root/usr/share/icons/hicolor     ${pkgdir}/usr/share/icons/hicolor

    install -Dm644  ${srcdir}/jitsi-meet.desktop                    ${pkgdir}/usr/share/applications/jitsi-meet.desktop

    install -Dm755  ${srcdir}/jitsi-meet                                      ${pkgdir}/usr/bin/jitsi-meet
    install -Dm444  ${srcdir}/LICENSE                                   ${pkgdir}/usr/share/LICENSES/jitsi-meet/LICENSE
}

