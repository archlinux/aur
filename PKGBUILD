# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=my_dict
pkgname="${_appname//_/}-bin"
_pkgname=MyDict
pkgver=0.6.14
pkgrel=7
pkgdesc='A Chinese and English dictionary.(Prebuilt version)一款中英文词典'
arch=(x86_64)
url="https://github.com/xxNull-lsk/my_dict"
license=('BSD-3-Clause')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt5-websockets'
    'qt5-declarative'
    'qt5-svg'
    'qt5-wayland'
    'alsa-lib'
    'qt5-base'
    'qt5-multimedia'
    'gtk3'
    'gstreamer'
    'libasyncns'
    'gst-plugins-base-libs'
    'libxcrypt-compat'
    'openssl-1.1'
    'libbsd'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${pkgname%-bin}_linux_x64_${pkgver}.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('9594f46ba84aa260abb4d775a2dbcef0ce12d688380686b2b7bdb06a2d08ddab'
            '04c2f1edf0c04742143b3c67d47e1bfff80569240726752bcf0d689842e94f30')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/opt\/${_appname}\/${pkgname%-bin}/${pkgname%-bin}/g
        s/\/opt\/${_appname}\/res\/dict.png/${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_appname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${_appname}/res/dict.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/opt/${_appname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}