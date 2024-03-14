# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lemmy-modder-app-bin
_pkgname="Lemmy Modder"
pkgver=0.4.0
_electronversion=25
pkgrel=6
pkgdesc="A Lemmy moderation tool for community moderators and site admins, but on steroids."
arch=("x86_64")
url="https://github.com/tgxn/lemmy-modder"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}-bin"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname// /}-${pkgver}-linux-amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/tgxn/lemmy-modder/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('14a0d44f25b697e85095c8d4edd1d054182e0cff47214b886b0a37891c4947d9'
            'cd61b504273b9fe1901027491f0a1d6164fe20053ebe74838ba7783760424759'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
build() {
    sed -e "s|@electronversion@|${_electronversion}|g" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|\"/opt/${_pkgname}/${pkgname%-bin}\"|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" -t "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}