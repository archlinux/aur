# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=huaweicloudmeeting-bin
_zhsname="华为云会议"
pkgver=9.12.5
_electronversion=25
pkgrel=1
pkgdesc='HuaWei Cloud Meeting."云端"协同的会议解决方案，全平台接入，全球覆盖，提供高清、稳定、安全、高效的极简会议体验'
arch=('x86_64')
url="https://www.huaweicloud.com/product/meeting"
_downurl="https://mirrors.sdu.edu.cn/spark-store-repository/store"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "welink" "deepin-wine-welink")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
source=(
    #"${pkgname%-bin}-${pkgver}.deb::https://softclient.meeting.huaweicloud.com/HUAWEICLOUDMeeting_DomesticOS.deb"
    "${pkgname%-bin}-${pkgver}.deb::${_downurl}//office/huaweicloudmeeting/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE.pdf::https://support.huaweicloud.com/bulletin-meeting/bulletin-meeting.pdf"
    "${pkgname%-bin}.sh"
)
sha256sums=('60e15e2a93c0529c4573a6c616e76b3e74f61f4f160e7d3279fde28993982f1f'
            'd4f805a9acfb65bd53da924e179f9cd432d38fb5e78e0ef293c5e1abc93e2ca0'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed -e "s|\"/opt/${_zhsname}/${pkgname%-bin}\"|${pkgname%-bin}|g" \
        -e "s|Education|Network|g" \
        -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_zhsname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE.pdf" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}