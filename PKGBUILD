# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: david4958606 <david.wang at sakisakura dot moe>
_pkgname=mihomo-party
pkgname=clash-party-bin
_appname='Clash Party'
pkgver=2.0.4
_electronversion=43
pkgrel=2
pkgdesc=":electron: Another Mihomo GUI."
arch=(
    'aarch64'
    'x86_64'
)
url="https://clashparty.org/"
_ghurl="https://github.com/mihomo-party-org/clash-party"
license=('GPL-3.0-only')
conflicts=(
    "${_pkgname}"
    "${_pkgname}-bin"
    "${_pkgname}-git"
    "${pkgname%-bin}"
    "${pkgname%-bin}-git"
)
provides=("clash-party=${pkgver}")
depends=(
    "electron${_electronversion}"
    'mihomo'
)
optdepends=(
    'libappindicator: Allow clash-party to extend a menu via Ayatana indicators in Unity, KDE or Systray'
    'libayatana-appindicator'
)
makedepends=('asar')
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-aarch64.rpm")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.rpm::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-x86_64.rpm")
sha256sums=('dfcd6603d29c7b8d88e019b517a2e5c1a7b5ab905a0961a8b81adfa508b258b8')
sha256sums_aarch64=('aa5540da49e218fe380f5cacb64c8f5ca7c4cc357027747de72fcad4afa0b395')
sha256sums_x86_64=('59f32ac2819090c25474cc9ec1e32c3f52d91a39ec454036f833fdb726b6e6bc')
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
    sed -i -e "
        s/\/opt\/${pkgname%-bin}\/${_pkgname}/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
        s/Utility/Network/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    _check_electron_version
    asar e "$(_get_app_dir)/resources/app.asar" "${srcdir}/app.asar.unpacked"
    find "${srcdir}/app.asar.unpacked" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
    sed -i -e "
        s/Name=${_pkgname}/Name=${_appname}/g
        s/Exec=\${exePath()}/Exec=${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/app.asar.unpacked/out/main/index.js"
    asar p "${srcdir}/app.asar.unpacked" "$(_get_app_dir)/resources/app.asar"
    ln -sf "/usr/bin/mihomo" "$(_get_app_dir)/resources/sidecar/mihomo"
    rm -rf \
        "$(_get_app_dir)/resources/"{apparmor-profile,app-update.yml,package-type} \
        "$(_get_app_dir)/resources/app.asar.unpacked/node_modules/@${_pkgname}/sysproxy-darwin-"*
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
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
