# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=huaweicloudmeeting-bin
_pkgname=HuaWeiCloudMeeting
_zhsname='华为云会议'
pkgver=9.12.5
_electronversion=22
pkgrel=6
pkgdesc='HuaWei Cloud Meeting.Prebuilt version.Use system-wide electron."云端"协同的会议解决方案，全平台接入，全球覆盖，提供高清、稳定、安全、高效的极简会议体验'
arch=('x86_64')
url="https://www.huaweicloud.com/product/meeting"
_dlurl="https://mirrors.sdu.edu.cn/spark-store/amd64-store"
license=('LicenseRef-unknown')
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
    "${pkgname%-bin}-${pkgver}.deb::${_dlurl}/office/${pkgname%-bin}/${pkgname%-bin}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('60e15e2a93c0529c4573a6c616e76b3e74f61f4f160e7d3279fde28993982f1f'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\"\/opt\/${_zhsname}\/${pkgname%-bin}\"/${pkgname%-bin}/g
        s/Education/Network/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_zhsname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 64x64 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/opt/${_zhsname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}