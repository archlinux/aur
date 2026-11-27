# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=clash-of-rust-bin
_pkgname=Clash-of-Rust
pkgver=0.7.3
pkgrel=1
pkgdesc="Cross-platform client side based on Rust, Slint and mihomo."
arch=(
	'aarch64'
	'x86_64'
)
url="https://github.com/Fu021/Clash-of-Rust"
license=('GPL-3.0-or-later')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
	'glib2'
	'libgcc'
	'hicolor-icon-theme'
	'fontconfig'
	'mihomo'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb")
sha256sums_aarch64=('fe2e60866008e908010f0818cf777aff58b405e0f0b224587bfdcf850a8600a3')
sha256sums_x86_64=('f6759f3457f597d1c40ecd8e1d1ba6d8aa6c30fad472b4949dd935ba29e54ac4')
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
	sed -i "s/\/usr\/bin\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
	ln -sf "/usr/bin/mihomo" "${srcdir}/opt/${pkgname%-bin}/resources/mihomo"
}
package() {
	install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-bin}"}
	cp -a "${srcdir}/opt/${pkgname%-bin}/." "${pkgdir}/usr/lib/${pkgname%-bin}"
	ln -sf "/usr/lib/${pkgname%-bin}/${pkgname%-bin}" "${pkgdir}/usr/bin/${pkgname%-bin}"
	ln -sf "/usr/lib/${pkgname%-bin}/cor" "${pkgdir}/usr/bin/cor"
	_install_icons
	install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "${srcdir}/usr/share/polkit-1/actions/org.clashofrust.tun.policy" -t "${pkgdir}/usr/share/polkit-1/actions"
}