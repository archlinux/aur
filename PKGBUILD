# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=orca-ide-bin
_pkgname=Orca
pkgver=1.4.274
_electronversion=43
pkgrel=1
pkgdesc="ADE for working with a fleet of parallel agents. Run any coding agent with your own subscription."
arch=(
    'aarch64'
    'x86_64'
)
url="https://onorca.dev/"
_ghurl="https://github.com/stablyai/orca"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'nodejs'
    'python'
    'python-gobject'
    'github-cli'
    'npm'
    'vulkan-icd-loader'
)
options=(
    '!emptydirs'
    '!strip'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/stablyai/orca/v${pkgver}/LICENSE"
    "${pkgname%-bin}.js"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}_${pkgver}_amd64.deb")
sha256sums=('ff1b611f80580d49f4b97e93a97b24eb050b0671b26b8afe16341fab699112f3'
            'd0f201d4e9b0690ccfbe9034779bf95a7a92996cef63a957bf15ea11c7d83236'
            '6295de105284c8d173a862217d76eee1610dad92dd5543f3f9e6a08a6a77929a')
sha256sums_aarch64=('85e4aedd9e1a684cd55bf44973fe4a42a70e00053b9388ee99c97a0244406aea')
sha256sums_x86_64=('96a2abd7172ac81338fe280678cdad4bd032c6d1591b11957acecae50ca54188')
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
	find "$(_get_app_dir)" -type d \
		\( -name '*darwin*' -o -name '*android*' -o -name "*bsd*" -o -name "*musl*" -o -name "*loong*" -o -name "*riscv*" -o -name 'win32*' -o -name "*ia32*" -o -name "*${_archrem}*" \) \
		-prune -exec rm -rf {} +
	find "$(_get_app_dir)" -type f \
		\( -name '*darwin*.node' -o -name '*android*.node' -o -name 'win32*.node' -o -name "*ia32*.node" -o -name "*${_archrem}*.node" \) \
		-prune -exec rm -rf {} +
	rm -rf "$(_get_app_dir)/resources/default_app.asar"
}
prepare() {
	bsdtar -xf "${srcdir}"/data.tar.* -C "${srcdir}"
	local _appdir="$(_get_app_dir)"
	[[ -d "${_appdir}/resources/bin" ]] || {
		echo "Cannot locate upstream resources/bin in ${srcdir}" >&2
		return 1
	}
	local _cli="${_appdir}/resources/bin/${pkgname%-bin}"
	cat > "${_cli}" <<'SH'
#!/usr/bin/env bash
set -euo pipefail
export ORCA_NODE_OPTIONS="${NODE_OPTIONS-}"
export ORCA_NODE_REPL_EXTERNAL_MODULE="${NODE_REPL_EXTERNAL_MODULE-}"
unset NODE_OPTIONS NODE_REPL_EXTERNAL_MODULE
ELECTRON_RUN_AS_NODE=1 exec "/usr/lib/electron@electronversion@/electron" \
	/usr/lib/@appname@/app.asar.unpacked/out/cli/index.js "$@"
SH
	sed -i -e "
		s/@electronversion@/${_electronversion}/g
		s/@appname@/${pkgname%-bin}/g
	" "${srcdir}/${pkgname%-bin}.sh" "${_cli}"
	chmod 755 "${_cli}"
	_check_electron_version
	sed -i -e "
		s/\/opt\/${_pkgname}\///g
		s/Utility/Development/g
	" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
	_delete_other_arch_files
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
	_install_icons
	install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
