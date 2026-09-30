# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pupu-git
_pkgname=PuPu
pkgver=0.1.11.tools.5.r35.g216b0bf
_electronversion=40
_nodeversion=24
pkgrel=1
pkgdesc="A simple and easy to use UI for the Ollama."
arch=('any')
url="https://github.com/haoxiang-xu/PuPu"
license=('MIT')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
depends=(
    "electron${_electronversion}"
    'nodejs'
    'uv'
    'python-urllib3'
    'python-typing_extensions'
    'python-legacy-cgi'
    'python-packaging'
    'python-attrs'
    'python-filelock'
    'python-keyring'
    'python-pip'
    'python-cryptography'
    'libxcrypt-compat'
    'python-requests'
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
    "${pkgname//-/.}::git+${url}.git"
    "unchain::git+https://github.com/haoxiang-xu/unchain.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'SKIP'
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
	export npm_config_cache="${HOME}/.npm_cache"
	export COREPACK_NPM_REGISTRY="${COREPACK_NPM_REGISTRY:-${NPM_CONFIG_REGISTRY:-https://registry.npmjs.org}}"
	export COREPACK_HOME="${HOME}/.corepack"
	export npm_config_audit=false
	export npm_config_registry="${NPM_CONFIG_REGISTRY:-${npm_config_registry:-https://registry.npmjs.org}}"
    export XDG_CACHE_HOME="${HOME}/.cache"
	export XDG_CONFIG_HOME="${HOME}/.config"
	export XDG_DATA_HOME="${HOME}/.local/share"
	export XDG_STATE_HOME="${HOME}/.local/state"
	export PIP_CONFIG_FILE="${HOME}/.pip/pip.conf"
	export PIP_CACHE_DIR="${HOME}/.pip/cache"
	export PIP_DISABLE_PIP_VERSION_CHECK=1
	export PIP_NO_INPUT=1
	export PIP_NO_COLOR=1
	export PIP_USER=0
	export PIP_ROOT_USER_ACTION=ignore
	export POETRY_CACHE_DIR="${HOME}/.poetry/cache"
	export POETRY_CONFIG_DIR="${HOME}/.poetry/config"
	export POETRY_DATA_DIR="${HOME}/.poetry/data"
	export POETRY_VIRTUALENVS_IN_PROJECT=true
	export POETRY_VIRTUALENVS_PATH="${HOME}/.venvs"
	export POETRY_CHECK_FOR_UPDATES=false
	export PYTHONDONTWRITEBYTECODE=1
	export PYTHONNOUSERSITE=1
	export PYTHONHASHSEED=0
	mkdir -p "${HOME}" "${npm_config_cache}" "${COREPACK_HOME}" "${srcdir}/.pip" "${PIP_CACHE_DIR}" "${POETRY_CACHE_DIR}" "${POETRY_CONFIG_DIR}" "${POETRY_DATA_DIR}"
    : > "${HOME}/.pip/pip.conf"
}
_get_app_dir() {
	find "$(_get_project_dir)" -type d -name "node_modules" -prune -o -type f -name "resources.pak" -print0 | xargs -0 dirname | head -n 1
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
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-git}/g
    " -i "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    _ensure_local_nvm
    _set_build_env
    sed -i "s/sys.version_info\[:2\] == (3, 12)/sys.version_info[0] == 3 and sys.version_info[1] >= 12/g" unchain_runtime/scripts/build_unchain_server.sh
    sed -i "s/sys.version_info\[:2\] == (3, 12)/sys.version_info[0] == 3 and sys.version_info[1] >= 12/g" scripts/init_python312_venv.sh
    find src -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-git}\'/g" {} +
    sed -i '/"devDependencies":/{:a;N;/^[[:space:]]*}/!ba;s/"electron": "[^"]*"/"electron": "'${SYSTEM_ELECTRON_VERSION}'"/}' package.json
    rm -rf package-lock.json
    # Skip macOS-specific postinstall script on Linux
    sed -i 's|"postinstall": "node scripts/release-qa/patch-macos-keychain.cjs"|"postinstall": "echo Skipping macOS-specific patches on Linux"|' package.json
    # Fix broken progress package (lib directory is empty)
    sed -i 's/"overrides": {/"overrides": {\n    "progress": "2.0.3",/' package.json
    export NODE_ENV=development
    npm install --legacy-peer-deps
}
build() {
    cd "$(_get_project_dir)"
    _ensure_local_nvm
    _set_build_env
    export PUPU_BUILD_VERSION="$(node -p "require('./package.json').version")"
    export UNCHAIN_SOURCE_PATH="$(_get_project_dir)/unchain"
    rm -rf "$(_get_project_dir)/.venv"
    python3.12 -m venv "$(_get_project_dir)/.venv"
    source "$(_get_project_dir)/.venv/bin/activate"
    python -m pip install --upgrade pip
    python -m pip install -r unchain_runtime/server/requirements.txt -e ../unchain pyinstaller
    export UNCHAIN_BUILD_VENV="$(_get_project_dir)/.venv"
    export UNCHAIN_BUILD_SKIP_INSTALL=1
    export NODE_ENV=production
    npm run build:unchain:linux
    npm run build:web
    npm exec -c "electron-builder --linux dir -c.electronDist=${ELECTRON_DIST}"
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	local _app_dir="$(_get_app_dir)"
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
    local _src="$(_get_project_dir)"
    _icon_sizes=(192 512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${_src}/public/logo${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${_src}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${_src}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
