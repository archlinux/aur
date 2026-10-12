# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: neko_ayaya
# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
pkgname=aionui-bin
_pkgname=AionUi
pkgver=2.2.2
pkgrel=1
_electronversion=37
pkgdesc="Free, local, open-source 24/7 Cowork app and OpenClaw for Gemini CLI, Claude Code, Codex, OpenCode, Qwen Code, Goose CLI, Auggie, and more."
arch=(
    'aarch64'
    'x86_64')
url="https://www.aionui.com/"
_ghurl="https://github.com/iOfficeAI/AionUi"
license=('Apache-2.0')
conflicts=("${pkgname}-bin")
provides=("${pkgname}-bin")
depends=(
  "electron${_electronversion}"
  'python'
  'nodejs'
  'python-typing_extensions'
  'python-packaging'
  'aioncore'
  'libsecret'
)
makedepends=(
  'asar'
)
options=(
  '!strip'
  '!emptydirs'
)
source=("${pkgname%-bin}.sh")
source_aarch64=("${pkgname%-bin}-${pkgver}-aarch64.deb::https://static.aionui.com/releases/${pkgver}/${_pkgname}-${pkgver}-linux-arm64.deb")
source_x86_64=("${pkgname%-bin}-${pkgver}-x86_64.deb::https://static.aionui.com/releases/${pkgver}/${_pkgname}-${pkgver}-linux-amd64.deb")
sha256sums=('cebedc3391cbab6d43f37fbf3a87ddaad16597cb5ea487a4d55b1f478d810082')
sha256sums_aarch64=('3e8e2f292371fcb1ed5ba9a3a28386e7f0610fcc765480b1e95762e1110515e2')
sha256sums_x86_64=('2d40d5cf6e27417e1eadc0eb2692808e9496c7f7133194fa588801d339cdd8e7')
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
  " "${srcdir}/${pkgname%-bin}.sh"
  bsdtar -xf "${srcdir}/data."*
  _check_electron_version
  sed -i -e "
    s|/opt/${_pkgname}/${_pkgname}|${pkgname%-bin}|g
    s|Icon=${_pkgname}|Icon=${pkgname%-bin}|g
    s|Comment=\${description}|Comment=${pkgdesc}|g
  " "${srcdir}/usr/share/applications/${_pkgname}.desktop"
  local _app_dir="$(_get_app_dir)"
  asar e "${_app_dir}/resources/app.asar" "${srcdir}/app.asar.unpacked"
  find "${srcdir}/app.asar.unpacked" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-bin}\'/g" {} +
  asar p "${srcdir}/app.asar.unpacked" "${_app_dir}/resources/app.asar"
  case "${CARCH}" in
    aarch64)  _archdir="linux-arm64"  ;;
    x86_64)   _archdir="linux-x64"    ;;
  esac
  ln -sf "/usr/bin/aioncore" "${_app_dir}/resources/bundled-aioncore/${_archdir}/aioncore"
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
  install -Dm644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
}
