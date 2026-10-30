# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bili-shadowreplay-bin
_pkgname='BiliBili ShadowReplay'
pkgver=2.25.1
pkgrel=1
pkgdesc="A tool for caching bilibili live broadcasts and editing submissions in real time.一个缓存BiliBili直播并进行实时编辑投稿的工具"
arch=('x86_64')
url="http://bsr.xinrea.cn/"
_ghurl="https://github.com/Xinrea/bili-shadowreplay"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}-1.${CARCH}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/Xinrea/bili-shadowreplay/v${pkgver}/LICENSE"
)
sha256sums=('87cd009c67db50a46ef75b9d85c088ac74696f64bda654ffd4c9982d92242a59'
            '4cbb91ff4be21fae9f321899a00b75e05f7b40aee1b2aa5d4896a7155822cb45')
prepare() {
    sed -i -e "
        s/Comment=${_pkgname}/Comment=${pkgdesc}/g
        s/Categories=/Categories=AudioVideo;/g
        s/Name=${pkgname%-bin}/Name=${_pkgname}/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    local _icon_dir="${srcdir}/usr/share/icons/hicolor"
	[[ -d "${_icon_dir}/256x256@2" && ! -d "${_icon_dir}/512x512" ]] && mv "${_icon_dir}/256x256@2" "${_icon_dir}/512x512"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    [ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
