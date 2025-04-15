# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=app_rhyme
pkgname="${_appname//_/}-bin"
_pkgname=AppRhyme
pkgver=1.0.9
pkgrel=1
pkgdesc="Cross-platform custom audio music player developed with Flutter and Rust.(Prebuilt version)使用Flutter和Rust开发的跨平台自定义音源音乐播放器"
arch=('x86_64')
url="https://github.com/canxin121/app_rhyme"
license=(
    'Apache-2.0'
    'MIT'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/v${pkgver}/${_pkgname}-release-linux-${CARCH}-${pkgver}.rpm"
    "LICENSE-MIT-${pkgver}.txt::https://raw.githubusercontent.com/canxin121/app_rhyme/v${pkgver}/LICENSE-MIT.txt"
    "${pkgname%-bin}.sh"
)
sha256sums=('75ffa05dd86e6f8149fd44685e369c90fc1b3a50ae43989bef0fd5a77a090c2e'
            'c42abea1f8991d1a9024792163533e7976a13e8cdf5e6a3daaf7b3e8188239d9'
            '3fa20f85c87576bc9daa1db5d163def5aa239d040b7e308d747cc46bdd1b1713')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i -e "
        s/Categories=Music;Player;/Categories=AudioVideo;/g
        s/Exec=${_appname}/Exec=${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/usr/share/${_appname}/${_pkgname}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${_appname}/"{data,lib} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-MIT-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}