# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=go-music-dl-bin
_pkgname="Go Music DL"
_rpmname=music-dl-desktop-go
pkgver=1.1.7
pkgrel=1
pkgdesc="一个基于 Go 语言的全网音乐搜索与下载工具。支持 CLI 命令行与 Web 服务双模式，内置网易云、QQ、酷狗、Bilibili、汽水音乐等 10+ 个主流平台，支持多源并发搜索与无损音质解析."
arch=('x86_64')
url="https://music.zkkp.nyc.mn/"
_ghurl="https://github.com/guohuiyuan/go-music-dl"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'webkit2gtk-4.1'
    'ffmpeg'
)
source=("${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_rpmname}-linux-amd64.deb")
sha256sums=('90f09dbb064e4edc656f0de6d1d1a48c2deac627c1c2d65283c52386a16d7fec')
_install_icons() {
	local _s="${1:-$srcdir}" _n="${pkgname%-bin}" _i _e _z
	while IFS= read -r -d '' _i; do
		_e=${_i##*.}
		_z=$(printf %s "${_i%/*}"|grep -oE '[0-9]+x[0-9]+(@[0-9]+x?)?|scalable'|tail -n1)
		[[ $_z ]] || _z=$([[ $_e == svg ]]&&echo scalable||od -An -tx1 -j16 -N8 "$_i"| \
		{ read a b c d e f g h; printf %dx%d 0x$a$b$c$d 0x$e$f$g$h; })
		[[ $_z =~ ^[0-9]+x[0-9]+(@[0-9]+x?)?$ || $_z == scalable ]]||_z=scalable
		install -Dm644 "$_i" "$pkgdir/usr/share/icons/hicolor/$_z/apps/$_n.$_e"
	done < <(find "$_s" \( -path '*/share/icons/*' -o -path '*/share/pixmaps/*' \
		-o -path '*entries/icons/*' \) -type f \( -name '*.png' -o -name '*.svg' \) -print0 2>/dev/null)
}
prepare() {
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/Name=${_rpmname}/Name=${_pkgname}/g
        s/Exec=${_rpmname}/Exec=${pkgname%-bin}/g
        s/Icon=${_rpmname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_rpmname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_rpmname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    _install_icons
    install -Dm644 "${srcdir}/usr/share/applications/${_rpmname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}