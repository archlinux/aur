# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=vnite-git
_pkgname=Vnite
pkgver=4.14.0.r0.g36df84c
_electronversion=35
_nodeversion=22
pkgrel=1
pkgdesc="A unified platform to organize your game collection, track gameplay, with real-time cloud sync across devices and detailed gameplay reports."
arch=('x86_64')
url="https://vnite.ximu.dev/"
_ghurl="https://github.com/ximu3/vnite"
license=('GPL-3.0-only')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'pnpm'
    'git'
    'nvm'
    'gendesk'
    'jq'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'cebedc3391cbab6d43f37fbf3a87ddaad16597cb5ea487a4d55b1f478d810082')

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
	find "${srcdir}" -type f -name "resources.pak" ! -path "*/node_modules/*" -print 2>/dev/null | while read f; do [ -d "${f%/*}/resources" ] && echo "${f%/*}" && break; done
}

_get_electron_version() {
	_elec_ver=$(find "$(_get_project_dir)" -name "package.json" ! -path "*/node_modules/*" -print \
		| xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null \
		| grep -oE '[0-9]+' | head -1)
	[[ -z "${_elec_ver}" ]] && return 1
	(( _elec_ver == _electronversion )) && c=32 || c=31
	echo -e "Electron version: \033[1;${c}m${_elec_ver}$([[ $c -eq 31 ]] && echo " (expected ${_electronversion})")\033[0m"
}

