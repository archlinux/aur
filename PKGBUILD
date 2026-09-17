# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rocketchat-desktop-git
_pkgname=Rocket.Chat
pkgver=4.17.0.alpha.3.r7.g99d7373
_electronversion=42
_nodeversion=24
pkgrel=1
pkgdesc="The Ultimate Open Source WebChat Platform."
arch=('any')
url="https://rocket.chat/"
_ghurl="https://github.com/RocketChat/Rocket.Chat.Electron"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'git'
    'curl'
    'yarn'
    'jq'
    'patch'
)
optdepends=(
    'libnotify: For sending desktop notifications'
    'libindicator-gtk3: For the system tray icon'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}"
    "${pkgname%-git}-rollup.patch"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '1c186ddc7dc31bf46c92c58e235f2d5b99ef309b0b81663e38778ef397bdd41a'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
    export PATH="$(nvm which "${_nodeversion}" | xargs dirname):${PATH}"
}
_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
}
_set_build_env() {
	export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
	export ELECTRON_OVERRIDE_DIST_PATH="${ELECTRON_DIST}"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	_ev="$(electron${_electronversion} -v)"
	export SYSTEM_ELECTRON_VERSION="${_ev#v}"
	export HOME="${srcdir}/.electron-gyp"
	export XDG_CACHE_HOME="${srcdir}/.cache"
	export XDG_CONFIG_HOME="${srcdir}/.config"
	export XDG_DATA_HOME="${srcdir}/.local/share"
	export XDG_STATE_HOME="${srcdir}/.local/state"
	export YARN_ENABLE_GLOBAL_CACHE=false
	export YARN_ENABLE_MIRROR=false
	export YARN_CACHE_FOLDER="${srcdir}/.yarn/cache"
	export YARN_GLOBAL_FOLDER="${srcdir}/.yarn/berry"
	export YARN_NODE_LINKER=node-modules
	export YARN_NM_MODE=hardlinks-local
	export YARN_ENABLE_TELEMETRY=false
	export YARN_ENABLE_SCRIPTS=true
	export YARN_ENABLE_IMMUTABLE_INSTALLS=false
	export YARN_ENABLE_PROGRESS_BARS=false
	export YARN_ENABLE_COLORS=false
	export YARN_NETWORK_CONCURRENCY=32
	export YARN_HTTP_TIMEOUT=600000
	export YARN_HTTP_RETRY=5
	export npm_config_platform=linux
	export npm_config_arch="${CARCH}"
	export NODE_OPTIONS="--max-old-space-size=4096"
	export COREPACK_HOME="${srcdir}/.corepack"
	mkdir -p "${HOME}" "${YARN_CACHE_FOLDER}" "${YARN_GLOBAL_FOLDER}"
}
_use_new_yarn() {
	local _yarnver
	_yarnver="$(node -p "require('./package.json').packageManager?.split('@')[1] || ''")"
	if [[ -z "${_yarnver}" ]]; then
		error "package.json 中未找到 packageManager 字段（应形如 \"yarn@4.x\"）"
		return 1
	fi
	export COREPACK_HOME="${srcdir}/.corepack"
	install -dm755 "${srcdir}/.bin"
	corepack enable --install-directory "${srcdir}/.bin"
	corepack prepare "yarn@${_yarnver}" --activate
}
_get_electron_version() {
    _elec_ver=$(find "${srcdir}" -maxdepth 5 -name "package.json" ! -path "*/node_modules/*" \
        -exec grep -l '"electron"' {} + | xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null | head -1)
    [[ -z "${_elec_ver}" ]] && return 1
    echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname%-git}.git"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Network" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    _set_build_env
    _ensure_local_nvm
    patch -Np1 -i "${srcdir}/${pkgname%-git}-rollup.patch"
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    _use_new_yarn
    yarn config set --home enableTelemetry 0
    NODE_ENV=development    yarn install
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    _set_build_env
    _ensure_local_nvm
    NODE_ENV=production     yarn run build
    NODE_ENV=production     yarn electron-builder --linux dir -c.electronDist="${ELECTRON_DIST}" --config electron-builder.json
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1)
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname%-git}.git/build/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
