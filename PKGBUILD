# Maintainer: JC Francois <jc.francois@gmail.com>
pkgname=beaker-browser-bin
pkgver=0.8.0_prerelease.7
pkgrel=4
pkgdesc="Peer-to-peer browser with tools to create and host websites"
arch=('x86_64')
url="https://beakerbrowser.com/"
license=('Modified MIT License (MIT)')
provides=('beaker-browser' 'beakerbrowser')
depends=('libxss' 'libxtst' 'libnotify' 'gconf' 'electron')
backup=()

options=(!strip)
source=("https://github.com/beakerbrowser/beaker/releases/download/${pkgver//_/-}/beaker-browser-${pkgver//_/-}-${arch}.AppImage"
        "beaker-browser.desktop"
        "beaker-browser"
        "LICENSE")
md5sums=('29ce7033348b13431fea4dfbe2fa94fc'
         '34b48b022c6c71212f0adb3981f2925d'
         '37dccf6c7d9145b93538d884e3d0f4dd'
         '3862c029863f42c81265a712f9c17c4c')

install='beaker-browser-bin.install'

prepare() {
    chmod u+x beaker-browser-${pkgver//_/-}-${arch}.AppImage
    ./beaker-browser-${pkgver//_/-}-${arch}.AppImage --appimage-extract
}

package() {
    find            ${srcdir}/squashfs-root/app/ -type d -exec chmod 755 {} +
    install -d      ${pkgdir}/opt/beaker-browser
    cp -r           ${srcdir}/squashfs-root/app/*                       ${pkgdir}/opt/beaker-browser
 
    find            ${srcdir}/squashfs-root/usr/share/icons/ -type d -exec chmod 755 {} +
    install -d      ${pkgdir}/usr/share/icons
    cp -r           ${srcdir}/squashfs-root/usr/share/icons/hicolor     ${pkgdir}/usr/share/icons/hicolor              

    install -Dm644  ${srcdir}/beaker-browser.desktop                    ${pkgdir}/usr/share/applications/beaker-browser.desktop

    install -Dm755  ${srcdir}/beaker-browser                            ${pkgdir}/usr/bin/beaker-browser
    install -Dm444  ${srcdir}/LICENSE                                   ${pkgdir}/usr/share/LICENSES/beaker-browser/LICENSE
}
