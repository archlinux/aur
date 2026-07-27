# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=jan-bin
_pkgname=Jan
pkgver=0.8.4
pkgrel=1
pkgdesc="An open source alternative to ChatGPT that runs 100% offline on your computer. Multiple engine support (llama.cpp, TensorRT-LLM).(Prebuilt version)"
arch=('x86_64')
url="https://jan.ai/"
_ghurl="https://github.com/janhq/jan"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
    'bun'
    'uv'
)
makedepends=(
    'ccache'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
    "${pkgname%-bin}.sh"
)
sha256sums=('9e1929b94363f843d0edf2a03833bbd958384ea64dcff649ff832df15efe0754'
            '5111c45e21dd8590d5b44093045778946195d3036c83416db69498a12be0e912')
prepare() {
    sed -i -e "
        s/@appname@/${_pkgname}/g
        s/@runname@/${_pkgname}/g
        s/@options@/WEBKIT_DISABLE_DMABUF_RENDERER=1/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-bin}/g
        s/Categories=/Categories=Utility/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "${srcdir}/usr/bin/${_pkgname}" -t "${pkgdir}/usr/lib/${_pkgname}"
    cp -a "${srcdir}/usr/lib/${_pkgname}/"* "${pkgdir}/usr/lib/${_pkgname}"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
}
