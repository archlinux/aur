# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Ricahrd Neumann aka. Schard <mail ar richard dash neumann period de>
# Contributor: William Brown <glowinthedarkcia@horsefucker.org>
pkgname=processing-bin
_pkgname=Processing
pkgver=4.5.1
_subver=1312
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
    'libxext'
    'libx11'
    'libxcursor'
    'freetype2'
    'libxtst'
)
makedepends=(
    'gendesk'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.zip::${_ghurl}/releases/download/${pkgname%-bin}-${_subver}-${pkgver}/${pkgname%-bin}-${pkgver}-linux-aarch64-portable.zip")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.zip::${_ghurl}/releases/download/${pkgname%-bin}-${_subver}-${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64-portable.zip")
sha256sums_aarch64=('b60ad1a735c446e38c00e6d2a2f1a4e459ccbd27d63a059f07bed3d66e39a96c')
sha256sums_x86_64=('698404f78d91d2809aee48b0c1cfdb2deb0a7dcbd0f534adcbc77f3bcb75582d')
prepare() {
    gendesk -q -f -n \
        --pkgname="${pkgname%-bin}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Development" \
        --name="${_pkgname}" \
        --exec="${pkgname%-bin} %U"
    find "${srcdir}/${_pkgname}/lib/app/resources/modes/java/application/launch4j/w32api" -type f -exec chmod 644 {} +
}
package() {
    install -Dm755 -d "${pkgdir}/"{usr/lib/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/${_pkgname}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${_pkgname}/lib/app/resources/lib/icons/app-${_icons/x*}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}
