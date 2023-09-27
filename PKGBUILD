# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lightrail-core-bin
pkgver=0.1.2
pkgrel=1
pkgdesc="An open-source AI command bar that seeks to simplifies software development. It is designed to be a general-purpose, extensible platform for integrating LLM-based tooling into engineering/development workflows. "
arch=("x86_64")
url="https://lightrail.ai/"
_githuburl="https://github.com/lightrail-ai/lightrail"
license=("MIT")
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=('bash' 'electron24')
makedepends=('asar')
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${pkgname%-bin}.deb"
    "LICENSE::https://raw.githubusercontent.com/lightrail-ai/lightrail/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('6bbe17ad29e928dde3d5a5249dcae2d45a624618c66366946f2a7719dea9f9ad'
            '979fa2f24e61dc088e74d67f0cb0f6db041ea88b1574c5a1ec1c71c8a083a2c3'
            '28c77da9cd941cedd82bd4171d28bf65f9cdbaeb7b222f87a7dbf33f26ce7265')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar p "${srcdir}/opt/${pkgname%-core-bin}/resources/app" "${srcdir}/app.asar"
    sed "s|/opt/${pkgname%-core-bin}/${pkgname%-bin} %U|${pkgname%-bin}|g" -i "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}/resources"
    cp -r "${srcdir}/opt/${pkgname%-core-bin}/resources/lib" "${pkgdir}/opt/${pkgname%-bin}/resources"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}