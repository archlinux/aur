# Maintainer: Michael Yeatts <mwyeatts at gmail dot com>

pkgname=lightning-app
pkgver=0.4.6
pkgrel=1
pkgdesc="Lightning Network Desktop Wallet"
arch=('x86_64')
url="https://github.com/lightninglabs/lightning-app"
license=('GPL')
depends=()
_appname="Lightning-linux-x86_64v${pkgver}-alpha.AppImage"
source=("https://github.com/lightninglabs/lightning-app/releases/download/v${pkgver}-alpha/${_appname}")
noextract=()
sha512sums=('70f8999a98e05e9da1182b3b4a90ca7e01195f0553dc2052b7a9cfcfca5755fd6c1158ee0bdfeeec303ca85a42f5702dc34ca8f936253f18996d6238a3294f6e')
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
