# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Ricahrd Neumann aka. Schard <mail ar richard dash neumann period de>
# Contributor: William Brown <glowinthedarkcia@horsefucker.org>
pkgname="processing-bin"
pkgver=4.2
pkgrel="1"
arch=("x86_64")
pkgdesc="Programming environment for creating images, animations and interactions."
url="https://processing.org/"
_githuburl="https://github.com/processing/processing4"
license=("custom")
options=("!strip")
conflicts=("${pkgname%-bin}")
depends=('libxtst' 'sh' 'lib32-libdrm' 'glibc' 'libx11' 'libxcursor' 'lib32-libx11' 'lib32-mesa' 'lib32-libxcursor' \
    'alsa-lib' 'mesa' 'lib32-libxi' 'hicolor-icon-theme' 'freetype2' 'libxrender' 'zlib' 'lib32-libxrandr' 'lib32-libxrender' \
    'libxxf86vm' 'libxi' 'lib32-glibc' 'libxrandr' 'lib32-libxxf86vm' 'libdrm' 'libxext' )
optdepends=('java-runtime: Install it if you do not want ues the JRE of the program')
source=("${pkgname%-bin}-${pkgver}.tgz::${_githuburl}/releases/download/${pkgname%-bin}-1292-${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.tgz"
    "LICENSE.md::${_githuburl}/raw/main/LICENSE.md")
sha256sums=('8465313ef2e9bc566f248bc812691db73eadcff0b68a6e595eacaf68489282d7'
            '4b7b429609d77db38b2b2ab54065324622dfe85bc6f0db331c13951b44c1cb27')
 
package() {
    install -Dm755 -d "${pkgdir}/opt"
    bsdtar -xf "${srcdir}/${pkgname%-bin}-${pkgver}.tgz" -C "${pkgdir}/opt" --gname root --uname root
    mv "${pkgdir}/opt/${pkgname%-bin}-${pkgver}" "${pkgdir}/opt/${pkgname%-bin}"
    sed 's|<BINARY_LOCATION>|/opt/processing/processing|g;s|<ICON_NAME>|processing|g' -i "${pkgdir}/opt/${pkgname%-bin}/lib/desktop.template"
    install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/lib/desktop.template" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    cp "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}-java.desktop"
    sed 's|<BINARY_LOCATION>|/opt/processing/processing-java|g' -i "${pkgdir}/usr/share/applications/${pkgname%-bin}-java.desktop"
    for _icons in 16x16 32x32 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${pkgdir}/opt/${pkgname%-bin}/lib/icons/pde-${_icons/x*}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    chmod 644 "${pkgdir}/opt/${pkgname%-bin}/modes/java/application/launch4j/w32api/"*
}