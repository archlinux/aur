# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Ricahrd Neumann aka. Schard <mail ar richard dash neumann period de>
# Contributor: William Brown <glowinthedarkcia@horsefucker.org>
pkgname=processing-bin
_pkgname=Processing
pkgver=4.3
pkgrel=2
arch=("x86_64")
pkgdesc="Programming environment for creating images, animations and interactions."
url="https://processing.org/"
_githuburl="https://github.com/processing/processing4"
license=("custom")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
options=('!strip')
depends=('libxtst' 'sh' 'lib32-libdrm' 'glibc' 'libx11' 'libxcursor' 'lib32-libx11' 'lib32-mesa' 'lib32-libxcursor' \
    'alsa-lib' 'mesa' 'lib32-libxi' 'hicolor-icon-theme' 'freetype2' 'libxrender' 'zlib' 'lib32-libxrandr' 'lib32-libxrender' \
    'libxxf86vm' 'libxi' 'lib32-glibc' 'libxrandr' 'lib32-libxxf86vm' 'libdrm' 'libxext' 'java-runtime')
source=("${pkgname%-bin}-${pkgver}.tgz::${_githuburl}/releases/download/${pkgname%-bin}-1293-${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.tgz"
    "LICENSE.md::https://raw.githubusercontent.com/processing/processing4/${pkgname%-bin}-1293-${pkgver}/LICENSE.md")
sha256sums=('3f655b3076158148e7ca9ac94a380d35b925436a5829e9d653715a3146ef3e33'
            '4b7b429609d77db38b2b2ab54065324622dfe85bc6f0db331c13951b44c1cb27')
prepare() {
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
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}