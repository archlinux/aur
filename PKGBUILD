# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=codex-bin
_pkgname=Codex
pkgver=2.0.2
pkgrel=1
pkgdesc="A free note-taking software for programmers and Computer Science students"
arch=('x86_64')
url="https://codexnotes.com/"
_githuburl="https://github.com/jcv8000/Codex"
license=('custom:CC-BY-NC-4.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'hicolor-icon-theme'
    'mesa'
    'pango'
    'expat'
    'libxfixes'
    'nss'
    'gtk3'
    'libxext'
    'libxrandr'
    'libxkbcommon'
    'libx11'
    'cairo'
    'alsa-lib'
    'libxcomposite'
    'nspr'
    'at-spi2-core'
    'libcups'
    'libdrm'
    'libxdamage'
    'libxcb'
)
source=("${pkgname%-bin}-${pkgver}.deb::${_githuburl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-amd64.deb")
sha256sums=('030c34bc19406c807b25a2e432b89063be3b89788a8002f768d7391ea4de7836')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${_pkgname}|${pkgname%-bin} --no-sandbox|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g" \
        -i "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname%-bin}",usr/bin}
    cp -r "${srcdir}/opt/${_pkgname}/"* "${pkgdir}/opt/${pkgname%-bin}"
    ln -sf "/opt/${pkgname%-bin}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    for _icons in 16x16 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm755 "${srcdir}/opt/${_pkgname}/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}