# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=publii-bin
_pkgname=Publii
pkgver=0.48.1
_electronversion=43
pkgrel=1
pkgdesc="The most intuitive Static Site CMS designed for SEO-optimized and privacy-focused websites."
arch=('x86_64')
url="https://getpublii.com"
_ghurl="https://github.com/GetPublii/Publii"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'libsecret'
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/download/${_pkgname}-${pkgver}.rpm"
    "${pkgname%-bin}.sh"
)
sha256sums=('db307fa3bb8eb098b3e00171b492d56a3fa842543a3d0582ebe11f01a646a9d1'
            'cebedc3391cbab6d43f37fbf3a87ddaad16597cb5ea487a4d55b1f478d810082')
_get_app_dir() {
	find "${srcdir}" -type f -name "resources.pak" -print 2>/dev/null | while read f; do [ -d "${f%/*}/resources" ] && echo "${f%/*}" && break; done
}
_check_electron_version() {
    local _v=$(strings "$(find "$(_get_app_dir)" -maxdepth 1 -type f -executable \
        -printf '%s %p\n' | sort -nr | head -1 | cut -d' ' -f2-)" \
        | grep -oP 'Electron/\K[0-9]+' | head -1)
    [[ -z "$_v" ]] && echo -e "\033[1;33mNote: Could not check version.\033[0m" || \
        [[ "$_v" != "$_electronversion" ]] && \
        echo -e "\033[1;31mWarning: Version mismatch!\033[0m" || \
        echo -e "Electron version: \033[1;32m$_v\033[0m"
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
        s/@runname@/app.asar/g
    " "${srcdir}/${pkgname%-bin}.sh"
    _check_electron_version
    sed -i -e "
        s/\/opt\/${_pkgname}\/${_pkgname}/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    local _app_dir="$(_get_app_dir)"
    rm -rf "${_app_dir}/resources/app.asar.unpacked/node_modules/better-sqlite3/prebuilds/"{*arm64*,darwin-*,win32-*}
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
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
