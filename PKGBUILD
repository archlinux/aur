# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Ricahrd Neumann aka. Schard <mail ar richard dash neumann period de>
# Contributor: William Brown <glowinthedarkcia@horsefucker.org>
pkgname=processing-bin
_pkgname=Processing
pkgver=4.5.8
_subver=1436
pkgrel=1
arch=(
	'aarch64'
	'x86_64'
)
pkgdesc="A flexible software sketchbook and a programming language designed for learning how to code."
url="https://processing.org/"
_ghurl="https://github.com/processing/processing4"
license=("GPL-2.0-only")
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
options=('!strip')
depends=(
	'alsa-lib'
	'libxi'
	'libxext'
	'libx11'
	'fontconfig'
	'libglvnd'
	'libxtst'
	'libxrender'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/${pkgname%-bin}-${_subver}-${pkgver}/${pkgname%-bin}-${pkgver}-linux-aarch64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/${pkgname%-bin}-${_subver}-${pkgver}/${pkgname%-bin}-${pkgver}-linux-x64.deb")
sha256sums_aarch64=('de5ce1e4d0ea9f54558cb59bc04b282eb5f1548f535638ce0b21d1ffd8656467')
sha256sums_x86_64=('78f84a0e474f726da57813c465af05ee08c402256eea2615cc3b3da62b593032')
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
		s/Exec=\/opt\/${pkgname%-bin}\/bin\/${_pkgname}/Exec=${pkgname%-bin}/g
		s/Icon=\/opt\/${pkgname%-bin}\/lib\/${_pkgname}.png/Icon=${pkgname%-bin}/g
	" "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop"
	find "${srcdir}/opt/${pkgname%-bin}/lib/app/resources/modes/java/application/launch4j/w32api" -type f -exec chmod 644 {} +
	find "${srcdir}/opt/${pkgname%-bin}/lib/app/resources/modes/java/application/launch4j/bin" \
		\( -name "*macos*" -o -name "*armv6*" -o -name "*windows*" \) -exec rm -rf {} +
	chmod +x "${srcdir}/opt/${pkgname%-bin}/lib/app/resources/jdk/bin/"*
}
package() {
	install -Dm755 -d "${pkgdir}/"{usr/lib/"${pkgname%-bin}",usr/bin}
	cp -a "${srcdir}/opt/${pkgname%-bin}/." "${pkgdir}/usr/lib/${pkgname%-bin}"
	ln -sf "/usr/lib/${pkgname%-bin}/bin/${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
	_install_icons
	install -Dm644 "${srcdir}/opt/${pkgname%-bin}/lib/${pkgname%-bin}-${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
