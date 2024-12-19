# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: weearc <q19981121@163.com>
pkgname=tencentvideo
_pkgname=TencentVideo
_zhsname='腾讯视频'
pkgver=1.0.10
_electronversion=7
pkgrel=2
pkgdesc="China's leading online video media platform.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://v.qq.com"
license=('LicenseRef-custom')
conflicts=("${pkgname%-bin}")
prodives=("${pkgname%-bin}=${pkgver}")
depends=(
	"electron${_electronversion}"
)
source=(
	"${pkgname%-bin}-${pkgver}.rpm::https://dldir1.qq.com/qqtv/linux/Tenvideo_universal-${pkgver}.${arch}.rpm"
	"LICENSE.htm::https://www.qq.com/contract20180827.htm"
	"${pkgname%-bin}.sh"
)
sha256sums=('5f26f0cf722dac9dd764abbb860d709de3122f756e8e29e20944b40ac2e17fd1'
            '7827da1d244c3f678ea95bf0f315311ebd3f0509c4efe306b2a3c523ab47a175'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/tenvideo_universal/g
        s/@options@//g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    sed -e "
        s/\"\/opt\/${_zhsname}\/${_pkgname}\"/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_zhsname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    _icon_sizes=(16x16 22x22 24x24 32x32 36x36 48x48 64x64 72x72 96x96 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE.htm" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
