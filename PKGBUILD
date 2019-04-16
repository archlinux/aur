# Maintainer: Michael Yeatts <mwyeatts at gmail dot com>

pkgname=lightning-app
pkgver=0.4.8
pkgrel=1
pkgdesc="Lightning Network Desktop Wallet"
arch=('x86_64')
url="https://github.com/lightninglabs/lightning-app"
license=('GPL')
depends=()
_appname="Lightning-linux-x86_64v${pkgver}-alpha.AppImage"
source=("https://github.com/lightninglabs/lightning-app/releases/download/v${pkgver}-alpha/${_appname}")
noextract=()
sha512sums=('82789a39a4fc60d0b164055fcfb3db9f47098d8db4e703a4f01a1c21ee81e89936945a5c3861bec2dd56ca5382c4e949b951a6828c3f9cf28808284e15174d6c')
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
