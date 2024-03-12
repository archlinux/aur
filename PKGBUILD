# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=woniu_ali
pkgname="${_appname//_/-}-bin"
pkgver=1.4.0
pkgrel=1
pkgdesc="蜗牛云盘PC版"
arch=("x86_64")
url="https://snail8.cn/app"
_dlurl="https://www.aliyundrive.com/s/fqu79Z2dBbu/folder/638720ab185b2cf913ce4f438aacd4395844098b"
_mrurl="https://github.com/zxp19821005/My_AUR_Files"
license=('LicenseRef-unknown')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'ffmpeg4.4'
    'alsa-lib'
    'gtk2'
    'mpv'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_mrurl}/releases/download/${_appname}-${pkgver}/${_appname}_linux_x64_${pkgver}.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('9279d0419eddf8b083e8952dab9d88f773446e047d622c74c5e2a7675919c0cc'
            '251f65f733d0fee607980dea3de42119be67693c32cbeeb1ba6d502e64fe4b63')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_appname}_linux_x64|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "s|/opt/${_appname}_linux_x64/${_appname}_linux_x64 %U|${pkgname%-bin} %U|g" \
        -e "s|/opt/${_appname}_linux_x64/${_appname}_linux_x64.png|${pkgname%-bin}|g" \
        -e "s|Utility|Network;|g" \
        -i "${srcdir}/usr/share/applications/${_appname}_linux_x64.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}/mpv"
    cp -r "${srcdir}/opt/${_appname}_linux_x64/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/usr/bin/mpv" "${pkgdir}/opt/${pkgname%-bin}/mpv/mpv"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}_linux_x64.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${_appname}_linux_x64/${_appname}_linux_x64.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}