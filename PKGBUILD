# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=moekoemusic-bin
_pkgname='MoeKoe Music'
_zhsname='萌音'
pkgver=1.7.1
_electronversion=39
pkgrel=1
pkgdesc="An open-source, concise, and aesthetically pleasing third-party client for KuGou.(Prebuilt version.Use system-wide electron)一款开源简洁高颜值的酷狗第三方客户端"
arch=(
    #'aarch64'
    'x86_64'
)
url="https://music.moekoe.cn/"
_ghurl="https://github.com/MoeKoeMusic/MoeKoeMusic"
license=('MIT')
conflicts=("${pkgname%-bin}")
provides=("${pkgname%-bin}=${pkgver}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'asar'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/MoeKoeMusic/MoeKoeMusic/v${pkgver}/LICENSE"
    "${pkgname%-bin}.sh"
)
#source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /_}-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${_pkgname// /_}_v${pkgver}-amd64.deb")
sha256sums=('f9c375a1be4a41f7b70301dd83c91cb89e41567478859b77eef375a52d782505'
            'dfcd6603d29c7b8d88e019b517a2e5c1a7b5ab905a0961a8b81adfa508b258b8')
sha256sums_x86_64=('9d82eab5bb170e875ac2ba06300c1f74f1524ac2c146427d6cc111e072a3ea67')
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
    bsdtar -xf "${srcdir}/data."*
    _check_electron_version
    sed -i -e "
        s/\/opt\/${_pkgname}\///g
        s/Utility/AudioVideo/g
        3i\Name[zh_CN]=${_zhsname}
    " "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop"
    asar e "$(_get_app_dir)/resources/app.asar" "${srcdir}/app.asar.unpacked"
    sed -i -e "
        s/icon\.ico/icon\.png/g
        s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g
        s/\.\.\/api/\.\/api/g
    " "${srcdir}/app.asar.unpacked/electron/appServices.js"
    asar p "${srcdir}/app.asar.unpacked" "$(_get_app_dir)/resources/app.asar"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-bin}.sh" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-bin}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    cp -a "$(_get_app_dir)/"{api,assets} "${pkgdir}/usr/lib/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-bin}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/usr/share/applications/${pkgname%-bin}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
