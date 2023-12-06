# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aliyun-adrive-bin
pkgver=4.9.16
_electronversion=25
pkgrel=1
pkgdesc="Aliyun aDrive阿里云盘"
arch=('x86_64')
url="https://www.aliyundrive.com"
license=('custom')
conflicts=("${pkgname%-bin}" "deepin-wine-adrive" "adrive")
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
sha256sums=('bb36e6204d6be7073ca9b13f273b55f788cd48dc9a849251a26b3239438b08d4'
            'e266be0821c3ebe2521767404dccb1d4cd4000be8fe318174bdb5c70ac015509'
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "Network" --name "${pkgname%-bin}阿里云盘" --exec "${pkgname%-bin}"
    mkdir -p "${srcdir}/tmp"
    7z x -aoa "${srcdir}/${pkgname%-bin}-${pkgver}.exe" -o"${srcdir}/tmp"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/tmp/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/tmp/resources/"{app.asar.unpacked,resource} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar.unpacked/resource/common/icon@512.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}