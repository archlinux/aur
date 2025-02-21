# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Ricahrd Neumann aka. Schard <mail ar richard dash neumann period de>
# Contributor: William Brown <glowinthedarkcia@horsefucker.org>
pkgname=processing-bin
_pkgname=Processing
pkgver=4.3.3
_subver=1296
pkgrel=1
arch=(
    'aarch64'
    'x86_64'
)
pkgdesc="Programming environment for creating images, animations and interactions.(Prebuilt version)"
url="https://processing.org/"
_ghurl="https://github.com/processing/processing4"
license=("GPL-2.0-only")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
options=('!strip')
depends=(
    'alsa-lib'
    'libxi'
    'libdrm'
    'libxrender'
    'libxext'
    'libx11'
    'libxcursor'
    'freetype2'
    'libxtst'
    'libxrandr'
    'mesa'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.tgz::${_ghurl}/releases/download/${pkgname%-bin}-${_subver}-${pkgver}/${pkgname%-bin}-${pkgver}-linux-arm64.tgz")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.tgz::${_ghurl}/releases/download/${pkgname%-bin}-${_subver}-${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.tgz")
sha256sums_aarch64=('21037638d02649dd9e6150f882c1d8a16d963e0539cd5b493cf24ee331332e03')
sha256sums_x86_64=('7c5625f45c8cbdd5d6ed231a510f09015f0b913a0976ebae951083ef2ee175a4')
prepare() {
    cp "${srcdir}/${pkgname%-bin}-${pkgver}/lib/desktop.template" "${srcdir}/${pkgname%-bin}.desktop"
    sed -e "
        s/<BINARY_LOCATION>/${pkgname%-bin}/g
        s/<ICON_NAME>/${pkgname%-bin}/g
    " -i "${srcdir}/${pkgname%-bin}.desktop"
    cp "${srcdir}/${pkgname%-bin}.desktop" "${srcdir}/${pkgname%-bin}-java.desktop"
    sed -e "
        s/Exec=${pkgname%-bin}/Exec=${pkgname%-bin}-java/g
        s/${_pkgname}/${_pkgname}-Java/g
    " -i "${srcdir}/${pkgname%-bin}-java.desktop"
    chmod 644 "${srcdir}/${pkgname%-bin}-${pkgver}/modes/java/application/launch4j/w32api/"*
}
package() {
    install -Dm755 -d "${pkgdir}/"{usr/lib/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/${pkgname%-bin}-${pkgver}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/"*.desktop -t "${pkgdir}/usr/share/applications"
    ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}-java" "${pkgdir}/usr/bin/${pkgname%-bin}-java"
    for _icons in 16x16 32x32 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}/lib/icons/app-${_icons/x*}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-bin}-${pkgver}/lib/${pkgname%-bin}-pde.xml" "${pkgdir}/usr/share/mime/application/${pkgname%-bin}.xml"
}