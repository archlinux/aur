# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: david4958606 <david.wang at sakisakura dot moe>
_pkgname=mihomo-party
pkgname=clash-party-bin
_appname='Clash Party'
pkgver=2.0.5
_electronversion=43
pkgrel=1
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
makedepends=(
    'asar'
)
optdepends=(
    'libappindicator: Allow clash-party to extend a menu via Ayatana indicators in Unity, KDE or Systray'
    'libayatana-appindicator'
)
source=(
    "${pkgname%-bin}.js"
    "${pkgname%-bin}.sh"
)
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::${_ghurl}/releases/download/v${pkgver}/${pkgname%-bin}-linux-${pkgver}-amd64.deb")
sha256sums=('562897be8a17076176f8d985c0d7bc1c685f2e7c9b3a932339ce015963243627'
            'd1e4e7e73d690e97039739dd1bf8f1eb046c2fd7e44305b15008ad842a503904')
sha256sums_aarch64=('e82979aff40897c864f477e1c095017c19f411213ea63491a28310207c807268')
sha256sums_x86_64=('277a9cd9d41c946dc1a1b52231a6b32d88fd874d041371518f7da02874b4cdc6')
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
_install_icons() {
	local _src="${1:-${srcdir}}" _name="${pkgname%-bin}" _icon _ext _size _dest
	while IFS= read -r -d '' _icon; do
		_ext="${_icon##*.}"
		_size=$(echo "${_icon%/*}" | grep -oE '[0-9]+x[0-9]+|scalable' | head -1)
		[[ -z "${_size}" ]] && _size=$([[ "${_ext}" == svg ]] && echo scalable || od -An -tu1 -j16 -N8 "${_icon}" 2>/dev/null | awk '{printf "%dx%d",$1*16777216+$2*65536+$3*256+$4,$5*16777216+$6*65536+$7*256+$8}')
		[[ "${_size}" =~ ^[0-9]+x[0-9]+$ ]] || _size=scalable
		_dest=$([[ "${_icon}" == */share/pixmaps/* ]] && echo pixmaps || echo "icons/hicolor/${_size}/apps")
		install -Dm644 "${_icon}" "${pkgdir}/usr/share/${_dest}/${_name}.${_ext}"
	done < <(find "${_src}" \( -path '*/share/icons/*' -o -path '*/share/pixmaps/*' -o -path '*entries/icons/*' \) -type f \( -name '*.png' -o -name '*.svg' \) -print0 2>/dev/null)
}
prepare() {
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-bin}/g
    " "${srcdir}/${pkgname%-bin}.sh" "${srcdir}/${pkgname%-bin}.js"
    bsdtar -xf "${srcdir}/data."*
    sed -i -e "
        s/\/opt\/${pkgname%-bin}\/${_pkgname}/${pkgname%-bin}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-bin}/g
        s/Utility/Network/g
    " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
    _check_electron_version
    asar e "$(_get_app_dir)/resources/app.asar" "${srcdir}/app.asar.unpacked"
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
    install -Dm644 "${srcdir}/${pkgname%-bin}.js" -t "${pkgdir}/usr/lib/${pkgname%-bin}"
    cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-bin}/"
    _install_icons
    install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/mime/packages/${_pkgname}.xml" "${pkgdir}/usr/share/mime/packages/${pkgname%-bin}.xml"
}