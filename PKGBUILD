# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tommy-git
_pkgname=Tommy
pkgver=0.59.0.r15.g77ec989
_electronversion=44
_nodeversion=24
pkgrel=1
pkgdesc="Your own crew of AI agents, on your own server, in your pocket.One server runs your agents day and night."
arch=('any')
url="https://github.com/jbaehova/tommy"
license=('PolyForm-Noncommercial-1.0.0')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
	"electron${_electronversion}"
    'nodejs'
)
makedepends=(
	'bun'
	'git'
	'nvm'
	'gendesk'
	'jq'
)
source=(
	"${pkgname//-/.}::git+${url}.git"
	"${pkgname%-git}.js"
	"${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '562897be8a17076176f8d985c0d7bc1c685f2e7c9b3a932339ce015963243627'
            'd1e4e7e73d690e97039739dd1bf8f1eb046c2fd7e44305b15008ad842a503904')
_get_project_dir() {
	local d
	while IFS= read -r d; do
		find "$d" -name "package.json" ! -path "*/node_modules/*" 2>/dev/null | grep -q . && { echo "$d"; return; }
	done < <(find "${srcdir}" -maxdepth 1 -mindepth 1 -type d ! -name '.*')
}
pkgver() {
	cd "$(_get_project_dir)"
	set -o pipefail
	git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_ensure_local_nvm() {
	local NVM_DIR="${srcdir}/.nvm"
	source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
	nvm install "${_nodeversion}"
	nvm use "${_nodeversion}"
}
_get_app_dir() {
	find "${srcdir}" -type f -name "resources.pak" ! -path "*/node_modules/*" -printf '%h\n' 2>/dev/null \
		| while read -r d; do [[ -d "${d}/resources" ]] && { echo "$d"; return 0; }; done
}
_get_electron_version() {
	_elec_ver=$(find "$(_get_project_dir)" -name "package.json" ! -path "*/node_modules/*" -print \
		| xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null \
		| grep -oE '[0-9]+' | head -1)
	[[ -z "${_elec_ver}" ]] && return 1
	(( _elec_ver == _electronversion )) && c=32 || c=31
	echo -e "Electron version: \033[1;${c}m${_elec_ver}$([[ $c -eq 31 ]] && echo " (expected ${_electronversion})")\033[0m"
}
_set_electron_build_env() {
	export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
	export ELECTRON_OVERRIDE_DIST_PATH="${ELECTRON_DIST}"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export ELECTRON_BUILDER_OFFLINE=true
	export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/^v//')"
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
	_get_electron_version
	sed -i -e "
		s/@electronversion@/${_electronversion}/g
		s/@appname@/${pkgname%-git}/g
	" "${srcdir}/${pkgname%-git}.sh" "${srcdir}/${pkgname%-git}.js"
	gendesk -q -f -n \
		--pkgname="${pkgname%-git}" \
		--pkgdesc="${pkgdesc}" \
		--categories="Development" \
		--name="${_pkgname}" \
		--exec="${pkgname%-git} %U"
	_ensure_local_nvm
	_set_electron_build_env
	_set_bun_build_env
	jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' package.json > package.json.tmp && mv package.json.tmp package.json
	export NODE_ENV=development
	bun install
}
build() {
	cd "$(_get_project_dir)"
	_ensure_local_nvm
	_set_electron_build_env
	_set_bun_build_env
	export NODE_ENV=production
	bun run build
	bunx electron-builder --linux dir -c.electronDist="${ELECTRON_DIST}" --config electron-builder.yml
	rm -rf "$(_get_app_dir)/resources/default_app.asar"
}
package() {
	install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
	install -Dm644 "${srcdir}/${pkgname%-git}.js" -t "${pkgdir}/usr/lib/${pkgname%-git}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
	install -Dm644 "$(_get_project_dir)/build/icon-production.png" "${pkgdir}/usr/share/icons/hicolor/1600x1600/apps/${pkgname%-git}.png"
    install -Dm644 "$(_get_project_dir)/build/icon.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-git}.svg"
	install -Dm644 "$(_get_project_dir)/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
	install -Dm644 "$(_get_project_dir)/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
