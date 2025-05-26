# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=logseq-desktop
pkgname="${_appname}-electron-bin"
_pkgname=Logseq
pkgver=0.10.12
_electronversion=36
pkgrel=1
pkgdesc="Privacy-first, open-source platform for knowledge sharing and management.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://logseq.com/"
_ghurl="https://github.com/logseq/logseq"
license=('AGPL-3.0-or-later')
provides=("${_appname}=${pkgver}")
conflicts=(
    "${_appname}"
    "${pkgname%-bin}"
)
depends=(
    "electron${_electronversion}"
    'nodejs'
    'perl'
)
makedepends=(
    'gendesk'
)
options=(
    '!emptydirs'
    '!strip'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/${pkgver}/${_pkgname}-linux-arm64-${pkgver}.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/${pkgver}/${_pkgname}-linux-x64-${pkgver}.zip")
sha256sums=('291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('903d7b58ce3447a9f22f4e7600151f2ac6d9932c88a05cbb5a4bf176c721ce6d')
sha256sums_x86_64=('bb5136841dceb6095fcff70d30d2cc190dab37539985e61417f59381d088ea0d')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Office" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -Pr --no-preserve=ownership "${srcdir}/${_pkgname}-linux-"*/resources/app  "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-linux-"*/resources/app/icon.png "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}