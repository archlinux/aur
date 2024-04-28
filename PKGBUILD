# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Braeden Mollot <3mollot at gmail dot com>
_appname=min
pkgname="${_appname}-browser-bin"
_pkgname=Min
pkgver=1.32.0
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
license=('Apache-2.0')
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
sha256sums=('dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
sha256sums_aarch64=('8217f816f84a1cd1eca14ab9f2b6be6237c471765945417872719d4012f99e51')
sha256sums_armv7h=('256706c3e507a779c3f1a8daaa86aa816638a1b2670342b0ffc8c70a6280f88b')
sha256sums_x86_64=('d6dfb0f65a2bfd802c1b1f3be641db7bd1b9c1c5a6297ef3eaf27c787e9783da')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
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