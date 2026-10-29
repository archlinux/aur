# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pupu-git
_pkgname=PuPu
pkgver=0.1.13.r1.g8b4097c
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
    'uv'
    'nodejs'
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
    'gendesk'
    'jq'
    'python312'
)
source=(
    "${pkgname//-/.}::git+${url}.git"
    "unchain::git+https://github.com/haoxiang-xu/unchain.git"
    "${pkgname%-git}.js"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'SKIP'
            '562897be8a17076176f8d985c0d7bc1c685f2e7c9b3a932339ce015963243627'
            '0f4675ddc96a032accf82723c7b6b66007bafd18aa8d919b61e983a68fd25328')
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
_set_npm_build_env() {
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
	mkdir -p "${HOME}" "${npm_config_cache}" "${COREPACK_HOME}"
}
_set_python_pip_build_env() {
	export HOME="${srcdir}/.home"
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
	export PYTHONDONTWRITEBYTECODE=1
	export PYTHONNOUSERSITE=1
	export PYTHONHASHSEED=0
	mkdir -p "${HOME}" "${srcdir}/.pip" "${PIP_CACHE_DIR}"
	: > "${HOME}/.pip/pip.conf"
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
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    _ensure_local_nvm
    _set_npm_build_env
    _set_python_pip_build_env
    sed -i "s/sys.version_info\[:2\] == (3, 12)/sys.version_info[0] == 3 and sys.version_info[1] >= 12/g" unchain_runtime/scripts/build_unchain_server.sh
    sed -i "s/sys.version_info\[:2\] == (3, 12)/sys.version_info[0] == 3 and sys.version_info[1] >= 12/g" scripts/init_python312_venv.sh
    jq --arg ver "${SYSTEM_ELECTRON_VERSION}" '.devDependencies.electron = $ver' package.json > package.json.tmp && mv package.json.tmp package.json
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
    _set_npm_build_env
    _set_python_pip_build_env
    export PUPU_BUILD_VERSION="$(node -p "require('./package.json').version")"
    export UNCHAIN_ARTIFACT_SOURCE_PATH="${srcdir}/unchain"
    rm -rf "$(_get_project_dir)/.venv"
    python3.12 -m venv "$(_get_project_dir)/.venv"
    VENV_PY="$(_get_project_dir)/.venv/bin/python"
    "${VENV_PY}" -m pip install --disable-pip-version-check --retries 5 --timeout 60 --upgrade pip
    "${VENV_PY}" -m pip install --disable-pip-version-check --retries 5 --timeout 60 \
        -r unchain_runtime/server/requirements.txt "pyinstaller==6.22.1"
    export UNCHAIN_BUILD_VENV="$(_get_project_dir)/.venv"
    export NODE_ENV=production
    npm run build:unchain:linux
    npm run build:web
    npm exec -c "electron-builder --linux dir -c.electronDist=${ELECTRON_DIST}"
}

package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.js" -t "${pkgdir}/usr/lib/${pkgname%-git}"
	cp -a "$(_get_app_dir)/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
    _icon_sizes=(192 512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "$(_get_project_dir)/public/logo${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}x${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "$(_get_project_dir)/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "$(_get_project_dir)/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
