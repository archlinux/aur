# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=wj-markdown-editor-bin
pkgver=2.23.0
_electronversion=43
pkgrel=1
pkgdesc="An open-source desktop markup editor that supports webdav.一款支持webdav的开源桌面端markdown编辑器"
arch=('x86_64')
url="https://github.com/nlbwqmz/wj-markdown-editor"
license=('MIT')
conflicts=(
    "${pkgname%-bin}"
    "${pkgname%-bin}-git"
)
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    "asar"
)
source=(
    "${pkgname%-bin}-${pkgver}.rpm::${url}/releases/download/${pkgver}/${pkgname%-bin}-linux-${CARCH}-${pkgver}.rpm"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/nlbwqmz/wj-markdown-editor/${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('13cc66480bbdc4e5766dbdc2f2deb03e8f46000d8bc21a9bec958a4e4ab7feb5'
            '4db85f2bcfa2b60623a893393a61158a562fd907cf1244a06f41fd11eb6f8605'
            'dfcd6603d29c7b8d88e019b517a2e5c1a7b5ab905a0961a8b81adfa508b258b8')
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
    " "${srcdir}/${pkgname%-bin}.sh"
    _check_electron_version
    sed -i "s/\/opt\/${pkgname%-bin}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "$(_get_app_dir)/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed -i "s|const documentsPath = app.isPackaged ? path.resolve(app.getPath('documents'), 'wj-markdown-editor') : app.getAppPath()|const documentsPath = path.resolve(app.getPath('userData'))|g" \
        "${srcdir}/app.asar.unpacked/src/data/recent.js"
    sed -i "s|return app.isPackaged|return true \|\| app.isPackaged|g" \
        "${srcdir}/app.asar.unpacked/src/data/config/configConstants.js"
    sed -i "s|app.getPath('documents'), 'wj-markdown-editor'|app.getPath('userData')|g" \
        "${srcdir}/app.asar.unpacked/src/data/config/configConstants.js"
    sed -i "s|app.getPath('documents'), 'wj-markdown-editor/logs'|app.getPath('userData'), 'logs'|g" \
        "${srcdir}/app.asar.unpacked/src/util/logUtil.js"
    asar p "${srcdir}/app.asar.unpacked" "$(_get_app_dir)/resources/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/usr/share/mime/packages/${pkgname%-bin}.xml" -t "${pkgdir}/usr/share/mime/packages"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
