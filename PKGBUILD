# Maintainer: Michael Yeatts <mwyeatts at gmail dot com>

pkgname=lightning-app
pkgver=0.2.2
pkgrel=1
pkgdesc="Lightning Network Desktop Wallet"
arch=('x86_64')
url="https://github.com/lightninglabs/lightning-app"
license=('GPL')
depends=()
_appname="Lightning-linux-x86_64v${pkgver}-alpha.AppImage"
source=("https://github.com/lightninglabs/lightning-app/releases/download/v${pkgver}-alpha/${_appname}")
noextract=()
sha256sums=('SKIP')
validpgpkeys=()

prepare() {
    chmod +x ${_appname}
    ./${_appname} --appimage-extract
    find ${srcdir}/squashfs-root/ -type d -exec chmod 755 {} \;
}

package() {
    install -d ${pkgdir}/opt/${pkgname}
    cp -r ${srcdir}/squashfs-root/app/* ${pkgdir}/opt/${pkgname}

    install -d ${pkgdir}/usr/share
    cp -r ${srcdir}/squashfs-root/usr/share/* ${pkgdir}/usr/share

    install -Dm755 ${srcdir}/squashfs-root/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
    install -Dm755 ${srcdir}/squashfs-root/${pkgname}.png ${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png

    sed -i 's/AppRun/lightning-app/g' ${pkgdir}/usr/share/applications/${pkgname}.desktop

    install -Ddm755 ${pkgdir}/usr/bin
    ln -s /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
