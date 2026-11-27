# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=omofun-bin
_debname=app.omoo.otohime
pkgver=2.0.5
_electronversion=39
pkgrel=1
pkgdesc="Third-party Linux client for Animation Republic.第三方动漫共和国 Linux 客户端"
arch=(
	'aarch64'
	'x86_64'
)
url="https://dmghg.cn/"
_dlurl="https://github.com/kota-rina3/hokeshi"
license=('LicenseRef-unknown')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
	"electron${_electronversion}"
	'nodejs'
	'python'
)
source=(
	"${pkgname%-bin}.js"
	"${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_dlurl}/releases/download/${pkgname%-bin}-${pkgver}/${_debname}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_dlurl}/releases/download/${pkgname%-bin}-${pkgver}/${_debname}_${pkgver}_amd64.deb")
sha256sums=('4e629b50633624a4092c6d105aa2300bb0b1c7d979599a843b4468d903886f3b'
            '739eaf5396ac7f1373d907904f068e8a10a18ef91af7c35ca05adbff46322c97')
sha256sums_aarch64=('24ff9d1840f27582a70503e8c735e02d90efcf29e7f60a54065e8d93996faade')
sha256sums_x86_64=('0f2dfe14bf82194e17949968d4d623a9f6deee2123d8f4c9003d37fe4c0956a7')
_get_app_dir() {
	find "${srcdir}" -type f -name "resources.pak" ! -path "*/node_modules/*" -printf '%h\n' 2>/dev/null \
		| while read -r d; do [[ -d "${d}/resources" ]] && { echo "$d"; return 0; }; done
}
_check_electron_version() {
	local _v=$(strings "$(find "$(_get_app_dir)" -maxdepth 1 -type f \
		-executable -printf '%s %p\n' | sort -nr | head -1 | cut -d' ' -f2-)" \
		| grep -oP 'Electron/\K[0-9]+' | head -1)
	[[ -z "$_v" ]] && { echo -e "\033[1;33mNote: Could not check version.\033[0m"; return; }
	(( _v == _electronversion )) && c=32 || c=31
	echo -e "Electron version: \033[1;${c}m$_v$([[ $c -eq 31 ]] && echo " (expected $_electronversion)")\033[0m"
}
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
_delete_other_arch_files() {
	local _archrem=$([[ "${CARCH}" == "aarch64" ]] && echo x64 || echo arm)
	find "$(_get_app_dir)" -mindepth 1 -type d \
		\( -name '*darwin*' -o -name '*android*' -o -name "*bsd*" -o -name "*musl*" -o -name "*loong*" -o -name "*riscv*" -o -name 'win32*' -o -name "*ia32*" -o -name "*${_archrem}*" \) \
		-prune -exec rm -rf {} +
	find "$(_get_app_dir)" -mindepth 1 -type f \
		\( -name '*darwin*.node' -o -name '*android*.node' -o -name 'win32*.node' -o -name "*ia32*.node" -o -name "*${_archrem}*.node" \) \
		-prune -exec rm -rf {} +
	rm -rf "$(_get_app_dir)/resources/default_app.asar"
}
prepare() {
	sed -i -e "
		s/@electronversion@/${_electronversion}/g
		s/@appname@/${pkgname%-bin}/g
	" "${srcdir}/${pkgname%-bin}.sh"
	bsdtar -xf "${srcdir}/data."*
	_check_electron_version
	sed -i -e "
		s/Categories=Video;/Categories=AudioVideo;/g
		s/Exec=\/opt\/apps\/${_debname}\/files\/${pkgname%-bin}/Exec=${pkgname%-bin} %U/g
		s/Icon=\/opt\/apps\/${_debname}\/files\/resources\/${pkgname%-bin}.png/Icon=${pkgname%-bin}/g
	" "${srcdir}/opt/apps/${_debname}/entries/applications/${pkgname%-bin}.desktop"
	_delete_other_arch_files
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
	_install_icons
	install -Dm644 "${srcdir}/opt/apps/${_debname}/entries/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
}