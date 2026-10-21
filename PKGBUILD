# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=qoder-cn-bin
_pkgname=Qoder-CN
pkgver=0.4.8
_electronversion=43
pkgrel=1
pkgdesc="Qoder 全新形态，以编程智能体为核心引擎，从想法到实现，轻松搞定。"
arch=('x86_64')
url="https://qoder.cn"
license=('LicenseRef-custom')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
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
    "${pkgname%-bin}-${pkgver}.rpm::https://qoder-app.oss-cn-beijing.aliyuncs.com/qoder-app/releases/latest/${_pkgname}-linux-${CARCH}.rpm"
    "LICENSE.html"
    "resources-path-override.js"
    "${pkgname%-bin}.sh"
)
sha256sums=('SKIP'
            '64a79bddff14167a290d3547d7b4bd00cf693be6d11fb6b7018bca9d9d778ab4'
            '7860b52642f7f9cac7341253149e5ac9b75deb338c2cf507c90e49a05d3adeb8'
            '523a9e7294fb8d0611611db823288e3dc38ae021eceb3067791dc0c4ff3b0d15')
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
        s/@appname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh" "${srcdir}/resources-path-override.js"
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    ( cd "${srcdir}" && asar ef "$(_get_app_dir)/resources/app.asar" package.json )
    grep -oP '"version":\s*"\K[^"]+' "${srcdir}/package.json" > "${srcdir}/.pkgver"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/resources-path-override.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}/lib"
    cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    ln -sf "/usr/lib/${pkgname%-bin}/app.asar.unpacked/node_modules/@img/sharp-libvips-linux-x64/lib/libvips-cpp.so.8.17.3" \
        "${pkgdir}/usr/lib/${pkgname%-bin}/lib/libvips-cpp.so.8.17.3"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/LICENSE.html" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
