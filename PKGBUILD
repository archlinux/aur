# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yesplaymusic-bin
_pkgname=YesPlayMusic
pkgver=3.0.0
pkgrel=1
pkgdesc="A better-looking desktop music player for local files, media servers, and plugins.高颜值的桌面音乐播放器，音乐源由插件提供"
arch=('x86_64')
url="https://yesplaymusic.0xtangerine.com"
_ghurl="https://github.com/qier222/YesPlayMusic"
license=('GPL-3.0-or-later')
depends=(
    'gtk3'
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${pkgname%-bin}-electron"
    "${pkgname%-bin}osd-electron"
    "${pkgname%-bin}osd-origin"
    "my-${pkgname%-bin}"
    "r3play"
    "r3playx"
)
source=(
    "${pkgname%-bin}-${pkgver}.tar.gz::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.tar.gz"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/qier222/YesPlayMusic/v${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('fab6f80713727b7009e475b8cb740117de58ae4350b8059e816cc09cb0381a03'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'd7002fa1a9ae60749490e982fa8a4f4622f7381b02559f5b014df033c0773a3c')
_get_app_dir() {
	find "${srcdir}" -type d -name "data" -printf '%h\n' 2>/dev/null \
		| while read -r d; do [[ -d "${d}/data" && -d "${d}/lib" ]] && { echo "$d"; return 0; }; done
}
prepare() {
    sed -i -e "
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 "$(_get_app_dir)/${pkgname%-bin}" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -a "$(_get_app_dir)/"{data,lib} "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "$(_get_app_dir)/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "$(_get_app_dir)/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
