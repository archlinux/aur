# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=ai-browser-git
_pkgname=AI-Browser
pkgver=1.7.0.r4.g8ae4c8a
_electronversion=44
_nodeversion=24
pkgrel=1
pkgdesc='Client app for ChatGPT, Gemini, Claude, Phind, Perplexity, Genspark and Google AI Studio with Monaco Editor integration.'
arch=('any')
url="https://jun-murakami.web.app/apps/ai-browser"
_ghurl="https://github.com/Jun-Murakami/AI-Browser"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'bun'
    'git'
    'nvm'
    'gendesk'
    'jq'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'bd5358d8f323d3c2c2f0733364ee4ea55f551dd86ba0be2a76846210b60897fc')
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
	find "${srcdir}" -type d -name "node_modules" -prune -o -type f -name "resources.pak" -print0 | xargs -0 dirname | head -n 1
}
_get_electron_version() {
	_elec_ver=$(find "$(_get_project_dir)" -name "package.json" ! -path "*/node_modules/*" -print \
		| xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null \
		| grep -v '^$' | sed 's/^[^0-9]*//' | head -1)
	[[ -z "${_elec_ver}" ]] && return 1
	echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
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
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-git}/g
    " "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    _ensure_local_nvm
    _set_build_env
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    # Fix electron-vite deepClone error: remove plugins that contain non-plain objects
    python3 << 'PYEOF'
import re

with open('electron.vite.config.ts', 'r') as f:
    content = f.read()

# Remove reactDevtoolsUrl constant
content = re.sub(r"const reactDevtoolsUrl = 'http://localhost:8097';\n", '', content)

# Remove reactDevtoolsHtmlPlugin function (from 'function' to the closing '}' at start of line)
content = re.sub(r'function reactDevtoolsHtmlPlugin\(.*?\n\}\n', '', content, flags=re.DOTALL)

# Remove reactDevtoolsHtmlPlugin(isDevServer) from plugins array
content = re.sub(r'\s*reactDevtoolsHtmlPlugin\(isDevServer\),?', '', content)

# Remove babelPlugin import
content = re.sub(r"import babelPlugin from '@rolldown/plugin-babel';\n", '', content)

# Remove babelPlugin usage (entire line including comma)
content = re.sub(r'        babelPlugin\(\{[^}]+\}\),\n', '', content)

# Fix react import - remove reactCompilerPreset
content = content.replace('import react, { reactCompilerPreset }', 'import react')

# Remove Plugin type import
content = re.sub(r"import type \{ Plugin \} from 'vite';\n", '', content)

# Remove isDevServer variable
content = re.sub(r"\s*const isDevServer = command === 'serve';", '', content)

# Fix unused command parameter warning - remove the parameter since it's no longer used
content = content.replace('export default defineConfig(({ command }) => {', 'export default defineConfig(() => {')

# Fix TypeScript type errors: add 'as const' to output properties
content = content.replace("format: 'cjs',", "format: 'cjs' as const,")
content = content.replace("entryFileNames: 'index.cjs',", "entryFileNames: 'index.cjs' as const,")

with open('electron.vite.config.ts', 'w') as f:
    f.write(content)

print("Done")
PYEOF
    export NODE_ENV=development
    bun install
}
build() {
    cd "$(_get_project_dir)"
    _ensure_local_nvm
    _set_build_env
    export NODE_ENV=production
    export NODE_OPTIONS="--max-old-space-size=4096"
    bun run build
    bunx electron-builder --linux dir -c.electronDist="${ELECTRON_DIST}" --config electron-builder.yml
    local _app_dir="$(_get_app_dir)"
    rm -rf "${_app_dir}/resources/default_app.asar"
    case "${CARCH}" in
		aarch64)	_archrem=x64	;;
		x86_64)		_archrem=arm	;;
	esac
	find "${_app_dir}/resources/app.asar.unpacked" -type d \
		\( -name "darwin*" -o -name "win32*" -o -name "*${_archrem}"* \) \
		-exec rm -rf {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	local _app_dir="$(_get_app_dir)"
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
    local _src="$(_get_project_dir)"
    install -Dm644 "${_src}/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${_src}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${_src}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