_set_build_env() {
	export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
	export ELECTRON_OVERRIDE_DIST_PATH="${ELECTRON_DIST}"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export ELECTRON_BUILDER_OFFLINE=true
	export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/^v//')"
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
    export CARGO_HOME="${HOME}/.cargo"
	export CARGO_NET_GIT_FETCH_WITH_CLI=true
	export CARGO_NET_RETRY=5
	export CARGO_HTTP_MULTIPLEXING=false
	export CARGO_INCREMENTAL=0
	export CARGO_TERM_COLOR=never
	export CARGO_PROFILE_RELEASE_STRIP=symbols
	mkdir -p "${HOME}" "${CARGO_HOME}" "${PNPM_HOME}" "${pnpm_config_cache_dir}" "${pnpm_config_store_dir}" "${pnpm_config_global_dir}" "${pnpm_config_state_dir}" "${COREPACK_HOME}"
	export PATH="${PNPM_HOME}:${PATH}"
	local _pnpmver=""
	local _pkgjson="$(_get_project_dir)/package.json"
	if [ -f "${_pkgjson}" ]; then
		_pnpmver="$(grep -o '"packageManager"[^,]*' "${_pkgjson}" 2>/dev/null | grep -oE 'pnpm@[^"+]+' | head -n1 | sed 's/^pnpm@//')"
		if [ -z "${_pnpmver}" ]; then
			_pnpmver="$(grep -oE '"pnpm"[[:space:]]*:[[:space:]]*"[^"]+"' "${_pkgjson}" 2>/dev/null | grep -oE '[0-9][0-9.]*' | head -n1)"
		fi
	fi
	if [ -n "${_pnpmver}" ]; then
		npm install -g "pnpm@${_pnpmver}" --prefix "${HOME}/.pnpm" \
			--registry "${COREPACK_NPM_REGISTRY}"
	fi
}
# Generate Linux stub files for Windows-specific native module
_generate_linux_stubs() {
    mkdir -p native/dist
    # Create TypeScript definitions
    cat > native/dist/index.d.ts << 'EOF'
export enum ProcessEventType {
  Creation = 0,
  Termination = 1
}

export interface ProcessEvent {
  eventType: ProcessEventType
  fullPath: string
  pid: number
  id: string
}

export interface ProcessInfo {
  pid: number
  fullPath: string
}

export function initLogger(
  infoCallback: (err: Error | null, msg: string) => void,
  errorCallback: (err: Error | null, msg: string) => void
): Promise<void>
export function stopLogger(): void
export function startMonitoring(localGamePathes: string[], localGameIds: string[], callback?: (err: Error | null, arg: ProcessEvent) => void): Promise<void>
export function stopMonitoring(): Promise<void>
export function addKnownGame(path: string, id: string): Promise<void>
export function removeKnownGameById(gameId: string, preserveRunningProcess?: boolean): Promise<void>
export function replaceKnownGames(localGamePathes: string[], localGameIds: string[]): Promise<void>
export function isRunning(path: string, isFolder?: boolean): Promise<boolean>
export function manualUpdateProcessStatus(): Promise<void>
export function installForegroundHook(callback?: (err: Error | null, arg: string) => void, waitTime?: number): Promise<void>
export function uninstallForegroundHook(): Promise<void>
export function setForegroundWaitTime(waitTime: number): void
export function getAllProcess(): ProcessInfo[]
export function isElevatedPrivilege(): boolean
export function extractExecutableIcon(path: string): Promise<Buffer>
export function sendSystemNotification(appId: string, title?: string, line1?: string, line2?: string, imagePath?: string, silent?: boolean): void
EOF

    # Create JavaScript stub implementation
    cat > native/dist/index.js << 'EOF'
const ProcessEventType = { Creation: 0, Termination: 1 }
async function initLogger(infoCallback, errorCallback) { console.log('[Linux] initLogger not supported') }
function stopLogger() { console.log('[Linux] stopLogger not supported') }
async function startMonitoring() { console.log('[Linux] startMonitoring not supported') }
async function stopMonitoring() { console.log('[Linux] stopMonitoring not supported') }
async function addKnownGame() { console.log('[Linux] addKnownGame not supported') }
async function removeKnownGameById() { console.log('[Linux] removeKnownGameById not supported') }
async function replaceKnownGames() { console.log('[Linux] replaceKnownGames not supported') }
async function isRunning() { return false }
async function manualUpdateProcessStatus() { console.log('[Linux] manualUpdateProcessStatus not supported') }
async function installForegroundHook() { console.log('[Linux] installForegroundHook not supported') }
async function uninstallForegroundHook() { console.log('[Linux] uninstallForegroundHook not supported') }
function setForegroundWaitTime() { console.log('[Linux] setForegroundWaitTime not supported') }
function getAllProcess() { return [] }
function isElevatedPrivilege() { return false }
async function extractExecutableIcon() { throw new Error('Not supported on Linux') }
function sendSystemNotification() { console.log('[Linux] sendSystemNotification not supported') }
module.exports = { ProcessEventType, initLogger, stopLogger, startMonitoring, stopMonitoring, addKnownGame, removeKnownGameById, replaceKnownGames, isRunning, manualUpdateProcessStatus, installForegroundHook, uninstallForegroundHook, setForegroundWaitTime, getAllProcess, isElevatedPrivilege, extractExecutableIcon, sendSystemNotification }
EOF
}
prepare() {
    cd "$(_get_project_dir)"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
    " "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Game" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    _ensure_local_nvm
    _set_build_env
    jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' package.json > package.json.tmp && mv package.json.tmp package.json
    _generate_linux_stubs
    sed -i 's/null,/undefined,/g' src/main/features/system/services/screenshot.ts
    sed -i 's/"prebuild": "pnpm run build:native"/"prebuild": "echo Skipping native build on Linux"/' package.json
    export NODE_ENV=development
    pnpm install
}
build() {
    cd "$(_get_project_dir)"
    _ensure_local_nvm
    _set_build_env
    chmod +x node_modules/electron-vite/bin/electron-vite.js
    export NODE_ENV=production
    pnpm run build
    pnpm -c exec "electron-builder --linux dir -c.electronDist=${ELECTRON_DIST} --config electron-builder.yml"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	local _app_dir="$(_get_app_dir)"
	rm -rf "${_app_dir}/resources/default_app.asar"
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
    local _src="$(_get_project_dir)"
    install -Dm644 "${_src}/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${_src}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${_src}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}