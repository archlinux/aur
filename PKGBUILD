# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Ricahrd Neumann aka. Schard <mail ar richard dash neumann period de>
# Contributor: William Brown <glowinthedarkcia@horsefucker.org>
pkgname=processing-bin
_pkgname=Processing
pkgver=4.5.7
_subver=1435
pkgrel=1
arch=(
    'aarch64'
    'x86_64'
)
pkgdesc="A flexible software sketchbook and a programming language designed for learning how to code."
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
sha256sums_aarch64=('74326f20d143f1fe9ff04742e24d1cc6a26ad1ac445b6555859d21287e797cae')
sha256sums_x86_64=('761a74c266b27aabc44a640ba1102ced49d476c8eea31a1eee4bf0ceb802bf83')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Exec=\/opt\/${pkgname%-bin}\/bin\/${_pkgname}/Exec=${pkgname%-bin}/g
        s/Icon=\/opt\/${pkgname%-bin}\/bin\/${_pkgname}.png/Icon=${pkgname%-bin}/g
    " "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop"
    find "${srcdir}/opt/${pkgname%-bin}/lib/app/resources/modes/java/application/launch4j/w32api" -type f -exec chmod 644 {} +
    find "${srcdir}/opt/${pkgname%-bin}/lib/app/resources/modes/java/application/launch4j/bin" \
        \( -name "*macos*" -o -name "*armv6*" -o -name "*windows*" \) -exec rm -rf {} +
    chmod +x "${srcdir}/opt/${pkgname%-bin}/lib/app/resources/jdk/bin/"*
}
package() {
    install -Dm755 -d "${pkgdir}/"{usr/lib/"${pkgname%-bin}",usr/bin}
    cp -a "${srcdir}/opt/${pkgname%-bin}/." "${pkgdir}/usr/lib/${pkgname%-bin}"
    ln -sf "/usr/lib/${pkgname%-bin}/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/app/resources/lib/icons/app-${_icons/x*}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
}
