# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname="fireblocks recovery utility"
pkgname="${_pkgname// /-}-bin"
_appname="Fireblocks Recovery Utility"
pkgver=0.4.1
_fileversion="${pkgver}"
_electronversion=21
pkgrel=5
pkgdesc="Recover Fireblocks assets and keys in a disaster, verify a Recovery Kit, or generate keys to set up a new Recovery Kit."
arch=('x86_64')
url="https://www.fireblocks.com/"
_ghurl="https://github.com/fireblocks/recovery"
license=('GPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname}-${pkgver}.zip::${_ghurl}/releases/download/v${pkgver}/Recovery.Utility.Ubuntu.${CARCH//_/-}.zip"
    "${pkgname%-bin}.sh"
)
sha256sums=('b9829b24391a674403451c6c2c79cd536047325b77e303439cd0a69e00b754da'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${_appname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    chmod a+x "${srcdir}/${_appname}-${_fileversion}.AppImage"
    "${srcdir}/${_appname}-${_fileversion}.AppImage" --appimage-extract > /dev/null
    find "${srcdir}/squashfs-root" -type d -perm 700 -exec chmod 755 {} \;
    sed -e "s|AppRun --no-sandbox|${pkgname%-bin}|g" -e "s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" -i "${srcdir}/squashfs-root/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/squashfs-root/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/squashfs-root/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}