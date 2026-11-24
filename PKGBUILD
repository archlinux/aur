# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=open-pdf-studio-bin
_pkgname=Open.PDF.Studio
pkgver=2026.48.6
pkgrel=1
pkgdesc="a lightweight, native desktop application that provides professional-grade PDF annotation, markup, and editing tools without subscriptions, telemetry, or bloatware. "
arch=('x86_64')
url="https://github.com/OpenAEC-Foundation/open-pdf-studio"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
	'gtk3'
	'gdk-pixbuf2'
	'webkit2gtk-4.1'
)
source=("${pkgname%-bin}-${pkgver}.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=('8198e199d6015fdb18c91b5ce7091dc4659e073f8988eaf64c9edf063423d7d8')
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
	sed -i "s/Categories=/Categories=Office;/" "${srcdir}/usr/share/applications/${_pkgname//./ }.desktop"
}
package() {
	install -Dm755 "${srcdir}/usr/bin/${pkgname%-bin}" -t "${pkgdir}/usr/bin"
	[ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
	_install_icons
	install -Dm644 "${srcdir}/usr/share/applications/${_pkgname//./ }.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
