# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=pocket-casts
pkgname="${_pkgname}-desktop-bin"
pkgver=0.7.0
pkgrel=1
pkgdesc="The Pocket Casts webapp, packaged for the Linux Desktop."
arch=('aarch64' 'x86_64')
url="https://github.com/felicianotech/pocket-casts-desktop-app"
license=('MIT')
provides=("${_pkgname}=${pkgver}")
conflicts=("${pkgname%-bin}" "${_pkgname}")
depends=('bash' 'electron27')
makedepends=('asar')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_pkgname}--v${pkgver}--arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}--v${pkgver}--amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/felicianotech/pocket-casts-desktop-app/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('5478e5a98666c41de828fb7f50c3ea53b05755b7bda7d11211c6b1406d3046ba'
            '8ba19d44bc86885e3f262ae6584b9c9081e23134fbd15e2f638b46df34093d79')
sha256sums_aarch64=('fc8248c7503e195a85029db63e7ed9befbe2aa361cbc628589116df129f56f7b')
sha256sums_x86_64=('979c2ce0a73188eb5218942949af538de97dc0a6e71581c927858399b1b82d37')
build() {
    bsdtar -xf "${srcdir}/data.tar.zst"
    asar pack "${srcdir}/usr/lib/${_pkgname}/resources/app" "${srcdir}/${pkgname%-bin}.asar"
    sed "s|${_pkgname} %U|${pkgname%-bin}|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}