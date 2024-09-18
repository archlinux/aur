# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=proxy-pin
pkgname="${_appname//-/}-bin"
_pkgname=ProxyPin
pkgver=1.1.3
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
sha256sums=('5d052ea3e1daa05def4f8f06aa0febd25b9b0af4dd36f939e93ace5f6e8511d0'
            '4b46d4c46f133f057b7859149b9e45689638ad849c4f0a8efabf2aacd6bf9142')
build() {
    sed -e "
        s/@appname@/${pkgname%-bin}/
        s/@runname@/${_pkgname}/
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s/\/opt\/${pkgname%-bin}\/${_pkgname}/${pkgname%-bin}/;s/\/opt\/${pkgname%-bin}\/data\/flutter_assets\/assets\/icon.png/${pkgname%-bin}/" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/opt/${pkgname%-bin}/${_pkgname}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r  "${srcdir}/opt/${pkgname%-bin}/"{data,lib} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/data/flutter_assets/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}