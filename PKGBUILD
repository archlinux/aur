# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributer: candroid_man <candroid_man@protonmail.com>
# Contributer: Ada <adadonderr@gmail.com>
# Contributor: Christian Finnberg <christian@finnberg.net>
pkgname=notesnook-git
_pkgname=Notesnook
pkgver=3.4.8.r5.gbf90969
_electronversion=37
_nodeversion=22
pkgrel=1
pkgdesc="A fully open source & end-to-end encrypted note taking alternative to Evernote."
arch=(
    'aarch64'
    'x86_64'
)
url="https://notesnook.com/"
_ghurl="https://github.com/streetwriters/notesnook"
license=('GPL-3.0-or-later')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'nvm'
    'npm'
    'git'
    'zip'
    'curl'
    'yarn'
    'python-setuptools'
    'jq'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.desktop"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'efc8a6cea79ed0203dcbadf17632b5341952a49704f99e3ea0ddc573b06748f4'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g;s/\.android//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
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
	_ev="$(electron${_electronversion} -v)"
	export SYSTEM_ELECTRON_VERSION="${_ev#v}"
	export HOME="${srcdir}/.electron-gyp"
	mkdir -p "${HOME}"
	export XDG_CACHE_HOME="${srcdir}/.cache"
	export XDG_CONFIG_HOME="${srcdir}/.config"
	export XDG_DATA_HOME="${srcdir}/.local/share"
	export npm_config_cache="${srcdir}/.npm_cache"
	export npm_config_maxsockets=32
	export npm_config_audit=false
	export npm_config_fund=false
	export npm_config_progress=false
	export NODE_OPTIONS="--max-old-space-size=4096"
	export npm_config_node_options="--max-old-space-size=4096"
	mkdir -p "${npm_config_cache}"
	local _npmver
	_npmver="$(node -p "const pm=require('./package.json').packageManager; pm && pm.startsWith('npm@') ? pm.split('@')[1] : ''" 2>/dev/null)"
	if [[ -n "${_npmver}" ]]; then
		export COREPACK_HOME="${srcdir}/.corepack"
		install -dm755 "${srcdir}/.bin"
		corepack enable --install-directory "${srcdir}/.bin"
		export PATH="${srcdir}/.bin:${PATH}"
		corepack prepare "npm@${_npmver}" --activate
	fi
}
_get_electron_version() {
    _elec_ver=$(jq -r '.devDependencies["electron"] // .dependencies["electron"]' "${srcdir}/${pkgname//-/.}/apps/desktop/package.json" | tr -d '^')
    _main_ver=$(echo "${_elec_ver}" | cut -d. -f1)
    echo -e "The electron version is: \033[1;31m${_main_ver}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname//-/.}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    _set_build_env
    cd "${srcdir}/${pkgname//-/.}"
    sed -i "s/npm \${/NODE_ENV=development npm \${/g" scripts/bootstrap.mjs
    NODE_ENV=development    npm install --ignore-scripts --prefer-offline --no-audit
    NODE_ENV=development    npm run bootstrap -- --scope=web
    NODE_ENV=development    npm run bootstrap -- --scope=desktop
    NODE_ENV=development    npm install sqlite-better-trigram
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    _ensure_local_nvm
    _set_build_env
    NODE_ENV=production     npm run tx @notesnook/web:build:desktop
    cd "${srcdir}/${pkgname//-/.}/apps/desktop"
    local electronDist="/usr/lib/electron${_electronversion}"
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=production     npm run bundle
    cp -r "${srcdir}/${pkgname//-/.}/apps/web/build" "${srcdir}/${pkgname//-/.}/apps/desktop"
    NODE_ENV=production     npm exec -c "electron-builder --linux dir -c.electronDist=${ELECTRON_DIST} --config=electron-builder.config.js"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname%-git}/"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname//-/.}/apps/desktop/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
}
