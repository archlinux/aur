# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=smartsub-bin
_pkgname=SmartSub
_zhsname='妙幕'
pkgver=3.12.0
_electronversion=30
pkgrel=1
pkgdesc="A cross-platform client side tool that can generate subtitle files for video or audio in batches, and supports subtitle translation. It supports Baidu, Volcano, OpenAI, Olama, DeepSeek and other translators."
arch=('x86_64')
url="https://smartsub.lxd.one/"
_ghurl="https://github.com/buxuku/SmartSub"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
    'python-openai-whisper'
    'ffmpeg'
    'nodejs'
    'python-numpy'
)
makedepends=(
    'dpkg'
)
source=(
    "${pkgname%-bin}-${pkgver}.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname}_Linux_${pkgver}_amd64.deb"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/buxuku/SmartSub/v${pkgver}/LICENSE"
    "${pkgname%-bin}.js"
    "${pkgname%-bin}.sh"
)
sha256sums=('e4d1213a598b7514c3b6ba23ed1a6c58a971915b2da15fec212512944bd52600'
            '324178aaf0ebe3ab663803d3a63439cd8cdf02c3a4a40609c9ac6f8af517faed'
            '562897be8a17076176f8d985c0d7bc1c685f2e7c9b3a932339ce015963243627'
            '9417ba033cfc980d6723978dc5fca100cbec6da78e5494f9e64960e4efec8c21')
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
    sed -i "s/\/opt\/${_pkgname}\///g" "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    #ln -sf "/usr/bin/ffmpeg" "$(_get_app_dir)/resources/app.asar.unpacked/node_modules/@ffmpeg-installer/linux-x64/ffmpeg"
    ln -sf "/usr/bin/ffmpeg" "$(_get_app_dir)/resources/app.asar.unpacked/node_modules/ffmpeg-static/ffmpeg"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    find "${srcdir}" -type f \( -name "*.png" -o -name "*.svg" \) -path "*share/icons/*" | while read -r _i; do
        _extension="${_i##*.}"
        _icon_path="${_i#*share/icons/}"
        _target_dir="/usr/share/icons/$(dirname "${_icon_path}")"
        install -Dm644 "${_i}" "${pkgdir}${_target_dir}/${pkgname%-bin}.${_extension}"
    done
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
