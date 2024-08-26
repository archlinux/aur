# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=proxy-pin
pkgname="${_appname//-/}-bin"
_pkgname=ProxyPin
pkgver=1.1.2
pkgrel=1
pkgdesc="Open source free packet capture tool"
arch=('x86_64')
url="https://github.com/wanghongenpin/network_proxy_flutter"
_gturl="https://gitee.com/wanghongenpin/network-proxy-flutter"
license=('Apache-2.0')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    'ca-certificates'
    'gtk3'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/V${pkgver}/${_pkgname}-Linux.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('9f9cbecbcd36cd31646cfe8e0a48f63076bd89aeac4abf7c0ed0ace90ede5046'
            '60f4e2b273d7bd3824b2809a5bff457eead0938496f9e62f72ef3a9026d78377')
build() {
    sed -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|${_pkgname}|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${pkgname%-bin}/${_pkgname}|${pkgname%-bin}|g;s|/opt/${pkgname%-bin}/data/flutter_assets/assets/icon.png|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/opt/${pkgname%-bin}/${_pkgname}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r  "${srcdir}/opt/${pkgname%-bin}/"{data,lib} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/data/flutter_assets/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}