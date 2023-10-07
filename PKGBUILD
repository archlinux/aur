# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=armcord
_pkgname=ArmCord
pkgver=3.2.4_libwebp
pkgrel=1
pkgdesc="A custom client designed to enhance your Discord experience while keeping everything lightweight."
arch=('any')
url="https://armcord.app/"
_githuburl="https://github.com/ArmCord/ArmCord"
license=('custom:OSL3')
conflicts=("${pkgname}")
depends=('bash' 'electron26')
makedepends=('gendesk' 'pnpm>=7.13.4' 'nodejs>=18.0.0' 'npm')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver//_/-}.tar.gz"
    "${pkgname%-bin}.sh")
sha256sums=('c378d7f6ed419bc9348a1f65077c1c134091b3466e0898767dd22cd8864771ff'
            '1ad6cfe6fd145014efd043d0b87467357a40c88685c0444ae2604d345f8b16a7')
prepare() {
    gendesk -q -f -n --categories "Network;Utility" --name "${_pkgname}" --exec "${pkgname}"
}
build() {
    cd "${srcdir}/${_pkgname}-${pkgver//_/-}"
    pnpm install
    sed '/deb/d;/tar.gz/d;/rpm/d' -i package.json
    pnpm run packageQuick
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/dist/linux-unpacked/resources/app.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}