# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=x-minecraft-launcher-bin
_appname="X Minecraft Launcher"
pkgver=0.38.1
_electronversion=27
pkgrel=1
pkgdesc="An Open Source Minecraft Launcher with Modern UX. Provide a Disk Efficient way to manage all your Mods!"
arch=('aarch64' 'x86_64')
url="https://xmcl.app/"
_ghurl="https://github.com/Voxelum/x-minecraft-launcher"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.asar::${_ghurl}/releases/download/v${pkgver}/app-${pkgver}-linux-arm64.asar")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.asar::${_ghurl}/releases/download/v${pkgver}/app-${pkgver}-linux.asar")
source=(
    "${pkgname%-bin}-${pkgver}.png::https://raw.githubusercontent.com/Voxelum/x-minecraft-launcher/v${pkgver}/xmcl-electron-app/icons/dark%40256x256.png"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Voxelum/x-minecraft-launcher/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('4c56e72cc6784c4c2d870c307d74e7afa6c13b001bb52f9b255cd82ab709adcb'
            '72e17fb1c83deda594cf7c6bf61b45ee31880b86e2d526e9a4b16d2d8b3fc7fa'
            '8915ca75d453698df81f7f3305cce6869f4261d754d90f0c3724b73c7b24ca84')
sha256sums_aarch64=('a38d3f60b0f18f5112d56366f8fb7102f427cef2ba0ff42a3776a6d71abcf0dc')
sha256sums_x86_64=('b54d17c8562d0be001f119248dce7a5c5d8bd828aed7409e01667f748b72251c')
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-bin}|g" \
        -e "s|@appasar@|app.asar|g" \
        -i "${srcdir}/${pkgname%-bin}.sh"
    gendesk -q -f -n --categories "Game" --name "${_appname}" --exec "${pkgname}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}-${CARCH}.asar" "${pkgdir}/usr/lib/${pkgname%-bin}/app.asar"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}