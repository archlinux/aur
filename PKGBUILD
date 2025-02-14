# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: qaz <fkxxyz@163.com>
pkgname=tenvideo
_pkgname=Tenvideo
_appname=TencentVideo
_zhsname='腾讯视频'
pkgver=1.0.10
_electronversion=7
pkgrel=3
pkgdesc="China's leading online video media platform.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://v.qq.com"
license=('LicenseRef-custom')
conflicts=("${pkgname}")
provides=("${pkgname}=${pkgver}")
depends=(
  "electron${_electronversion}"
  'libappindicator-gtk3'
  'xdg-utils'
)
source=(
    "${pkgname}-${pkgver}.rpm::https://dldir1.qq.com/qqtv/linux/Tenvideo_universal-${pkgver}.${arch}.rpm"
    "LICENSE.htm::https://www.qq.com/contract20180827.htm"
    "${pkgname}.sh"
)
sha256sums=('5f26f0cf722dac9dd764abbb860d709de3122f756e8e29e20944b40ac2e17fd1'
            'SKIP'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname}_universal/g
        s/@options@//g
    " -i "${srcdir}/${pkgname}.sh"
    sed -e "
        s/\"\/opt\/${_zhsname}\/${_appname}\"/${pkgname}/g
        s/Icon=${_appname}/Icon=${pkgname}/g
    " -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/opt/${_zhsname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    _icon_sizes=(16x16 22x22 24x24 32x32 36x36 48x48 64x64 72x72 96x96 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/LICENSE.htm" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}