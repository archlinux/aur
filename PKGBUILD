# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=kilo
pkgname="${_appname}-compress-git"
_pkgname=Kilo
pkgver=3.3.1.r17.gbe38e45
_nodeversion=26
pkgrel=1
pkgdesc="Fast, local-first batch image compression for desktop.极速本地批量图片压缩工具"
arch=('any')
url="https://xiangsu.fun"
_ghurl='https://github.com/richhost/kilo'
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=(
	'glibc'
	'hicolor-icon-theme'
    'icu'
)
makedepends=(
	'git'
	'gendesk'
    'bun'
    'nvm'
	'imagemagick'
)
options=(
    '!strip'
    '!debug'
)
source=("${pkgname%-git}.git::git+${_ghurl}.git")
sha256sums=('SKIP')
_get_project_dir() {
	find "${srcdir}" -name "package.json" -not -path "*/node_modules/*" -not -path "*/.git/*" \
		2>/dev/null | sort -d | tail -n1 | xargs dirname
}
_generate_icons() {
	local _sizes=(16 24 32 48 64 96 128 256 512 1024) _src="$(_get_project_dir)/assets/icon.png" _s
	for _s in "${_sizes[@]}"; do
		install -d "${pkgdir}/usr/share/icons/hicolor/${_s}x${_s}/apps"
		magick "${_src}" -background none -filter Lanczos -resize "${_s}x${_s}" \
			-strip -define png:compression-level=9 \
			"${pkgdir}/usr/share/icons/hicolor/${_s}x${_s}/apps/${pkgname%-git}.png"
	done
}
pkgver() {
	cd "$(_get_project_dir)" || return 1
	local _t=$(git tag --list --sort=-v:refname | grep -m1 -E '^v?[0-9]+(\.[0-9]+)+(-[0-9A-Za-z][0-9A-Za-z.-]*)?$' || :)
	local _n=$(git rev-list --count "${_t:+$_t..}HEAD") _s=$(git rev-parse --short=7 HEAD) _v=${_t#v}; _v=${_v//-/_}
	[[ -n $_t ]] && printf '%s.r%s.g%s\n' "$_v" "$_n" "$_s" || printf 'r%s.%s\n' "$_n" "$_s"
}
_ensure_local_nvm() {
	local NVM_DIR="${srcdir}/.nvm"
	source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
	nvm install "${_nodeversion}"
	nvm use "${_nodeversion}"
}
_set_bun_build_env() {
	export HOME="${srcdir}/.home"
	export XDG_CACHE_HOME="${HOME}/.cache"
	export XDG_CONFIG_HOME="${HOME}/.config"
	export XDG_DATA_HOME="${HOME}/.local/share"
	export BUN_INSTALL_CACHE_DIR="${HOME}/.bun/cache"
	export BUN_INSTALL_GLOBAL_DIR="${HOME}/.bun/global"
	export BUN_INSTALL_BIN="${HOME}/.bun/bin"
	export BUN_CONFIG_SKIP_SAVE_LOCKFILE=1
	export BUN_CONFIG_SKIP_LOAD_LOCKFILE=1
	export BUN_DISABLE_DOTENV=1
	export DO_NOT_TRACK=1
	export BUN_JOBS="$(nproc)"
	mkdir -p "${HOME}" "${BUN_INSTALL_CACHE_DIR}" "${BUN_INSTALL_GLOBAL_DIR}" "${BUN_INSTALL_BIN}"
}
prepare() {
    cd "$(_get_project_dir)"
    gendesk -q -f -n \
		--pkgname="${pkgname%-git}" \
		--pkgdesc="${pkgdesc}" \
		--categories="Graphics" \
		--name="${_pkgname}" \
		--exec="${pkgname%-git} %U"
    _ensure_local_nvm
    _set_bun_build_env
    bun install
}
build() {
	cd "$(_get_project_dir)"
	_ensure_local_nvm
    _set_bun_build_env
	bun run build
}
package() {
	install -Dm755 "$(_get_project_dir)/dist/${_appname}" "${pkgdir}/usr/bin/${pkgname%-git}"
	_generate_icons
	install -Dm755 "$(_get_project_dir)/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "$(_get_project_dir)/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}