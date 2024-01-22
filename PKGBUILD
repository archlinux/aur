# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=swc_ytdownloader
pkgname="${_pkgname//_/-}-bin"
_appname="YT Downloader"
pkgver=0.1.34
_electronversion=28
pkgrel=1
pkgdesc="Download and convert Videos from YouTube and other sites with thumbnail and metadata support"
arch=("x86_64")
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
sha256sums=('2885015996edbe7d3d40a6a0055ffcc8e5f2f0d4061ac10e4a15484b43a74f81'
            '6c05069775fad84e1ae33b25f8dee3ec183ea8bf2270df24485de616237443bd'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed -e "s|\"/opt/${_appname}/${_pkgname}\"|${pkgname%-bin}|g" \
        -e "s|${_pkgname}|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_appname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}