# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=aero
pkgname="${_appname}-browser-bin"
_pkgname="Aero"
pkgver=0.2.2_alpha
pkgrel=1
pkgdesc="A fast and lightweight web browser made with electron and react that allows you to navigate the Internet with ease."
arch=(
    'aarch64'
    'x86_64'
)
url="https://aero-mymeiy532-frostbreker.vercel.app/"
_ghurl="https://github.com/FrostBreker/Aero"
license=('MIT')
conflicts=(
    "${pkgname%-bin}"
)
provides=(
    "${pkgname%-bin}=${pkgver}"
)
depends=(
    'gtk3'
    'expat'
    'libxkbcommon'
    'alsa-lib'
    'libcups'
    'at-spi2-core'
    'nspr'
    'libxrandr'
    'libx11'
    'libdrm'
    'libxcomposite'
    'mesa'
    'libxext'
    'nss'
    'cairo'
    'libxdamage'
    'libxfixes'
    'libxcb'
    'pango'
    'python'
    'hicolor-icon-theme'
)
makedepends=(
    'gendesk'
    'git'
    'npm'
    'nodejs'
)
source=("LICENSE-${pkgver}::https://github.com/FrostBreker/AeroBrowser/blob/v0.2.2-alpha/LICENSE.MD")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_/-}-linux-armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver//_/-}/${_pkgname}-${pkgver//_/-}-linux-amd64.deb")
sha256sums=('29415dff206af09bf31646d6a1016cc0e8602c103143afd8f2da61b06b1ea308')
sha256sums_aarch64=('527d07ef9570b5e089450ffc6ba961d7d35fb10921f9b57bf9fa827e8514f351')
sha256sums_x86_64=('d8182227f644d67ef8929fb8354364e7b3ee7576512f958cd63807403974bbc4')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${_appname}|${pkgname%-bin} --no-sandbox|g" -i "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_appname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    for _icons in 32x32 64x64 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_appname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}