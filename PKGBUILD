# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aliyun-adrive-bin
pkgver=4.11.0
_electronversion=25
pkgrel=1
pkgdesc="Aliyun aDrive阿里云盘"
arch=('x86_64')
url="https://www.aliyundrive.com"
license=('LicenseRef-custom')
conflicts=(
    "${pkgname%-bin}"
    "deepin-wine-adrive"
    "adrive"
)
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'p7zip'
)
source=(
    "${pkgname%-bin}-${pkgver}.exe::https://cdn.aliyundrive.net/downloads/apps/desktop/aDrive-${pkgver}.exe"
    "LICENSE.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('507bf86e5dffe75fc9cdd8caea0e1b284dd10dfeba435e331040c305958df7a6'
            'e266be0821c3ebe2521767404dccb1d4cd4000be8fe318174bdb5c70ac015509'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "Network" --name "${pkgname%-bin}阿里云盘" --exec "${pkgname%-bin} %U"
    install -Dm755 -d "${srcdir}/tmp"
    7z x -aoa "${srcdir}/${pkgname%-bin}-${pkgver}.exe" -o"${srcdir}/tmp"
    find "${srcdir}/tmp/resources" -type d -exec chmod 755 {} \;
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/tmp/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/tmp/resources/"{app.asar.unpacked,resource} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/tmp/\$TEMP/aDriveSetup/res/form/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}