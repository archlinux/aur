# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Ricahrd Neumann aka. Schard <mail ar richard dash neumann period de>
# Contributor: William Brown <glowinthedarkcia@horsefucker.org>
pkgname=processing-bin
_pkgname=Processing
pkgver=4.5.5
_subver=1433
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
    'fontconfig'
    'libglvnd'
    'libxtst'
    'libxrender'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/${pkgname%-bin}-${_subver}-${pkgver}/${pkgname%-bin}-${pkgver}-linux-aarch64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/${pkgname%-bin}-${_subver}-${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.deb")
sha256sums_aarch64=('b7d5b485b00af363020bb7175a1961d0ddbabeb9f63e399e0e7341876031cb82')
sha256sums_x86_64=('5c384b608b07d794c26f6e5c4591d20490428629a7e92dad9ee8d62cbc6c6c67')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Exec=\/opt\/${pkgname%-bin}\/bin\/${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=\/opt\/${pkgname%-bin}\/bin\/${_pkgname}.png/Icon=${pkgname%-bin}/g
    " "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop"
    find "${srcdir}/opt/${pkgname%-bin}/lib/app/resources/modes/java/application/launch4j/w32api" -type f -exec chmod 644 {} +
    find "${srcdir}/opt/${pkgname%-bin}/lib/app/resources/modes/java/application/launch4j/bin" \
        \( -name "*-macos" -o -name "*armv6*" -o -name "*windows*" \) -exec rm -rf {} +
}
package() {
    install -Dm755 -d "${pkgdir}/"{usr/lib/"${pkgname%-bin}",usr/bin}
    cp -a "${srcdir}/opt/${pkgname%-bin}/"* "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/app/resources/lib/icons/app-${_icons/x*}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}
