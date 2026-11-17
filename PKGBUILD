# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=iron
pkgname="srware-${_pkgname}-bin"
pkgver=154.0.8100
pkgrel=1
pkgdesc="SRWare Iron Browser is a light-weight browser,based on Chromium."
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.srware.net"
license=('LicenseRef-Freeware')
provides=("${_pkgname}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${_pkgname}"
)
depends=(
    'gtk2'
    'alsa-lib'
    'qt5-base'
    'nss'
    'nspr'
)
source=("LICENSE.txt")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/downloads/${_pkgname}arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/downloads/${_pkgname}64.deb")
sha256sums=('554e3955aa5a106e3e39e8bb0d47a32c117b581d425522365f69cf86a9e357bd')
sha256sums_aarch64=('SKIP')
sha256sums_x86_64=('SKIP')
pkgver() {
	cat "${srcdir}/.pkgver" 2>/dev/null || echo "${pkgver}"
}
prepare() {
    bsdtar -xf "${srcdir}/data."*
    bsdtar -xf "${srcdir}/control."*
    grep -m1 -oP '^Version: \K[0-9.]+(?=-)' "${srcdir}/control" > "${srcdir}/.pkgver"
    sed -i -e "
        s/\/usr\/share\/${_pkgname}\/chrome-wrapper/${pkgname%-bin}/g
        s/${_pkgname}_product_logo/${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${srcdir}/usr/share/applications/${_pkgname}_backup.desktop"
    sed -i -e "
        s/\/usr\/share\/${_pkgname}\/IronConfigBackup/${pkgname%-bin}-configbackup/g
        s/${_pkgname}_product_logo/${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}_backup.desktop"
    chmod 755 "${srcdir}/usr/share/${_pkgname}/extensions" \
        "${srcdir}/usr/share/${_pkgname}/chrome-wrapper" \
        "${srcdir}/usr/share/${_pkgname}/IronConfigBackup"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-bin}"}
    cp -a "${srcdir}/usr/share/${_pkgname}/." "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/chrome-wrapper" "${pkgdir}/usr/bin/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/IronConfigBackup" "${pkgdir}/usr/bin/${pkgname%-bin}-configbackup"
    install -Dm644 "${srcdir}/usr/share/applications/"*.desktop -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}_product_logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}