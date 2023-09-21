# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=huaweicloudmeeting-bin
_zhsname="华为云会议"
pkgver=8.11.1
pkgrel=1
pkgdesc='HuaWei Cloud Meeting."云端"协同的会议解决方案，全平台接入，全球覆盖，提供高清、稳定、安全、高效的极简会议体验'
arch=('x86_64')
url="https://www.huaweicloud.com/product/meeting"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron>=20' 'hicolor-icon-theme')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::https://softclient.meeting.huaweicloud.com/HUAWEICLOUDMeeting_DomesticOS.deb"
    "LICENSE.pdf::https://support.huaweicloud.com/bulletin-meeting/bulletin-meeting.pdf"
    "${pkgname%-bin}.sh")
sha256sums=('73e0929fe6bc2b8b94c93f1b88bdce2e387ca289e5df00f80e0a9921c9ae0107'
            '26d78bbf3d4a6ffbb28eb087dd58e843064a6df1c6d3ae6d672669bfa3b239c5'
            '4d771618a7fad958ad1372c79347aa48d633092c9abb4683c8153c620546e481')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar p "${srcdir}/opt/${_zhsname}/resources/app" "${srcdir}/app.asar"
    sed '/Exec/d' -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    echo "Exec=${pkgname%-bin}" >> "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    sed "s|Education|Education;Network;Utility|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    for _icons in 16x16 32x32 64x64 128x128 256x256 512x512;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/LICENSE.pdf" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}