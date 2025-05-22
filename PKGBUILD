# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=logseq-desktop
pkgname="${_appname}-electron-bin"
_pkgname=Logseq
pkgver=0.10.11
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
sha256sums_aarch64=('bdf0c48ac97e2a92b14925e0d0ac684bd0df05eec6ba34d7dd5f87914794021f')
sha256sums_x86_64=('6920a08e87a7be9217cdfcf47a5233176c85a34052e5b2b18ebd8b58019330de')
prepare() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
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