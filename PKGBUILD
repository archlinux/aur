# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nativefier-gui-bin
pkgver=0.9.0
_electronversion=26
pkgrel=3
pkgdesc="Graphical user interface for nativefier. Make any web page a desktop application."
arch=(
    "aarch64"
    "armv7h"
    "x86_64"
)
url="https://mattruzzi.github.io/nativefier-gui/"
_ghurl="https://github.com/mattruzzi/nativefier-gui"
license=('custom')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'java-runtime'
)
makedepends=(
    'gendesk'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-linux-arm64.zip")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.zip::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-linux-armv7l.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-linux-x64.zip")
source=("${pkgname%-bin}.sh")
sha256sums=('8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
sha256sums_aarch64=('7e0f3055aab320dd7b337dc1cf8f222c3b023e7495265b90bc9e0b4d5834cb26')
sha256sums_armv7h=('d4b35c11f7e27e96fa8602c05eb70df7a86829b72799a9da6b949ea656872c79')
sha256sums_x86_64=('646a5400588a25186361eeab27282e6a4a28edc400e1585a5dee48a8c72c6360')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f --categories "Development;Utility" --name "${pkgname%-bin}" --exec "${pkgname%-bin}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -r "${srcdir}/resources/app" "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}