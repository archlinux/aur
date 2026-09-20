# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=bilibili
_pkgver=1.19.0
_subver=1
pkgver="${_pkgver}_${_subver}"
_electronversion=43
_nodeversion=22
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
    'curl'
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
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${_pkgver}-${_subver}"
    "${pkgname}.sh"
)
sha256sums=('f74ff78054f34342b2073139793915ffdaf7378fd60e4e4b492e0a5b18d85d08'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_app_dir() {
	find "${srcdir}" -type d -name "node_modules" -prune -o -type f -name "resources.pak" -print0 | xargs -0 dirname | head -n 1
}
_set_build_env() {
	export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
	export ELECTRON_OVERRIDE_DIST_PATH="${ELECTRON_DIST}"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	_ev="$(electron${_electronversion} -v)"
	export SYSTEM_ELECTRON_VERSION="${_ev#v}"
	export HOME="${srcdir}/.electron-gyp"
	mkdir -p "${HOME}"
	export XDG_CACHE_HOME="${srcdir}/.cache"
	export XDG_CONFIG_HOME="${srcdir}/.config"
	export XDG_DATA_HOME="${srcdir}/.local/share"
	export XDG_STATE_HOME="${srcdir}/.local/state"
	export PNPM_HOME="${srcdir}/.pnpm/bin"
	export PNPM_GLOBAL_DIR="${srcdir}/.pnpm/global"
	export PNPM_STATE_DIR="${srcdir}/.pnpm/state"
	export PNPM_MINIMUM_RELEASE_AGE=0
	export PNPM_NODE_LINKER=hoisted
	export PNPM_FETCH_RETRIES=3
	export PNPM_FETCH_RETRY_MAXTIMEOUT=10000
	export PNPM_UPDATE_NOTIFIER=false
	export PNPM_NO_COLOR=true
	export PNPM_NO_PROGRESS=true
	export pnpm_config_platform=linux
	export pnpm_config_arch="${CARCH}"
	export NODE_OPTIONS="--max-old-space-size=4096"
	export npm_config_node_options="--max-old-space-size=4096"
	mkdir -p "${PNPM_CACHE_DIR}" "${PNPM_STORE_DIR}" "${PNPM_GLOBAL_DIR}" "${PNPM_HOME}" "${PNPM_STATE_DIR}"
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
			npm install -g "pnpm@${_pnpmver}" --prefix "${PNPM_GLOBAL_DIR}"
			export PATH="${PNPM_GLOBAL_DIR}/bin:${PATH}"
		fi
	fi
}
_get_electron_version() {
    _elec_ver=$(find "${srcdir}" -maxdepth 5 -name "package.json" ! -path "*/node_modules/*" \
        -exec grep -l '"electron"' {} + | xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null | head -1)
    [[ -z "${_elec_ver}" ]] && return 1
    echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname}/g
    " "${srcdir}/${pkgname}.sh"
    sed -i "s/mkdir tmp/mkdir tmp \&\& cp ..\/..\/..\/.npmrc tmp/g" tools/fix-other.sh
    _ensure_local_nvm
    _set_build_env
    sed -i "s/\"electronVersion\": \"[^\"]*\"/\"electronVersion\": \"${SYSTEM_ELECTRON_VERSION}\"/g" conf/build.json
    NODE_ENV=development    pnpm install
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _ensure_local_nvm
    _set_build_env
    sed -i '/一次版本校验/,/^fi$/d' tools/update-bilibili.sh
    sh tools/update-bilibili.sh
    sh tools/fix-other.sh
    sh tools/extension.sh
    mv tmp/bili/resources/* app
    find "${srcdir}/${pkgname}-${pkgver}/app" -type d \( -name "*win32*" -o -name "*darwin*" \) -exec rm -rf {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
	cp -a "${srcdir}/${pkgname}-${pkgver}/app/." "${pkgdir}/usr/lib/${pkgname}/"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/res/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/res/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname}.png"
    done
    install -Dm644  "${srcdir}/${pkgname}-${pkgver}/license" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
