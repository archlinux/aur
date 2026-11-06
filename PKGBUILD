# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bilibili
_pkgver=1.20.0
_subver=2
pkgver="${_pkgver}_${_subver}"
_electronversion=43
_nodeversion=24
pkgrel=1
pkgdesc="Linux version based on Beilai official client porting supports roaming.基于哔哩哔哩官方客户端移植的Linux版本,支持漫游"
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.jysafe.cn/"
_ghurl="https://github.com/msojocs/bilibili-linux"
license=('MIT')
provides=("${pkgname}")
conflicts=(
    "${pkgname}"
)
depends=(
    "electron${_electronversion}"
    'ffmpeg'
    'libappindicator'
    'nodejs'
    'libinput'
)
makedepends=(
    'wget'
    'perl-image-exiftool'
    'asar'
    'unzip'
    'p7zip'
    'npm'
    'nvm'
    'pnpm'
    'git'
    'jq'
)
options=(
    '!strip'
    '!emptydirs'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${_pkgver}-${_subver}.tar.gz"
    "${pkgname}.js"
    "${pkgname}.sh"
)
sha256sums=('9d0b2f116756cddccd043bed65efaedd5272e9f40231d71ce093d7a5b7282f74'
            '562897be8a17076176f8d985c0d7bc1c685f2e7c9b3a932339ce015963243627'
            'ace275e253744ca62d2572776df26b947f3c89616239985003126db635fc300e')
_get_project_dir() {
	local d
	while IFS= read -r d; do
		find "$d" -name "package.json" ! -path "*/node_modules/*" 2>/dev/null | grep -q . && { echo "$d"; return; }
	done < <(find "${srcdir}" -maxdepth 1 -mindepth 1 -type d ! -name '.*')
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
	local _v
	_v=$(jq -r '.. | (.electron? // empty) | strings | select(test("^[0-9]"))' "$(_get_project_dir)/package.json" 2>/dev/null | head -1)
	[[ -z "$_v" ]] && _v=$(grep -oE 'electron@[0-9.]+' "$(_get_project_dir)/pnpm-lock.yaml" 2>/dev/null | head -1 | sed 's/^electron@//')
	[[ -z "$_v" ]] && _v=$(grep -oE 'electron@npm:[0-9.]+' "$(_get_project_dir)/yarn.lock" 2>/dev/null | head -1 | sed 's/^electron@npm://')
	[[ -z "$_v" ]] && _v=$(jq -r '.packages["node_modules/electron"].version // empty' "$(_get_project_dir)/package-lock.json" 2>/dev/null | head -1)
	[[ -z "$_v" ]] && _v=$(grep -oE 'electron: ?\[?"?npm:?[0-9.]+' "$(_get_project_dir)/bun.lock" 2>/dev/null | grep -oE '[0-9.]+' | head -1)
	[[ -z "$_v" ]] && return 1
	_v="${_v%%.*}"
	(( ${_v} == _electronversion )) && echo -e "\033[1;32mElectron version: ${_v}\033[0m" || echo -e "\033[1;31mElectron version: ${_v} (expected ${_electronversion})\033[0m"
}
_set_electron_build_env() {
	export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
	export ELECTRON_OVERRIDE_DIST_PATH="${ELECTRON_DIST}"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export ELECTRON_BUILDER_OFFLINE=true
	export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/^v//')"
}
_set_pnpm_build_env() {
	export HOME="${srcdir}/.home"
	export XDG_CACHE_HOME="${HOME}/.cache"
	export XDG_CONFIG_HOME="${HOME}/.config"
	export XDG_DATA_HOME="${HOME}/.local/share"
	export XDG_STATE_HOME="${HOME}/.local/state"
	export PNPM_HOME="${HOME}/.pnpm/bin"
	export pnpm_config_cache_dir="${HOME}/.pnpm_cache"
	export pnpm_config_store_dir="${HOME}/.pnpm_store"
	export pnpm_config_global_dir="${HOME}/.pnpm/global"
	export pnpm_config_state_dir="${HOME}/.pnpm/state"
	export pnpm_config_node_linker=hoisted
	export pnpm_config_minimum_release_age=0
	export pnpm_config_update_notifier=false
	export COREPACK_NPM_REGISTRY="${COREPACK_NPM_REGISTRY:-${NPM_CONFIG_REGISTRY:-https://registry.npmjs.org}}"
	export COREPACK_HOME="${HOME}/.corepack"
	mkdir -p "${HOME}" "${PNPM_HOME}" "${pnpm_config_cache_dir}" "${pnpm_config_store_dir}" "${pnpm_config_global_dir}" "${pnpm_config_state_dir}" "${COREPACK_HOME}"
	export PATH="${PNPM_HOME}:${PATH}"
	local _detected=""
	local _pkgjson="$(_get_project_dir)/package.json"
	if [ -f "${_pkgjson}" ]; then
		_detected="$(grep -o '"packageManager"[^,]*' "${_pkgjson}" 2>/dev/null | grep -oE 'pnpm@[^"+]+' | head -n1 | sed 's/^pnpm@//')"
		if [ -z "${_detected}" ]; then
			_detected="$(grep -oE '"pnpm"[[:space:]]*:[[:space:]]*"[^"]+"' "${_pkgjson}" 2>/dev/null | grep -oE '[0-9][0-9.]*' | head -n1)"
		fi
	fi
	local _ver="${_pnpmver:-${_detected}}"
	if [ -n "${_ver}" ]; then
		npm install -g "pnpm@${_ver}" --prefix "${HOME}/.pnpm" \
			--registry "${COREPACK_NPM_REGISTRY}"
	fi
}
prepare() {
    cd "$(_get_project_dir)"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
    " "${srcdir}/${pkgname}.sh" "${srcdir}/${pkgname}.js"
    sed -i "s/mkdir tmp/mkdir tmp \&\& cp ..\/..\/..\/.npmrc tmp/g" tools/fix-other.sh
    _ensure_local_nvm
    _set_electron_build_env
    _set_pnpm_build_env
    jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' conf/build.json > conf/build.json.tmp && mv conf/build.json.tmp conf/build.json
    export NODE_ENV=development
    pnpm install
}
build() {
    cd "$(_get_project_dir)"
    _ensure_local_nvm
    _set_electron_build_env
    _set_pnpm_build_env
    sed -i '/一次版本校验/,/^fi$/d' tools/update-bilibili.sh
    sh tools/update-bilibili.sh
    sh tools/fix-other.sh
    sh tools/extension.sh
    mv tmp/bili/resources/* app
    find "$(_get_project_dir)/app" -type d \( -name "*win32*" -o -name "*darwin*" \) -exec rm -rf {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.js" -t "${pkgdir}/usr/lib/${pkgname}"
	cp -a "$(_get_project_dir)/app/." "${pkgdir}/usr/lib/${pkgname}/"
    install -Dm644 "$(_get_project_dir)/res/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "$(_get_project_dir)/res/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644 "$(_get_project_dir)/license" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
