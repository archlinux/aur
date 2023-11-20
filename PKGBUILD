# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=godmode
_pkgname=GodMode
pkgver=1.0.0_beta.10
pkgrel=1
pkgdesc="AI Chat Browser: Fast, Full webapp access to ChatGPT / Claude / Bard / Bing / Llama2!"
arch=(
    'aarch64'
    'x86_64'
)
url="https://smol.ai/"
_ghurl="https://github.com/smol-ai/GodMode"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'expat'
    'libxcb'
    'libxcomposite'
    'nspr'
    'at-spi2-core'
    'libxfixes'
    'pango'
    'cairo'
    'libxext'
    'libcups'
    'libx11'
    'gtk3'
    'mesa'
    'libxdamage'
    'libdrm'
    'libxrandr'
    'libxkbcommon'
    'alsa-lib'
    'nss'
    'hicolor-icon-theme'
)
makedepends=(
    'npm>=7'
    'gendesk'
    'nodejs>=18'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}.git#tag=v${pkgver//_/-}"
)
sha256sums=('SKIP')
build() {
    gendesk -q -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
    cd "${srcdir}/${pkgname}-${pkgver}"
    npm ci --cache "${srcdir}/npm-cache" 
    npm run package-lin
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/bin"
    if [ "${CARCH}" == "aarch64" ];then
        local _ARCHDIR=linux-arm64-unpacked
    elif [ "${CARCH}" == "x86_64" ];then
        local _ARCHDIR=linux-unpacked
    fi
    cp -r "${srcdir}/${pkgname}-${pkgver}/release/build/${_ARCHDIR}/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/release/build/linux-unpacked/resources/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}