# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=voicestudio-bin
_pkgname=VoiceStudio
pkgver=0.5.7
_electronversion=44
pkgrel=1
pkgdesc="Open-source, fully-local ElevenLabs alternative — voice cloning, voice design, video dubbing, dictation, transcription & audiobook creation in 646 languages."
arch=('x86_64')
url="https://voicestudio.sh/"
_ghurl="https://github.com/debpalash/VoiceStudio"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    "electron${_electronversion}"
    'uv'
    'python'
    'python-yaml'
    'yt-dlp'
    'python-httpx'
    'python-numpy'
    'libmd'
    'libbsd'
    'python-cryptography'
    'python-psutil'
    'python-pydantic'
    'python-tqdm'
    'python-pytest'
    'python-pillow'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}-${pkgver}-linux-x64.deb"
    "${pkgname%-bin}.js"
    "${pkgname%-bin}.sh"
)
sha256sums=('33d23b5f9139e4032b7c8860f520abf01cd6c4f27c94b9f32c9f0851c7dc2987'
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
        s/Exec=\/opt\/${_pkgname}\/${pkgname%-bin}-electron/Exec=${pkgname%-bin}/g
        s/Icon=${pkgname%-bin}-electron/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    ln -sf "/usr/bin/uv" "$(_get_app_dir)/resources/tools/uv"
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
}
