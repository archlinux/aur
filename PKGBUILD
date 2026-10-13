# Maintainer: AnRan <2318621872 at qq dot com>
# Contributor: zxp19821005 <zxp19821005 at 163 dot com> (launcher script approach)
pkgname=zcode-bin
_pkgname=ZCode
pkgver=3.15.1
_electronversion=41
pkgrel=2
pkgdesc="ZCode - AI-powered code editor by ZAI"
arch=(
    'aarch64'
    'x86_64'
)
url="https://zcode.z.ai/"
_ghurl="https://github.com/zai-org/ZCode"
license=('LicenseRef-ZCode')
depends=(
    "electron${_electronversion}"
    'python'
    'python-reportlab'
    'python-lxml'
    'python-pillow'
    'python-defusedxml'
    'libstdc++'
    'nodejs'
    'libgcc'
    'ripgrep'
    'xdg-utils'
)
makedepends=(
    'asar'
)
options=(
    '!strip'
)
source=(
    "LICENSE"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::https://cdn-zcode.z.ai/zcode/electron/releases/${pkgver}/linux-arm64/${_pkgname}-${pkgver}-linux-arm64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::https://cdn-zcode.z.ai/zcode/electron/releases/${pkgver}/linux-x64/${_pkgname}-${pkgver}-linux-x64.rpm")
sha256sums=('6f7a7821eec5ffc00c7e5c24ac0b917864d503253816c6546c723e84ed418919'
            'cebedc3391cbab6d43f37fbf3a87ddaad16597cb5ea487a4d55b1f478d810082')
sha256sums_aarch64=('6854c6d6f154fa8fa9b4f9c16f1ddc0510c024ef6d873eef3ef5a9f93d466e4d')
sha256sums_x86_64=('652db0d09b99b8b7c0686261392f3aab9ba6bfde8fb9db0b45384593321a9257')
_get_app_dir() {
	find "${srcdir}" -type f -name "resources.pak" ! -path "*/node_modules/*" -print 2>/dev/null | while read f; do [ -d "${f%/*}/resources" ] && echo "${f%/*}" && break; done
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
    _check_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
    " "${srcdir}/${pkgname%-bin}.sh"
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    local _app_dir=$(_get_app_dir)
    asar e "${_app_dir}/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked/out" -type f -exec sed -i "s/process.resourcesPath/'\/usr\/lib\/${pkgname%-bin}'/g" {} +
    case "${CARCH}" in
		aarch64)	_archrem=x64	;;
		x86_64)		_archrem=arm	;;
	esac
	find "${_app_dir}/resources/app.asar.unpacked" -depth \
		\( -name "darwin*" -o -name "win32*" -o -name "*${_archrem}"* \) \
		-exec rm -rf {} +
    asar p "${srcdir}/app.asar.unpacked" "${_app_dir}/resources/app.asar"
    ln -sf "/usr/bin/rg" "${_app_dir}/resources/tools/ripgrep/rg"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
    local _app_dir="$(_get_app_dir)"
    cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
