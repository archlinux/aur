# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=shutu_client
pkgname="${_appname//_/-}-bin"
_pkgname=ShuTu
_enname=TreeMind
_zhsname="树图思维导图"
pkgver=1.0.7
_electronversion=21
pkgrel=5
pkgdesc="A new generation of 'AI intelligence' mind map.新一代'AI智能'思维导图"
arch=('x86_64')
url="https://shutu.cn"
_dlurl="https://github.com/zxp19821005/My_AUR_Files"
license=('LicenseRef-custom')
conflicts=(
    "${pkgname%-bin}"
    "${_appname}"
)
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}-bin"
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_dlurl}/releases/download/shutu-mirror/${_pkgname}-Linux-${pkgver}.deb"
    "LICENSE-user.html"
    "LICENSE-privacy.html"
    "LICENSE-upload.html"
    "${pkgname%-bin}.js"
    "${pkgname%-bin}.sh"
)
sha256sums=('923bd86ab825a23aa31e0b8aaf04f56a3fd427c23f8f78a6fe31b9cf1eae30f3'
            '0c61137e0949077ce76ecee1d5709b054b272bb6787fa6b2bfe63dbc16175ccd'
            '08b36b6ebe9256e91033557c43fe911857a2eea4c1ac07e19e61c577f219a09a'
            'bce7b2ffb9a99535c7ede2122a9c078226affd95f2cfe4e9831c8f79586429a3'
            '562897be8a17076176f8d985c0d7bc1c685f2e7c9b3a932339ce015963243627'
            '0f4675ddc96a032accf82723c7b6b66007bafd18aa8d919b61e983a68fd25328')
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
    bsdtar -xf "${srcdir}/data."*
    _check_electron_version
    sed -i -e "
        s/\"\/opt\/${_zhsname}\/${_appname}\"/${pkgname%-bin}/g
        s/Icon=${_appname}/Icon=${pkgname%-bin}/g
        s/Name=/Name[zh_CN]=/g
        s/Comment=${_zhsname}/Comment=${pkgdesc}/g
        2i\Name=${_enname}
    " "${srcdir}/usr/share/applications/${_appname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
	install -Dm644 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/usr/share/applications/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
		_extension="${_i##*.}"
		_icon_path="${_i#*share/icons/}"
		_target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
		install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
	done
    install -Dm644 "${srcdir}/LICENSE-"*.html -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
