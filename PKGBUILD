# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=lvce-bin
pkgver=0.125.5
_electronversion=44
pkgrel=1
pkgdesc="VS Code inspired text editor that mostly runs in a webworker."
arch=(
    'aarch64'
    'x86_64'
)
url="https://lvce-editor.github.io/lvce-editor"
_ghurl="https://github.com/lvce-editor/lvce-editor"
license=('MIT')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'nodejs'
    'python'
)
options=(
    '!strip'
    '!emptydirs'
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}_arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-v${pkgver}_amd64.deb")
source=(
    "lintian-${pkgname%-bin}"
    "${pkgname%-bin}.sh"
)
sha256sums=('ada1a0303abece27be80372538645da5c5b4e9d60fcacc87b97da1c26b8931bc'
            'a175afba52c8032d84ffe4277eec56f2e4868ae55692a741266b806b98b89953')
sha256sums_aarch64=('8cc1e2ef4bf34be13cc429a1c897e7797a7337f34feb5d9fee4a09ad55d1a90b')
sha256sums_x86_64=('db0a5d9d4f3db82062e36af03cfd1c7b502cb0b581b8e0ccc0d2cebb59a1c846')
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
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
    " "${srcdir}/lintian-${pkgname%-bin}"
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app/g
    " "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _check_electron_version
    sed -i "s/\/usr\/lib\/${pkgname%-bin}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    local _app_dir="$(_get_app_dir)"
    case "${CARCH}" in
        aarch64)    _arch_rem="x64"     ;;
        x86_64)     _arch_rem="arm64"   ;;
    esac
    find "${_app_dir}/resources/app/packages" -depth \
        \( -name "*android*" -o -name "ios-*" -o -name "*win32*" -o -name "*darwin*" -o -name "*${_arch_rem}*" \) \
        -exec rm -rf {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	local _app_dir="$(_get_app_dir)"
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/usr/share/doc/${pkgname%-bin}/copyright" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/usr/share/pixmaps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/bash-completion/completions/${pkgname%-bin}" -t "${pkgdir}/usr/share/bash-completion/completions"
    install -Dm644 "${srcdir}/lintian-${pkgname%-bin}" "${pkgdir}/usr/share/lintian/overrides/${pkgname%-bin}"
}
