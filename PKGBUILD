# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cherry-studio-git
_pkgname="Cherry Studio"
pkgver=2.0.9.r704.g5a03cf5
_electronversion=44
_nodeversion=24
pkgrel=1
pkgdesc="AI productivity studio with smart chat, autonomous agents, and 300+ assistants. Unified access to frontier LLMs."
arch=('any')
url="https://cherryai.com/"
_ghurl="https://github.com/CherryHQ/cherry-studio"
license=(
    'AGPL-3.0-or-later'
    'LicenseRef-custom'
)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
    'libevdev'
    'python'
    'python-yaml'
    'nodejs'
    'bun'
    'ripgrep'
    'uv'
    'mise'
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'git'
    'pnpm'
    'jq'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}"
    'build-better-sqlite3.sh'
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '4e7aa663647066f2b85226e010de351c9a24f991c6fea6621f2c6b5edd880baa'
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
_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
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
	mkdir -p "${HOME}" "${PNPM_HOME}" "${pnpm_config_cache_dir}" "${pnpm_config_store_dir}" "${pnpm_config_global_dir}" "${pnpm_config_state_dir}" "${COREPACK_HOME}"
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
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_electron_version() {
	_elec_ver=$(find "$(_get_project_dir)" -name "package.json" ! -path "*/node_modules/*" -print \
		| xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null \
		| grep -v '^$' | sed 's/^[^0-9]*//' | head -1)
	[[ -z "${_elec_ver}" ]] && return 1
	echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
prepare() {
    cd "$(_get_project_dir)"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname// /}/g
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
    find src -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-git}\'/g" {} +
    local _arch_name
    case "${CARCH}" in
        x86_64)  _arch_name="x64" ;;
        aarch64) _arch_name="arm64" ;;
    esac
    local _binaries_dir="resources/binaries/linux-${_arch_name}"
    mkdir -p "${_binaries_dir}"
    # Create empty placeholder files (electron-builder needs these to exist during packaging)
    touch "${_binaries_dir}/"{mise,bun,uv,uvx,rg}    
    export NODE_ENV=development
    pnpm install --ignore-scripts
    sed -i '/"postinstall": "node \.\/script\/install"/d' node_modules/onnxruntime-node/package.json
    node -e "const fs=require('fs'); const pkg=JSON.parse(fs.readFileSync('package.json','utf8')); pkg.devDependencies['node-abi']='4.33.0'; fs.writeFileSync('package.json', JSON.stringify(pkg, null, 2)+'\n')"
    pnpm install --ignore-scripts
    pnpm rebuild better-sqlite3 node-pty registry-js selection-hook sharp @napi-rs/canvas @napi-rs/system-ocr tesseract.js koffi esbuild @swc/core electron-winstaller @paymoapp/electron-shutdown-handler @sentry/cli unrs-resolver @j178/prek @deepseek-ai/dsh-subprocess-local
    pnpm --filter @cherrystudio/dsh-bridge build
    pnpm --filter @cherrystudio/remote-protocol build
    pnpm --filter @cherrystudio/remote-transport build
}
build() {
    cd "$(_get_project_dir)"
    _ensure_local_nvm
    _set_build_env  
    export NODE_ENV=production
    pnpm exec dotenv pnpm run build
    pnpm -c exec "electron-builder --linux dir -c.electronDist=${ELECTRON_DIST} --config electron-builder.yml"
    local _app_dir="$(_get_app_dir)"
    find "${_app_dir}/resources" -type d -exec chmod 755 {} +
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
    rm -rf "${pkgdir}/usr/lib/${pkgname%-git}/default_app.asar"
    # Replace placeholder binaries with symlinks to system binaries
    local _arch_name
    case "${CARCH}" in
        aarch64) _arch_name="linux-arm64"   ;;
        x86_64)  _arch_name="linux-x64"     ;;
    esac
    local _binaries_dir="${pkgdir}/usr/lib/${pkgname%-git}/app.asar.unpacked/resources/binaries/${_arch_name}"
    mkdir -p "${_binaries_dir}"
    rm -rf "${_binaries_dir}/"{mise,bun,uv,uvx,rg}
    ln -sf /usr/bin/mise "${_binaries_dir}/mise"
    ln -sf /usr/bin/bun "${_binaries_dir}/bun"
    ln -sf /usr/bin/uv "${_binaries_dir}/uv"
    ln -sf /usr/bin/uvx "${_binaries_dir}/uvx"
    ln -sf /usr/bin/rg "${_binaries_dir}/rg"
    local _src="$(_get_project_dir)"
    install -Dm644 "${_src}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${_src}/build/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${pkgname%-git}.png"
    install -Dm644 "${_src}/LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
