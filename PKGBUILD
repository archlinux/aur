# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=youtube-music
pkgname="electron-${_appname}-bin"
_pkgname="Youtube Music"
pkgver=1.0.0
_electronversion=23
pkgrel=5
pkgdesc="A minimal electron app for Youtube Music"
arch=('x86_64')
url="https://github.com/pauchiner/electron-youtube-music"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/Linux.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('7f12ca29771515ff0735af72b639d7c1bb609e14b7dd69d506e65a11a03c1cc3'
            '5ce46265f0335b03568aa06f7b4c57c5f8ffade7a226489ea39796be91a511bf')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|\"/opt/${_pkgname}/${_appname}\" %U|${pkgname%-bin}|g;s|=${_appname}|=${pkgname%-bin}|g;s|Music;|AudioVideo;|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/opt/${_pkgname}/"LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}