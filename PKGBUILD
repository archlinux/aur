# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=godmode
_pkgname=GodMode
pkgver=1.0.0_beta.4
pkgrel=2
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
sha256sums=('743894ebbd92a2dd6f1cc85459628d0747294b9b8afb01dfecc6d8d911ebb030')
build() {
    cd "${srcdir}/${_pkgname}-${pkgver//_/-}"
    npm install ci
    sed '144,173d' -i package.json
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