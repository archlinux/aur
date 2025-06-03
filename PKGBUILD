# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=autho-iptv-bin
_pkgname=AuthoIPTV
pkgver=0.6.4_beta
_electronversion=34
pkgrel=1
pkgdesc="A Smart and Seamless IPTV Player Application.(Prebuilt version.Use system-wide electron)"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://glitport.github.io/AuthoIPTV/"
_ghurl="https://github.com/glitport/AuthoIPTV"
license=('LicenseRef-freeware')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/glitport/AuthoIPTV/v${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_/-}-linux-arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_ghurl}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_/-}-linux-armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_/-}-linux-amd64.deb")
sha256sums=('2e72b3f0811dda8d464a833468aeaa20706230c01462c961a3581db929d2fe60'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('5b622ea83bbbf9591ac270efef9630fb03b5b30d4e305317b2cddb829620b22d')
sha256sums_armv7h=('3ad39d30df1986252805a597952a258b5b17107ac78835050ecb87f8dc0dc141')
sha256sums_x86_64=('fc0c26a6dfe258b5179338c77536b9a6415bd617f83baf34b5c10971af7dd321')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-bin}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/opt\/${_pkgname}\///g
        s/Video/AudioVideo/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
