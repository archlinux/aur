# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=iron
pkgname="srware-${_pkgname}-bin"
pkgver=141.7150.0
pkgrel=1
pkgdesc="SRWare Iron Browser is a light-weight browser,based on Chromium.(Prebuilt version)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.srware.net"
license=('GPL-2.0-only')
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/downloads/${_pkgname}arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/downloads/${_pkgname}64.deb")
source=(
    "LICENSE-${pkgver}.txt::${url}/license.txt"
)
sha256sums=('a29953afc386e2a9a95906cfa0de4bf58a332260d7199a5f99d3e15db9381022')
sha256sums_aarch64=('d7d27b896ffdea6cae83e92ed2bdd824c4d65123f7c64bf87fb9036a6e2b546a')
sha256sums_x86_64=('c9d1b7f30dd5d13da51a920e0b98490b9bbc4fe4ece960e71917f6bb64393f77')
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
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
