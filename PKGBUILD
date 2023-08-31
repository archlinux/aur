# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=godmode
_pkgname=GodMode
pkgver=1.0.0_beta.6
pkgrel=1
pkgdesc="AI Chat Browser: Fast, Full webapp access to ChatGPT / Claude / Bard / Bing / Llama2!"
arch=('x86_64')
url="https://smol.ai/"
_githuburl="https://github.com/smol-ai/GodMode"
license=('MIT')
conflicts=("${pkgname}")
depends=('expat' 'glib2' 'libxcb' 'libxcomposite' 'nspr' 'at-spi2-core' 'libxfixes' 'pango' 'dbus' 'cairo' 'libxext' 'libcups' 'libx11' \
    'gtk3' 'gcc-libs' 'mesa' 'libxdamage' 'libdrm' 'libxrandr' 'libxkbcommon' 'alsa-lib' 'nss' 'glibc' 'hicolor-icon-theme')
makedepends=('npm' 'gendesk')
source=("${pkgname}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver//_/-}.tar.gz")
sha256sums=('df8c0fef3040623ec8aab5d92602298466bfaabf05e9ed68ef877af60ef02896')
build() {
    cd "${srcdir}/${_pkgname}-${pkgver//_/-}"
    npm ci
    npm run package-lin
}
package() {
    install -Dm755 -d "${pkgdir}/opt/${pkgname}" "${pkgdir}/usr/bin"
    cp -r "${srcdir}/${_pkgname}-${pkgver//_/-}/release/build/linux-unpacked/"* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/release/build/linux-unpacked/resources/assets/icons/${_icons}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    gendesk -f -n --categories "Utility" --name "${_pkgname}" --exec "${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver//_/-}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}