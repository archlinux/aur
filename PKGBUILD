# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=audax-data-manager-bin
_shortname=audaxdm
_pkgname='Audax Data Manager'
pkgver=1.6
pkgrel=1
pkgdesc="A free, open-source database client and administration tool for PostgreSQL, MySQL, MariaDB, SQL Server, SQLite, and Oracle - all from one app, so you don't need a different tool per database."
arch=('x86_64')
url="https://www.commandprompt.com/"
_ghurl="https://github.com/commandprompt/Audax-Data-Manager"
license=('MIT')
depends=(
    'alsa-lib'
    'nspr'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'nss'
    'libxrandr'
    'cairo'
    'at-spi2-core'
    'pango'
    'libxcomposite'
    'libxdamage'
    'mesa'
    'postgresql-libs'
    'libcups'
    'python'
    'libxcrypt-compat'
)
options=('!emptydirs')
source=(
    "${pkgname%-bin}-${pkgver}-${CARCH}.AppImage::${_ghurl}/releases/download/${pkgver}-release/${_shortname}-${pkgver}.AppImage"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/commandprompt/Audax-Data-Manager/${pkgver}-release/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('f5d6940fd142b02325272ad9b0d98a90ae49d5823b2a201c43c10f043cc00ef0'
            '2d33c37fcdb0f809daa69b5b8e763776310cfaaef75c82ed7ab4a2084260bb1f'
            '7fc2b726adb41bfc30899035594c00ac4694e5cd37dd49e355d897b85f9fe355')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}-app/g
    " "${srcdir}/${pkgname%-bin}.sh"
    if [ ! -x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" ];then
        chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage"
    fi
    if [ -d "${srcdir}/squashfs-root" ];then
        rm -rf "${srcdir}/squashfs-root"
    fi
    "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.AppImage" --appimage-extract > /dev/null
    sed -i -e "
        s/AppRun/${pkgname%-bin}/g
        s/${_shortname}_icon/${pkgname%-bin}/g
    " "${srcdir}/squashfs-root/${_shortname}.desktop"
    find "${srcdir}/squashfs-root" -type f -perm 600 -exec chmod 644 {} +
    find "${srcdir}/squashfs-root" -perm 700 -exec chmod 755 {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "${srcdir}/squashfs-root/." "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/${_shortname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/squashfs-root/${_shortname}_icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}