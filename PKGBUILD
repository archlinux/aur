# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=epub-reader-bin
_pkgname=EpubReader
pkgver=1.0.6
_electronversion=18
pkgrel=1
pkgdesc="Epub/Book Reader Application built with ElectronJS.(Prebuilt version.Use system-wide electron)"
arch=('any')
url="https://mignaway.github.io/epub-reader-website/"
_ghurl="https://github.com/mignaway/EpubReader"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${_ghurl}/releases/download/v${pkgver}/${_pkgname}.Setup.${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/mignaway/EpubReader/v${pkgver}/LICENSE.md"
    "${pkgname%-bin}.sh"
)
sha256sums=('46a5be7160435e109884d4fcc64b280238046cf71390372d9cab7921c2789746'
            'ce48b5317d1ff1f40849dbbcb8f9a99291d05ec067a89f4f60d1e2f6bfd40b01'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i "s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${_pkgname}/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-bin}/swiftshader"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/changelog.gz" -t "${pkgdir}/usr/share/doc/${pkgname}"
}