# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=cline
pkgname="${_appname}-desktop-bin"
_pkgname=Cline
_debname="bot.${_appname}.app"
pkgver=0.0.51
pkgrel=1
pkgdesc="Cline AI coding agent."
arch=(
	'aarch64'
	'x86_64'
)
url="https://cline.bot/"
_ghurl="https://github.com/cline/cline"
license=('Apache-2.0')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
	"${pkgname%-bin}"
	"${_appname}-cli"
)
depends=(
	'gtk3'
	'gdk-pixbuf2'
	'webkit2gtk-4.1'
	'libayatana-indicator'
	'libappindicator'
)
options=('!strip')
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/desktop-v${pkgver}/${_pkgname}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/desktop-v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums_aarch64=('0b616c496c9e7df91d593809330eb1218a85f2dee95955b46c188620c920e3ab')
sha256sums_x86_64=('f7d9e7043a6d87db491922475edc88ccdc15ecf19c8a65e990abcd40885629da')
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
		s/Exec=${_appname}-app/Exec=${pkgname%-bin}/g
		s/Icon=${_appname}-app/Icon=${pkgname%-bin}/g
	" "${srcdir}/usr/share/applications/${_pkgname}.desktop"
	sed -i "s/${_pkgname}.desktop/${pkgname%-bin}.desktop/g" "${srcdir}/usr/share/metainfo/${_debname}.metainfo.xml"
	local _archrem=$([[ "${CARCH}" == "aarch64" ]] && echo x86_64 || echo aarch64)
	find "${srcdir}" -name "*${_archrem}*" -exec rm -rf {} +
}
package() {
	install -Dm755 "${srcdir}/usr/bin/${_appname}-app" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm755 "${srcdir}/usr/bin/${_appname}-cli" -t "${pkgdir}/usr/bin"
	[ -d "${srcdir}/usr/lib" ] && cp -a "${srcdir}/usr/lib" "${pkgdir}/usr/"
	_install_icons
	install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
	install -Dm644 "${srcdir}/usr/share/metainfo/${_debname}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml"
}