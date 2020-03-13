# Maintainer: JC Francois <jc.francois@gmail.com>
pkgname=beaker-browser-bin
pkgver=0.8.10
pkgrel=1
pkgdesc="Peer-to-peer browser with tools to create and host websites"
arch=('x86_64')
url="https://beakerbrowser.com/"
license=('Modified MIT License (MIT)')
provides=('beaker-browser' 'beakerbrowser')
depends=('libxss' 'libxtst' 'libnotify' 'gconf' 'electron')
backup=()

options=(!strip)
source=("https://github.com/beakerbrowser/beaker/releases/download/${pkgver//_/-}/Beaker.Browser-${pkgver//_/-}.AppImage"
        "beaker-browser.desktop"
        "beaker-browser"
        "LICENSE")
md5sums=('1d67c93a67e2298628c3c12f279c2671'
         '34b48b022c6c71212f0adb3981f2925d'
         '09aa78a4ebb98e0c71aeaaf46fd6b11b'
         '3862c029863f42c81265a712f9c17c4c')

install='beaker-browser-bin.install'

prepare() {
    chmod u+x ${srcdir}/Beaker.Browser-${pkgver//_/-}.AppImage
    ${srcdir}/Beaker.Browser-${pkgver//_/-}.AppImage --appimage-extract
}

package() {
    find            ${srcdir}/squashfs-root/locales/ -type d -exec chmod 755 {} +
    find            ${srcdir}/squashfs-root/resources/ -type d -exec chmod 755 {} +
    install -d      ${pkgdir}/opt/beaker-browser
    cp -r           ${srcdir}/squashfs-root/*                           ${pkgdir}/opt/beaker-browser
    rm -r           ${pkgdir}/opt/beaker-browser/usr/
    rm -r           ${pkgdir}/opt/beaker-browser/swiftshader/

    find            ${srcdir}/squashfs-root/usr/share/icons/ -type d -exec chmod 755 {} +
    install -d      ${pkgdir}/usr/share/icons
    cp -r           ${srcdir}/squashfs-root/usr/share/icons/hicolor     ${pkgdir}/usr/share/icons/hicolor

    install -Dm644  ${srcdir}/beaker-browser.desktop                    ${pkgdir}/usr/share/applications/beaker-browser.desktop

    install -Dm755  ${srcdir}/beaker-browser                            ${pkgdir}/usr/bin/beaker-browser
    install -Dm444  ${srcdir}/LICENSE                                   ${pkgdir}/usr/share/LICENSES/beaker-browser/LICENSE
}
