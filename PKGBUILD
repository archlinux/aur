# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tts-now-bin
pkgver=1.0.6
_electronversion=22
pkgrel=9
pkgdesc="Text-to-Speech assistant based on cloud platforms (Alibaba Cloud, iFLYTEK, etc.) Text To Speech API. Support single text fast synthesis and batch synthesis.(Prebuilt version.Use system-wide electron)基于云平台(阿里云、讯飞等)语音合成 API 的文字转语音助手。支持单文本快速合成和批量合成。"
arch=('x86_64')
url="https://tts.yycc.dev/"
_ghurl="https://github.com/funnyzak/tts-now"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'fuse2'
)
source=(
    "${pkgname%-bin}-${pkgver}.AppImage::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-ubuntu-latest-${pkgver}-33ac5a4.AppImage"
    "${pkgname%-bin}.sh"
)
sha256sums=('9539714adc1bf627fd75f00c3c1106ea6573e560ccd6ff015d1818774650c718'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    chmod +x "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage"
    "${srcdir}/${pkgname%-bin}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed -i "s/AppRun --no-sandbox/${pkgname%-bin}/g" "${srcdir}/squashfs-root/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/squashfs-root/usr/lib/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}