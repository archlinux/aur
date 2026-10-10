# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lynxhub-bin
_pkgname=LynxHub
_debname="ai.kindabrazy.${pkgname%-bin}"
pkgver=3.6.1
_electronversion=43
pkgrel=1
pkgdesc="Cross-platform, extensible terminal/browser for AI management."
arch=(
    'aarch64'
    'x86_64'
)
url="https://lynxhub.app/"
_ghurl="https://github.com/KindaBrazy/LynxHub"
license=('AGPL-3.0-only')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/V${pkgver}/${_pkgname}-V${pkgver}-linux_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/V${pkgver}/${_pkgname}-V${pkgver}-linux_amd64.deb")
sha256sums=('cebedc3391cbab6d43f37fbf3a87ddaad16597cb5ea487a4d55b1f478d810082')
sha256sums_aarch64=('d842c41ac13031e5bc86ded3ded696ffdc1b3b404d581b75aa01b586b29547b9')
sha256sums_x86_64=('fc75d85ede87b6b27641478f537fd4e10575ad772b90c7e793cffb732ace96aa')
_get_app_dir() {
	find "${srcdir}" -type f -name "resources.pak" -print 2>/dev/null | while read f; do [ -d "${f%/*}/resources" ] && echo "${f%/*}" && break; done
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
        s/@runname@/app.asar/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _check_electron_version
    sed -i -e "
        s/\/opt\/${_pkgname}\/${pkgname%-bin} --no-sandbox/${pkgname%-bin}/g
        s/ArtificialIntelligence/ArtificialIntelligence;Utility/g
    " "${srcdir}/usr/share/applications/${_debname}.desktop"
    local _app_dir="$(_get_app_dir)"
	case "${CARCH}" in
		aarch64)	_archrem=x64	;;
		x86_64)		_archrem=arm	;;
	esac
	find "${_app_dir}/resources/app.asar.unpacked" -depth \
		\( -name "darwin*" -o -name "win32*" -o -name "*${_archrem}"* \) \
		-exec rm -rf {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir="$(_get_app_dir)"
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${_debname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
