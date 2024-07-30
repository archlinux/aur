# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=iron
pkgname="srware-${_pkgname}-bin"
pkgver=126.6400.0
pkgrel=1
pkgdesc="SRWare Iron Browser is a light-weight browser,based on Chromium"
arch=(
    "aarch64"
    "x86_64"
)
url="https://www.srware.net"
license=('GPL-2.0-only')
conflicts=("${pkgname%-bin}")
provides=("${_pkgname}")
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
sha256sums_aarch64=('11bae849374f97e7617f0cc97ad6ba77fb2b17a8428b6c24f0f089555a8a7f08')
sha256sums_x86_64=('5038b6ee5121a18e7e835421b233e92e6e1f493bd1917a8f5d0f2a35922ba838')
build() {
    bsdtar -xf "${srcdir}/data."*
    sed "s|/usr/share/${_pkgname}/chrome-wrapper|${pkgname%-bin}|g;s|${_pkgname}_product_logo|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    sed "s|/usr/share/${_pkgname}/IronConfigBackup|${pkgname%-bin}-configbackup|g;s|${_pkgname}_product_logo|${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}_backup.desktop"
    chmod 755 "${srcdir}/usr/share/${_pkgname}/extensions" \
        "${srcdir}/usr/share/${_pkgname}/chrome-wrapper" \
        "${srcdir}/usr/share/${_pkgname}/IronConfigBackup"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/usr/share/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/chrome-wrapper" "${pkgdir}/usr/bin/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/IronConfigBackup" "${pkgdir}/usr/bin/${pkgname%-bin}-configbackup"
    install -Dm644 "${srcdir}/usr/share/applications/"*.desktop -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${_pkgname}_product_logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}