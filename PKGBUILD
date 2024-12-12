# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=proxy-pin
pkgname="${_appname//-/}-bin"
_pkgname=ProxyPin
pkgver=1.1.6
pkgrel=2
pkgdesc="Open source free packet capture tool.(Prebuilt version)"
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
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}-Linux.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('750c4a3d66ad3cdf4831f9c4459c2735f58a66c3a03f2d012a677f14019e9eb3'
            '4b46d4c46f133f057b7859149b9e45689638ad849c4f0a8efabf2aacd6bf9142')
prepare() {
    sed -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -e "
        s/\/opt\/${pkgname%-bin}\/${_pkgname}/${pkgname%-bin}/g
        s/\/opt\/${pkgname%-bin}\/data\/flutter_assets\/assets\/icon.png/${pkgname%-bin}/g
    " -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/opt/${pkgname%-bin}/${_pkgname}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership  "${srcdir}/opt/${pkgname%-bin}/"{data,lib} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/data/flutter_assets/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}
