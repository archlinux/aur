# Maintainer: ny-a <nyaarch64@gmail..com>
# Contributor: JC Francois <jc.francois@gmail.com>
pkgname=beaker-browser-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="Peer-to-peer browser with tools to create and host websites"
arch=('x86_64')
url="https://beakerbrowser.com/"
license=('Modified MIT License (MIT)')
conflicts=('beaker')
provides=('beaker')
depends=('gtk3' 'libsodium' 'libxss' 'nss')
backup=()

options=(!strip)
source=("https://github.com/beakerbrowser/beaker/releases/download/${pkgver//_/-}/Beaker.Browser-${pkgver//_/-}.AppImage"
        "beaker-browser.desktop"
        "beaker-browser"
        "LICENSE")
sha256sums=('77b6707ac32b5fe3fcc38f0f86159bb2f8eda42c1b88c077dea846bf4df60c1e'
            '5d5539f28d3a3177a75cdb6ea6f2c7cb6fc6c33a5d936fa30f5fb4396c20bba8'
            'e6efc2fbdc8ed38e8b19e5e9d13e3ecd458a71d12731b43060395bc3a328d09f'
            '7a0ab6f0bfde635de0dea1a5e57e641de973544ba9a5fb8498c098563ad35783')

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
    install -Dm444  ${srcdir}/LICENSE                                   ${pkgdir}/usr/share/licenses/beaker-browser/LICENSE
}
