# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=daily_diary
pkgname="${_appname//_/-}-bin"
_pkgname=Daily-Diary
pkgver=1.4.5
pkgrel=1
pkgdesc="An app to create a diary entry every day.(Prebuilt version)"
arch=('x86_64')
url="https://github.com/Voklen/Daily-Diary"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
)
makedepends=(
    'gendesk'
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/${_appname}_linux.tar.gz"
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/Voklen/Daily-Diary/v${pkgver}/metadata/en-GB/images/icon.png"
    "${pkgname%-bin}.sh"
)
sha256sums=('b3d2629a4fa40a82110797d590f7a2f81cec990fdbf027a25f871ccb72fc60a6'
            'dc10c98253ebd96235ef66b2343a1f3a73a83d90ce7222fb81b8d5e79e6c341d'
            '3b8311438e88f47eb507322a43c7a4156bfebb8c0f6e7b7436ef70842fb4c745')
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${_appname}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/${_pkgname}/${_appname}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/${_pkgname}/"{data,lib} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}