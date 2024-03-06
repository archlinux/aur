# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=dk-c++-bin
_pkgname=DK-C++
pkgver=1.3.0
_electronversion=19
pkgrel=6
pkgdesc="A C++ IDE designed for easy use."
arch=('x86_64')
url="https://github.com/EntityPlantt/DK-CPP"
license=('LicenseRef-custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
    'gcc'
    'nodejs'
)
makedepends=(
    'gendesk'
    'imagemagick'
)
source=(
    "${pkgname%-bin}-${pkgver}.7z::${url}/releases/download/v${pkgver}/${_pkgname}-linux-x64.7z"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/EntityPlantt/DK-CPP/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('3b59ed87183c16072a6db41108c940cece6d5c51a452c6a48c78f1b8d69315d2'
            '118e8d39dc5b8e68c533eb798f8e569b056c1238c7d8a2ab4c7eefd7067eea0d'
            '50b10386d13e5bec806aeb78f819c4edd0208a4d184332e53866c802731217fe')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories="Development" --name="${_pkgname}" --exec="${pkgname%-bin}"
    convert "${srcdir}/resources/app/icon.ico" "${srcdir}/${pkgname%-bin}.png"
    sed "s|icon.ico|icon.png|g" -i "${srcdir}/resources/app/app.js"
    sed "s|icon.ico|icon.png|g" -i "${srcdir}/resources/app/installer.js"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" "${srcdir}/resources/app/icon.png"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}