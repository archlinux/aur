# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=mailspring-bin
_pkgname=Mailspring
pkgver=1.26.1
_electronversion=44
pkgrel=1
pkgdesc="A beautiful, fast and fully open source mail client."
arch=(
    'aarch64'
    'x86_64'
)
url="https://getmailspring.com/"
_ghurl="https://github.com/Foundry376/Mailspring"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'krb5'
    'db5.3'
    'tidy'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-0.1.aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/${pkgver}/${pkgname%-bin}-${pkgver}-0.1.x86_64.rpm")
sha256sums=('a175afba52c8032d84ffe4277eec56f2e4868ae55692a741266b806b98b89953')
sha256sums_aarch64=('1d56ca1ee2a68532a931a157941e33a74956d3aa85678480e2c3e632761b8619')
sha256sums_x86_64=('2e05fc97dfa9b5b0e99a77953db5ab275de0bfefda2a1762534db9da2abeb3ae')
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
_get_current_desktop_env() {
    if [ -n "$XDG_CURRENT_DESKTOP" ]; then
        if echo "$XDG_CURRENT_DESKTOP" | grep -i gnome > /dev/null; then
            echo "gnome"
            return 0
        elif echo "$XDG_CURRENT_DESKTOP" | grep -i kde > /dev/null || echo "$XDG_CURRENT_DESKTOP" | grep -i plasma > /dev/null; then
            echo "plasma"
            return 0
        fi
    fi
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _check_electron_version
    _desktop_env="$(_get_current_desktop_env)"
    if [ "${_desktop_env}" = "gnome" ];then
        sed -i "s/Exec=${pkgname%-bin}/Exec=${pkgname%-bin} --password-store=\"gnome-libsecret\"/g" \
            "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    fi
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/usr/share/metainfo/${pkgname%-bin}.metainfo.xml" -t "${pkgdir}/usr/share/metainfo"
}
