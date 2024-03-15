# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=xunscore-bin
_pkgname=Xunscore
pkgver=1.3.13.02
pkgrel=5
pkgdesc='A music notation software, let you easily create and share sheet music. The editor is called "xūn", is hoping it will be a better balance between the Chinese national music'
arch=('x86_64')
url="https://www.xunscore.cn/"
_giteeurl="https://gitee.com/xunscore/xunapp"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'libglvnd'
    'libxrender'
    'libx11'
    'gst-plugins-base-libs'
    'libxext'
    'libxkbcommon'
    'fontconfig'
    'libxkbcommon-x11'
    'gstreamer'
    'libpulse'
    'freetype2'
    'libxcb'
    'alsa-lib'
    'libsndfile'
    'qt5-base'
)
makedepends=(
    'gendesk'
)
noextract=("${pkgname%-bin}-${pkgver}.zip")
source=(
    "${pkgname%-bin}-${pkgver}.zip::${_giteeurl}/releases/download/${pkgver%.02}/${pkgname%-bin}-ubt-${pkgver}.zip"
    "LICENSE-${pkgver}::${_giteeurl}/blob/${pkgver}/README.md"
    "${pkgname%-bin}-${pkgver}.png::https://foruda.gitee.com/avatar/1677181395504012245/9611953_xunscore_1629422881.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('53027cd57be24ed6b41c870830a3a10b5a8558c0064f3f20caff5fc03d5b2d2d'
            '58218adbfdf61f32c1648f4d587df6a871f8102f6e3964805acac2048b719365'
            '025373ba75679076a9a681b69057b632b17195cc9c3ece1192104efabbcae324'
            '6861d547ea70d70e42432abfacf3e5003683532271322e0a6e2985521bec9e3c')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${pkgname%-bin}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="AudioVideo" --name="${_pkgname}" --exec="${pkgname%-bin} %U"
    install -Dm755 -d "${srcdir}/opt"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.zip" -C "${srcdir}/opt"
    chmod 644 "${srcdir}/opt/${pkgname%-bin}/soundfonts/metronome.sf2"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    cp -r "${srcdir}/opt" "${pkgdir}"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}