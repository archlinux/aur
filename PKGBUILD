# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=woniu_ali
pkgname="${_appname//_/-}-bin"
pkgver=1.4.2
pkgrel=1
pkgdesc="蜗牛云盘PC版"
arch=(
    'aarch64'
    'x86_64'
)
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
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_mrurl}/releases/download/${_appname}-${pkgver}/${_appname}_linux_arm64_${pkgver}.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_mrurl}/releases/download/${_appname}-${pkgver}/${_appname}_linux_x64_${pkgver}.rpm")
sha256sums=('95c4e7fcdebf229da8f58a47cda68ec09b4524fe34b56df2dfc89faa5644facb')
sha256sums_aarch64=('905d818c6b32dc3ec66863748e28ed4e00e962d54d7a41b01385e2e30e0b02de')
sha256sums_x86_64=('27cd03d10eb22f17a842648b63cd25fa1e7ad630b26f6962a7bbd68532e9ca86')
prepare() {
    case "${CARCH}" in
        aarch64)
            _archname='arm64'
            ;;
        x86_64)
            _archname='x64'
            ;;
    esac
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_appname}_linux_${_archname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/\/opt\/${_appname}_linux_${_archname}\/${_appname}_linux_${_archname} %U/${pkgname%-bin} %U/g
        s/\/opt\/${_appname}_linux_${_archname}\/${_appname}_linux_${_archname}.png/${pkgname%-bin}/g
        s/Utility/Network;/g
    " "${srcdir}/opt/${_appname}_linux_${_archname}/${_appname}_linux_${_archname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}/mpv"
    case "${CARCH}" in
        aarch64)
            _archname='arm64'
            ;;
        x86_64)
            _archname='x64'
            ;;
    esac
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_appname}_linux_${_archname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/bin/mpv" "${pkgdir}/usr/lib/${pkgname%-bin}/mpv/mpv"
    install -Dm644 "${srcdir}/opt/${_appname}_linux_${_archname}/${_appname}_linux_${_archname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${_appname}_linux_${_archname}/${_appname}_linux_${_archname}.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}