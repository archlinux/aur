# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Ricahrd Neumann aka. Schard <mail ar richard dash neumann period de>
# Contributor: William Brown <glowinthedarkcia@horsefucker.org>
pkgname=processing-bin
_pkgname=Processing
pkgver=4.3
pkgrel=6
arch=("x86_64")
pkgdesc="Programming environment for creating images, animations and interactions."
url="https://processing.org/"
_ghurl="https://github.com/processing/processing4"
license=("GPL-2.0-only")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
options=('!strip')
depends=(
    'alsa-lib'
)
source=(
    "${pkgname%-bin}-${pkgver}.tgz::${_ghurl}/releases/download/${pkgname%-bin}-1293-${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.tgz"
)
sha256sums=('3f655b3076158148e7ca9ac94a380d35b925436a5829e9d653715a3146ef3e33')
build() {
    cp "${srcdir}/${pkgname%-bin}-${pkgver}/lib/desktop.template" "${srcdir}/${pkgname%-bin}.desktop"
    sed "s|<BINARY_LOCATION>|${pkgname%-bin}|g;s|<ICON_NAME>|${pkgname%-bin}|g" -i "${srcdir}/${pkgname%-bin}.desktop"
    cp "${srcdir}/${pkgname%-bin}.desktop" "${srcdir}/${pkgname%-bin}-java.desktop"
    sed "s|Exec=${pkgname%-bin}|Exec=${pkgname%-bin}-java|g;s|${_pkgname}|${_pkgname}-Java|g" -i "${srcdir}/${pkgname%-bin}-java.desktop"
    chmod 644 "${srcdir}/${pkgname%-bin}-${pkgver}/modes/java/application/launch4j/w32api/"*
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/${pkgname%-bin}-${pkgver}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/"*.desktop -t "${pkgdir}/usr/share/applications"
    ln -sf "/opt/${pkgname%-bin}/${pkgname%-bin}-java" "${pkgdir}/usr/bin/${pkgname%-bin}-java"
    for _icons in 16x16 32x32 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/lib/icons/app-${_icons/x*}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}/lib/${pkgname%-bin}-pde.xml" "${pkgdir}/usr/share/mime/application/${pkgname%-bin}.xml"
}