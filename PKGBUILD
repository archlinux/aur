# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=orca-ide-bin
_pkgname=Orca
pkgver=1.4.244
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
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-${pkgver}.x86_64.rpm")
sha256sums=('ff1b611f80580d49f4b97e93a97b24eb050b0671b26b8afe16341fab699112f3'
            '562897be8a17076176f8d985c0d7bc1c685f2e7c9b3a932339ce015963243627'
            '9417ba033cfc980d6723978dc5fca100cbec6da78e5494f9e64960e4efec8c21')
sha256sums_aarch64=('bfd236d2bf952c4eed07457192ab67226e30915e7c76187764cc20eea1054924')
sha256sums_x86_64=('f2f50eeab7ee0a96927b391d489971e61a1b3bdac86406672705df4bd3365908')
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
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh" "${srcdir}/${pkgname%-bin}.js"
    _check_electron_version
    sed -i -e "
        s/\/opt\/${_pkgname}\///g
        s/Utility/Development/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    cat > "$(_get_app_dir)/resources/bin/${pkgname%-bin}" <<'SH'
#!/usr/bin/env bash
set -euo pipefail
export ORCA_NODE_OPTIONS="${NODE_OPTIONS-}"
export ORCA_NODE_REPL_EXTERNAL_MODULE="${NODE_REPL_EXTERNAL_MODULE-}"
unset NODE_OPTIONS NODE_REPL_EXTERNAL_MODULE
ELECTRON_RUN_AS_NODE=1 exec electron43 \
    /usr/lib/orca-ide/app.asar.unpacked/out/cli/index.js "$@"
SH
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
