# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=deepchat-git
_pkgname=DeepChat
pkgver=1.1.2.r0.g0748902
_electronversion=43
_nodeversion=24
pkgrel=1
pkgdesc="A smart assistant that connects powerful AI to your personal world."
arch=('any')
url="https://deepchat.thinkinai.xyz/"
_ghurl="https://github.com/ThinkInAIXYZ/deepchat"
license=('Apache-2.0')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
depends=(
    "electron${_electronversion}"
    'python'
    'python-defusedxml'
    'python-pillow'
    'python-yaml'
    'python-lxml'
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'curl'
    'gendesk'
    'jq'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_get_app_dir() {
	find "${srcdir}" -type d -name "node_modules" -prune -o -type f -name "resources.pak" -print0 | xargs -0 dirname | head -n 1
}
_set_build_env() {
	export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
	export ELECTRON_OVERRIDE_DIST_PATH="${ELECTRON_DIST}"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/^v//')"
	export HOME="${srcdir}/.electron-gyp"
	export XDG_CACHE_HOME="${srcdir}/.cache"
	export XDG_CONFIG_HOME="${srcdir}/.config"
	export XDG_DATA_HOME="${srcdir}/.local/share"
	export XDG_STATE_HOME="${srcdir}/.local/state"
	export PNPM_HOME="${srcdir}/.pnpm/bin"
	export pnpm_config_cache_dir="${srcdir}/.pnpm_cache"
	export pnpm_config_store_dir="${srcdir}/.pnpm_store"
	export pnpm_config_global_dir="${srcdir}/.pnpm/global"
	export pnpm_config_state_dir="${srcdir}/.pnpm/state"
	export pnpm_config_node_linker=hoisted
	export pnpm_config_minimum_release_age=0
	export pnpm_config_update_notifier=false
	mkdir -p "${HOME}" "${PNPM_HOME}" "${pnpm_config_cache_dir}" "${pnpm_config_store_dir}" "${pnpm_config_global_dir}" "${pnpm_config_state_dir}"
	export PATH="${PNPM_HOME}:${PATH}"
	local _pnpmver="${_pnpmversion}"
	if [[ -z "${_pnpmver}" ]]; then
		_pnpmver="$(node -p "const pm=require('./package.json').packageManager; pm && pm.startsWith('pnpm@') ? pm.split('@')[1] : ''" 2>/dev/null)"
	fi
	if [[ -n "${_pnpmver}" ]]; then
		export COREPACK_HOME="${srcdir}/.corepack"
		install -dm755 "${srcdir}/.bin"
		if command -v corepack &>/dev/null; then
			corepack enable --install-directory "${srcdir}/.bin"
			export PATH="${srcdir}/.bin:${PATH}"
			corepack prepare "pnpm@${_pnpmver}" --activate
		else
			npm install -g "pnpm@${_pnpmver}" --prefix "${pnpm_config_global_dir}"
			export PATH="${pnpm_config_global_dir}/bin:${PATH}"
		fi
	fi
}
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_electron_version() {
    _elec_ver=$(find "${srcdir}" -maxdepth 5 -name "package.json" ! -path "*/node_modules/*" \
        -exec grep -l '"electron"' {} + | xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null | head -1)
    [[ -z "${_elec_ver}" ]] && return 1
    echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname//-/.}"
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
    find src -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-git}\'/g" {} +
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    cp .env.example .env
    export NODE_ENV=development
    pnpm install --ignore-scripts
    pnpm run install:sharp
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    _ensure_local_nvm
    _set_build_env
    local _eb_arch
    case "${CARCH}" in
        aarch64) 
            _eb_arch="arm64"
            _armrem="x64"
            ;;
        x86_64)
            _eb_arch="x64"
            _armrem="arm"
            ;;
    esac
    export NODE_ENV=production
    # Fix TypeScript error: unreachable ?? operand
    sed -i "s/deps.resourcesPath ?? '\/usr\/lib\/deepchat' ?? ''/deps.resourcesPath ?? '\/usr\/lib\/deepchat'/" src/main/plugin/index.ts
    pnpm run build
    pnpm -c exec "electron-builder --linux dir --${_eb_arch} -c.electronDist=${ELECTRON_DIST} --config=electron-builder.yml"
    local _app_dir=$(_get_app_dir)
    find "${_app_dir}/resources" -type d \( \
        -name "*darwin*" -o \
        -name "*win32*" \
        -name "*${_armrem}*" \
    \) -exec rm -rf {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
    local _app_dir=$(_get_app_dir)
    cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
    rm -rf "${pkgdir}/usr/lib/${pkgname%-git}/default_app.asar"
    install -Dm644 "${srcdir}/${pkgname//-/.}/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/README.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}