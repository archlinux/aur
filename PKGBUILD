# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=geekeditor-bin
_pkgname=GeekEditor
pkgver=1.4.9
pkgrel=6
pkgdesc="Immersive efficiency writing editor.极客编辑器是一款所见即所得(WYSIWYG)富文本沉浸式写作排版编辑器,注重高效创作,可多开文档编辑,同时支持Markdown语法输入及一键排版"
arch=('x86_64')
url=https://www.geekeditor.com/
_ghurl="https://github.com/geekeditor/geekeditor-releases"
license=('GPL3')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'alsa-lib'
    'gtk3'
    'at-spi2-core'
    'nss'
    'libxfixes'
    'libdrm'
    'mesa'
    'libxrandr'
    'libxcomposite'
    'nspr'
    'libxext'
    'cairo'
    'expat'
    'gdk-pixbuf2'
    'libx11'
    'libxcb'
    'pango'
    'libxdamage'
    'dbus'
    'libcups'
    'hicolor-icon-theme'
    'libxkbcommon'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb"
)
sha256sums=('99c69e953535adffd4edda3932d3f12acb206f104de3dddb15a04b656fda1a1a')
build() {
    bsdtar -xf "${srcdir}/data.tar.xz"
    sed "s|/opt/${_pkgname}/${_pkgname}|${pkgname%-bin} --no-sandbox|g;s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g;s|Writing Editor|Office|g" \
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
}