# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=chaski-bin
_pkgname=Chaski
pkgver=0.9.2
pkgrel=1
pkgdesc="A content aggregator that helps you focus on what matters."
arch=('x86_64')
url="https://chaski.a-chacon.com"
_ghurl="https://github.com/a-chacon/chaski-app"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk-4.1'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/app-v${pkgver}/${_pkgname}_${pkgver}_amd64.deb"
)
sha256sums=('02a60a04359803570ef2270a1a5a6958e90b12069da8b5c28e78090ec1892c9c')
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
    sed -i "s/Categories=/Categories=Utility;/g" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
    [ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
    _install_icons
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
