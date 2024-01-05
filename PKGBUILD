# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=dk-c++-bin
_pkgname=DK-C++
pkgver=1.3.0
_electronversion=19
pkgrel=4
pkgdesc="A C++ IDE designed for easy use."
arch=('x86_64')
url="https://github.com/EntityPlantt/DK-CPP"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'gcc'
    'nodejs'
)
makedepends=(
    'gendesk'
    'imagemagick'
)
source=(
    "${pkgname%-bin}-${pkgver}.7z::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64.7z"
    "${pkgname%-bin}.sh"
)
sha256sums=('3b59ed87183c16072a6db41108c940cece6d5c51a452c6a48c78f1b8d69315d2'
            '5ce46265f0335b03568aa06f7b4c57c5f8ffade7a226489ea39796be91a511bf')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "Development" --name "${_pkgname}" --exec "${pkgname%-bin}"
    convert "${srcdir}/resources/app/icon.ico" "${srcdir}/${pkgname%-bin}.png"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}