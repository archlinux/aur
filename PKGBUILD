# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=iron
pkgname="srware-${_pkgname}-bin"
pkgver=147.7750.0
pkgrel=1
pkgdesc="SRWare Iron Browser is a light-weight browser,based on Chromium.(Prebuilt version)"
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
sha256sums_aarch64=('0bb875a6c2d2fc6d2ee3e993ffb532bbf9bae9a0289201010922b816bb04ef13')
sha256sums_x86_64=('6699056bac12015a51845a6cd2b3094287b6233cc56c5cfa4615d8b1509c87af')
prepare() {
    bsdtar -xf "${srcdir}/data."*
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
    cp -Pr --no-preserve=ownership "${srcdir}/usr/share/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/chrome-wrapper" "${pkgdir}/usr/bin/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/IronConfigBackup" "${pkgdir}/usr/bin/${pkgname%-bin}-configbackup"
    install -Dm644 "${srcdir}/usr/share/applications/"*.desktop -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}_product_logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
