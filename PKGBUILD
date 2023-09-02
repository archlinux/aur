# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cozy-drive-bin
_pkgname=Cozy-Drive
_appname=cozydrive
pkgver=3.38.0
pkgrel=1
pkgdesc="File Synchronisation for Cozy on Desktop and Laptop"
arch=('x86_64')
url="https://cozy-labs.github.io/cozy-desktop/"
_githuburl="https://github.com/cozy-labs/cozy-desktop"
license=('AGPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${_appname}")
depends=('bash' 'electron23' 'hicolor-icon-theme' 'python' 'lib32-gcc-libs' 'lib32-glibc' 'gcc-libs' 'glibc')
source=("${pkgname%-bin}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-${CARCH}.AppImage"
    "${pkgname%-bin}.sh")
sha256sums=('de588ecd954e8ed575706aca94e2a215146a9edf0a1cfaf961ee475347bf058a'
            '36ba7c1b9bd3adb88c0cd3e7ddbade03764d5fbb820e2182d6b08285c7dbdf07')
prepare() {
    chmod a+x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun   %U|${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/"* "${pkgdir}/opt/${pkgname%-bin}"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/mime/${_appname}.xml" "${pkgdir}/usr/share/mime/${pkgname%-bin}.xml"
}