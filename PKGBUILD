# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=swc_ytdownloader
pkgname="${_pkgname//_/-}-bin"
_appname="YT Downloader"
pkgver=0.1.35
_electronversion=28
pkgrel=5
pkgdesc="Download and convert Videos from YouTube and other sites with thumbnail and metadata support.(Prebuilt version.Use system-wide electron)"
arch=('x86_64')
url="https://projects.software-city.org/p/yt-downloader"
_ghurl="https://github.com/Davis-Software/YTDownloader"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Davis-Software/YTDownloader/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('1f953b115ff947dc13df8bcc61be85ef1e274b7f0554b951653f67edf8069ec4'
            '6c05069775fad84e1ae33b25f8dee3ec183ea8bf2270df24485de616237443bd'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_appname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\"\/opt\/${_appname}\/${_pkgname}\"/${pkgname%-bin}/g
        s/${_pkgname}/${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}