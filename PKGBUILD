# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ttkweather-bin
_pkgname=TTKWeather
pkgver=3.2.0.0
pkgrel=1
pkgdesc="TTKWeather forecast program, you can query the future weather conditions, based on Qt.(Prebuilt version)天气预报程序，可以查询未来的天气状况"
arch=('x86_64')
url="https://github.com/Greedysky/TTKWeather"
license=(
    'GPL-3.0-only'
    'LGPL-3.0-only'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'qt6-base'
    'libgpg-error'
    'openssl'
    'libxcb'
    'freetype2'
)
options=('!strip')
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-ubuntu-24.04-qt6-x64.deb"
    "${pkgname%-bin}.desktop"
    "${pkgname%-bin}.sh"
)
sha256sums=('8e006e90440a2e9e21ef2c1a5a8d9020be2d2360fef2a4110636145c35aa8e56'
            '16b7d171eccb2850cb3e664f8ba9313a50a618fe0de696709f1d336d04e97226'
            '4d70d090ce2d42eb020e170ac032345c954ecc723da08c4fb8e50624eba16a43')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_pkgname}/g
        s/@pkgver@/${pkgver}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/${_pkgname}.desktop/${pkgname%-bin}.desktop/g" "${srcdir}/opt/${_pkgname}/deploy/share/metainfo/${pkgname%-bin}.metainfo.xml"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/opt/${_pkgname}/deploy/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/opt/${_pkgname}/deploy/share/metainfo/${pkgname%-bin}.metainfo.xml" -t "${pkgdir}/usr/share/metainfo"
}