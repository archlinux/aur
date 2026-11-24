# Maintainer: lzsnyy <710080675@qq.com>
pkgname=qoder-cn-agent
_pkgname=Qoder-CN
pkgver=0.5.18
_electronversion=43
pkgrel=1
pkgdesc="Qoder 全新形态，以编程智能体为核心引擎，从想法到实现，轻松搞定。"
arch=('x86_64')
url="https://qoder.cn"
license=('LicenseRef-custom')
conflicts=('qoder-cn')
provides=("qoder-cn=${pkgver}")
depends=(
    "electron${_electronversion}"
    'libsecret'
    'nodejs'
)
makedepends=(
    'asar'
)
optdepends=(
    'bash'
    'zsh'
)
options=(
    '!emptydirs'
    '!strip'
)
source=(
    "qoder-cn-${pkgver}.rpm::https://qoder-app.oss-cn-beijing.aliyuncs.com/qoder-app/releases/${pkgver}/${_pkgname}-linux-${CARCH}.rpm"
    "LICENSE.html"
    "qoder-cn.js"
    "qoder-cn.sh"
)
sha256sums=('8df354ea846a71e8d93a58417e4dc0d4d676c511b565ae4569588d2f22c8f01f'
            '64a79bddff14167a290d3547d7b4bd00cf693be6d11fb6b7018bca9d9d778ab4'
            '40b6fe2dac644f8052fedf84edc90f973942c4cf7d3ab7579d036e6d49c125fe'
            '9417ba033cfc980d6723978dc5fca100cbec6da78e5494f9e64960e4efec8c21')
pkgver() {
	cat "${srcdir}/.pkgver" 2>/dev/null || echo "${pkgver}"
}
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
    _check_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/qoder-cn/g
    " "${srcdir}/qoder-cn.sh" "${srcdir}/qoder-cn.js"
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/qoder-cn.desktop"
    # Upstream lists x-scheme-handler/qoder-cn twice in MimeType. Deduplicate so
    # desktop-file-validate stays quiet and file managers show one association.
    _desktop="${srcdir}/usr/share/applications/qoder-cn.desktop"
    _mime="$(sed -n 's/^MimeType=//p' "${_desktop}" | tr ';' '\n' | awk 'NF && !seen[$0]++' | paste -sd';')"
    sed -i "s|^MimeType=.*|MimeType=${_mime};|" "${_desktop}"
    ( cd "${srcdir}" && asar ef "$(_get_app_dir)/resources/app.asar" package.json )
    grep -oP '"version":\s*"\K[^"]+' "${srcdir}/package.json" > "${srcdir}/.pkgver"
}
package() {
    install -Dm755 "${srcdir}/qoder-cn.sh" "${pkgdir}/usr/bin/qoder-cn"
    install -Dm644 "${srcdir}/qoder-cn.js" -t "${pkgdir}/usr/lib/qoder-cn"
    install -Dm755 -d "${pkgdir}/usr/lib/qoder-cn/lib"
    cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/qoder-cn/"
    ln -sf "/usr/lib/qoder-cn/app.asar.unpacked/node_modules/@img/sharp-libvips-linux-x64/lib/libvips-cpp.so.8.17.3" \
        "${pkgdir}/usr/lib/qoder-cn/lib/libvips-cpp.so.8.17.3"
    install -Dm644 "${srcdir}/usr/share/applications/qoder-cn.desktop" -t "${pkgdir}/usr/share/applications"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/qoder-cn.${_extension}"
    done
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
