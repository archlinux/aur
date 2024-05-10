# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bluestone-bin
_pkgname=Bluestone
_newname=Inkdown
pkgver=0.22.0
_electronversion=29
pkgrel=1
pkgdesc="A WYSIWYG Markdown editor, improve reading and editing experience."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/1943time/bluestone"
license=('AGPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-linux-amd64.deb")
source=(
    "${pkgname%-bin}.sh"
)
sha256sums=('05762c556c85a4423b28600ccbbe7b7dcdd3d1be526ef4a588a510671fa6c62a')
sha256sums_aarch64=('cdaf724d789c0b84a875c9546e78aaca12e60f9e48374240ef5b3c00b1895af4')
sha256sums_x86_64=('d80a6e25acc407710009792282d5c1c2870591977b250b0a5ea9837571e505cf')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed "s|/opt/${_newname}/${_newname}|${pkgname%-bin}|g;s|Icon=${_newname}|Icon=${pkgname%-bin}|g;s|Markdown|Utility|g" \
        -i "${srcdir}/usr/share/applications/${_newname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_newname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r  "${srcdir}/opt/${_newname}/resources/app.asar.unpacked" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_newname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_newname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}