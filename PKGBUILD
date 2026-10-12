# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=yesplaymusic-bin
_pkgname=YesPlayMusic
pkgver=0.4.11
_electronversion=13
pkgrel=1
pkgdesc="A third party music application for Netease Music.高颜值的第三方网易云播放器."
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://music.qier222.com/"
_ghurl="https://github.com/qier222/YesPlayMusic"
license=('MIT')
depends=(
    "electron${_electronversion}"
)
provides=("${pkgname%-bin}=${pkgver}")
conflicts=(
    "${pkgname%-bin}"
    "${pkgname%-bin}-electron"
    "${pkgname%-bin}osd-electron"
    "${pkgname%-bin}osd-origin"
    "my-${pkgname%-bin}"
    "r3play"
    "r3playx"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}_${pkgver%_2}_arm64.deb")
source_armv7h=("${pkgname%-bin}-${pkgver}-armv7h.deb::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}_${pkgver%_2}_armv7l.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver//_/-}/${pkgname%-bin}_${pkgver%_2}_amd64.deb")
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/qier222/YesPlayMusic/v${pkgver//_/-}/LICENSE"
    "${pkgname%-bin}.sh"
)
sha256sums=('c33378c6fd12e6d040cedd06dc0d1bedfca74fd66bc46cc2cf10cc10e0906be6'
            'cebedc3391cbab6d43f37fbf3a87ddaad16597cb5ea487a4d55b1f478d810082')
sha256sums_aarch64=('e956e2fa8fa2ecc12441e3718fab4d08db3b33efbdf95a475d00fe8cd852ed42')
sha256sums_armv7h=('507078afcd0550ab01044a38093e0e3ab87ea1db092a196b291d5507c20aada0')
sha256sums_x86_64=('17a39a83ba5d799cbd517c2c182994cdb9b254cfba92fd10dbfb27cdcf421714')
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
        s/@runname@/app.asar/g
    " -i "${srcdir}/${pkgname%-bin}.sh"
    bsdtar -xf "${srcdir}/data."*
    _check_electron_version
    sed -i -e "
        s/\/opt\/${_pkgname}\/${pkgname%-bin}/${pkgname%-bin}/g
        s/Music;/AudioVideo;/g
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
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
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
