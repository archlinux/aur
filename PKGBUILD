# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=medict-bin
pkgver=2.0.10
pkgrel=4
pkgdesc="A cross platform dictionary application,support mdict (*.mdx/*.mdd) dictionary format"
arch=("x86_64")
url="https://github.com/terasum/medict"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron13')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}_amd64.zip::${url}/releases/download/v${pkgver}-latest/${pkgname%-bin}-linux-amd64-${pkgver}-6d93e4c-20211020T110929UTC.zip"
    "LICENSE::https://raw.githubusercontent.com/terasum/medict/v${pkgver}-latest/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('2f4f90af2945f92272e7119a80937481cf34c1c8d78ccdec5bb8849ef2654b83'
            '590729f7f97ea0ad2baabbb6d8e23e0458520a3e2d9bc14d730c43ee43225d64'
            '3fae0d0e4567210aca11026a7409a30a60528d18a9d9b73282f757557320d6a3')
prepare() {
    bsdtar -xf "${srcdir}/${pkgname%-bin}_${pkgver}_amd64.deb"
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar pack "${srcdir}/usr/lib/${pkgname%-bin}/resources/app" "${srcdir}/app.asar"
    sed "s|${pkgname%-bin} %U|/opt/${pkgname%-bin}/${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}