# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=x-minecraft-launcher-bin
_appname=xmcl
_appname2="X Minecraft Launcher"
pkgver=0.35.19
pkgrel=2
pkgdesc="An Open Source Minecraft Launcher with Modern UX. Provide a Disk Efficient way to manage all your Mods!"
arch=('aarch64' 'x86_64')
url="https://xmcl.app/"
_githuburl="https://github.com/Voxelum/x-minecraft-launcher"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}" "${_appname}")
depends=('bash' 'electron21')
makedepends=('asar' 'gendesk')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}-amd64.deb")
source=("LICENSE::https://raw.githubusercontent.com/Voxelum/x-minecraft-launcher/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh")
sha256sums=('274fb5c556a3f3fdc5b37ef6f6bbd8e35055b11a816f3ae69efec869f85638f5'
            '6b85cdf6844da008d7c9d0be86dd892d4f7b35bdbdd6359de6d46c01109a3dc7')
sha256sums_aarch64=('c6e0145593df92f6c9c0e118895a73a0b70247003964affb50282aca0389cd74')
sha256sums_x86_64=('7d80b96824354f5d19b654304100de5f345a851dba0d40584a9eaa8f8eae7f3a')
prepare() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    asar e "${srcdir}/opt/${_appname2}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    cp -r "${srcdir}/opt/${_appname2}/resources/app.asar.unpacked" "${srcdir}"
    asar p "${srcdir}/app.asar.unpacked" "${srcdir}/${pkgname%-bin}.asar"
    sed "s|\"/opt/${_appname2}/${_appname}\" %U|${pkgname%-bin}|g;s|Icon=${_appname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.asar" -t "${pkgdir}/opt/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/0x0/apps/${_appname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}