# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Braeden Mollot <3mollot at gmail dot com>
_appname=min
pkgname="${_appname}-browser-bin"
_pkgname=Min
pkgver=1.31.0
_electronversion=29
pkgrel=1
pkgdesc="A fast, minimal browser that protects your privacy"
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://minbrowser.org/"
_ghurl="https://github.com/minbrowser/min"
license=('Apache')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}-arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}-armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_appname}-${pkgver}-amd64.deb")
source=(
    "${pkgname%-bin}.sh"
)
sha256sums=('d4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
sha256sums_aarch64=('71eed4f5c6121a7fc99719c978b1954d5006cd067c008a962da0cc3ac16366bd')
sha256sums_armv7h=('723625eedaa529eaba2d7d0ba1d32ce154a639060075a0238c8083eaef378944')
sha256sums_x86_64=('5d1848420cdad7d670fbda93466a212a11eedbf4769dc2f107b3c1f2dd41df3b')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${_appname}|${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/opt/${_pkgname}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}