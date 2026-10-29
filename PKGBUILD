# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_pkgname=ente
pkgname="${_pkgname}-desktop-bin"
pkgver=1.7.31
_electronversion=42
pkgrel=1
pkgdesc="Desktop app for ente Photos."
arch=(
    'aarch64'
    'x86_64'
)
url="https://ente.com/"
_ghurl="https://github.com/ente-io/photos-desktop"
license=('GPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'ffmpeg'
    'nodejs'
)
source=(
    "${pkgname%-bin}.js"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.pacman::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-aarch64.pacman")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.pacman::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-x64.pacman")
sha256sums=('562897be8a17076176f8d985c0d7bc1c685f2e7c9b3a932339ce015963243627'
            '0f4675ddc96a032accf82723c7b6b66007bafd18aa8d919b61e983a68fd25328')
sha256sums_aarch64=('8dd555264231992b8a730ca476855f247d88b1bb2dabc36c04f1b1372fff4a3e')
sha256sums_x86_64=('3f95a301ad5df751dbf8ef7034e647c2f63bd03b47eb9ba1ca2dcea903c955ff')
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
    _check_electron_version
    sed -i -e "
        s/\/opt\/${_pkgname}\/${_pkgname}/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
        s/Photography/Graphics/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    sed -i "s/io.${_pkgname}.photos/${pkgname%-bin}/g" "$(_get_app_dir)/resources/io.${_pkgname}.photos.appdata.xml"
    ln -sf "/usr/bin/ffmpeg" "$(_get_app_dir)/resources/app.asar.unpacked/node_modules/ffmpeg-static/ffmpeg"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "$(_get_app_dir)/resources/io.${_pkgname}.photos.appdata.xml" "${pkgdir}/usr/share/appdata/${pkgname%-bin}.appdata.xml"
}
