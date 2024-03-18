# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=huaweicloudmeeting-bin
_zhsname="华为云会议"
pkgver=9.12.5
_electronversion=22
pkgrel=3
pkgdesc='HuaWei Cloud Meeting."云端"协同的会议解决方案，全平台接入，全球覆盖，提供高清、稳定、安全、高效的极简会议体验'
arch=('x86_64')
url="https://www.huaweicloud.com/product/meeting"
_downurl="https://mirrors.sdu.edu.cn/spark-store-repository/store"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "welink"
    "deepin-wine-welink"
)
depends=(
    "electron${_electronversion}"
)
source=(
    #"${pkgname%-bin}-${pkgver}.deb::https://softclient.meeting.huaweicloud.com/HUAWEICLOUDMeeting_DomesticOS.deb"
    "${pkgname%-bin}-${pkgver}.deb::${_downurl}//office/huaweicloudmeeting/${pkgname%-bin}_${pkgver}_amd64.deb"
    "LICENSE.pdf::https://support.huaweicloud.com/bulletin-meeting/bulletin-meeting.pdf"
    "${pkgname%-bin}.sh"
)
sha256sums=('60e15e2a93c0529c4573a6c616e76b3e74f61f4f160e7d3279fde28993982f1f'
            'df7f623a3d1b0d3fd2d54aefb4f59db8d859d3095b7bf71b77cd138085193241'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
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