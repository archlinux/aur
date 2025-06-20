# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=jan-bin
_pkgname=Jan
pkgver=0.6.1
pkgrel=1
pkgdesc="An open source alternative to ChatGPT that runs 100% offline on your computer. Multiple engine support (llama.cpp, TensorRT-LLM).(Prebuilt version)"
arch=('x86_64')
url="https://jan.ai/"
_ghurl="https://github.com/janhq/jan"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'bun'
    'uv'
)
options=(
    '!strip'
    '!emptydirs'
)
source=("${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('9e9a6b2d00d11bddf41f8e490aba8d7ce581db0119ec65d4aa7cafb3cb68957e')
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Categories=/Categories=Utility/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/"{"${_pkgname}",cortex-server} -t "${pkgdir}/usr/bin"
    ln -sf "/usr/bin/bun" "${pkgdir}/usr/bin/bun"
    ln -sf "/usr/bin/uv" "${pkgdir}/usr/bin/uv"
    cp -Pr --no-preserve=ownership "${srcdir}/usr/lib" "${pkgdir}/usr"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/usr/share/icons/hicolor/${_icons}/apps/${_pkgname}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname%-bin}.png"
    done
}