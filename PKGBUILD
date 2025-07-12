# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=ting_es
pkgname="eusoft-${_pkgname//_/-}-bin"
_zhname='每日西语听力'
pkgver=10.2.0
_electronversion=11
pkgrel=1
pkgdesc="Listening statistics, note synchronization, and voice highlighting follow-up make learning Spanish easy and enjoyable for you.(Prebuilt version.Use system-wide electron)听力统计、笔记同步、语音高亮跟随，让您轻松愉快学西班牙语"
arch=('x86_64')
url="https://www.esdict.cn/ting"
license=('LicenseRef-custom')
conflicts=(
    "${pkgname%-bin}"
    "eudic-${_pkgname//_/-}"
    "${_pkgname//_/-}"
)
depends=(
    "electron${_electronversion}"
    'ffmpeg'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::https://static.frdic.com/pkg/${_pkgname}/${_pkgname}.deb"
    "LICENSE.html"
    "${pkgname%-bin}.sh"
)
sha256sums=('7bbc2b98d367063fab39df4cf26811a45a5328b5abe3797d9795aa8bd97cbaff'
            'bb199c3faf0e1155a5bc43512e1898e6604034a67d9e2f4d16840b3b359cc432'
            'f2fe8c189974ffb9d445e9a42bd4f1d5b60185607c3fcafae79ab44be224e013')
_get_electron_version() {
    _electronversion="$(strings "${srcdir}/opt/${_zhname}/${_pkgname}" | grep '^Chrome/[0-9.]* Electron/[0-9]' | cut -d'/' -f3 | cut -d'.' -f1)"
    echo -e "The electron version is: \033[1;31m${_electronversion}\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _get_electron_version
    sed -i -e "
        s/\"\/opt\/${_zhname}\/${_pkgname}\"/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    ln -sf "/usr/bin/ffmpeg" "${srcdir}/opt/${_zhname}/resources/app.asar.unpacked/ffmpeg-linux-x64"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_zhname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_zhname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/bin/ffmpeg" "${pkgdir}/usr/lib/${pkgname%-bin}/ffmpeg-linux-x64"
    install -Dm644 "${srcdir}/opt/${_zhname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(32x32 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
