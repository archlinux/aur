# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=ting_en
pkgname="eusoft-${_appname//_/-}-bin"
_zhname='每日英语听力'
pkgver=10.1.3
_electronversion=11
pkgrel=1
pkgdesc="Listening statistics, note synchronization, and voice highlighting follow-up make learning English easy and enjoyable for you.(Prebuilt version.Use system-wide electron)听力统计、笔记同步、语音高亮跟随，让您轻松愉快学英语"
arch=('x86_64')
url="http://dict.eudic.net/ting"
license=('LicenseRef-custom')
conflicts=(
    "${pkgname%-bin}"
    "eudic-${_appname}"
)
depends=(
    "electron${_electronversion}"
    'ffmpeg'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://static.frdic.com/pkg/${_appname}/${_appname}.deb"
    "LICENSE.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('5806324c371d9115f7e7f46ead8816a3a2ba5e797403369cd40ae49111c4f5fc'
            '17651cf7ae49b0372b6b6812d8b3b066203892c9fbe0b04b25efec0ab038c12b'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e"
        s/\"\/opt\/${_zhname}\/${_appname}\"/${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
    " -i "${srcdir}/usr/share/applications/${_appname}.desktop"
    ln -sf "/usr/bin/ffmpeg" "${srcdir}/opt/${_zhname}/resources/app.asar.unpacked/ffmpeg-linux-x64"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_zhname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_zhname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/bin/ffmpeg" "${pkgdir}/usr/lib/${pkgname%-bin}/ffmpeg-linux-x64"
    install -Dm644 "${srcdir}/opt/${_zhname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(32x32 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}