# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=macchatgpt
_pkgname=MacChatGPT
pkgver=1.0.0
pkgrel=1
pkgdesc="A macOS, Windows and Linux desktop application which runs ChatGPT easily and free of charge."
arch=('x86_64')
url="https://github.com/justinhartman/MacChatGPT"
license=("custom")
conflicts=("${pkgname}")
depends=('bash' 'electron23')
makedepends=('gendesk' 'npm' 'nodejs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz"
    "${pkgname}.sh")
sha256sums=('3fbbec7720b52c2a39138fdd3f9d74a947527c36ba07348082cf491cf2f192a1'
            '4edfc8cd3e7befed183ac9255e24d6cb7362bd3a0974fb1869ebfa235c8e8a43')
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    npm install
    npm run package:linux:x64
    asar pack "${srcdir}/${_pkgname}-${pkgver}/dist/build/${_pkgname}-linux-x64/resources/app" "${srcdir}/${pkgname}.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.asar" -t "${pkgdir}/opt/${pkgname}"
    gendesk -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/assets/icons/png/512x512.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/dist/build/${_pkgname}-linux-x64/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}