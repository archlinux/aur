# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=electerm-git
pkgver=5.3.26.r50.g27fb979
_electronversion=42
_nodeversion=24
pkgrel=1
pkgdesc="📻Free and open-sourced terminal/ssh/sftp/ftp/telnet/serialport/RDP/VNC/Spice client."
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://electerm.html5beta.com/"
_ghurl="https://github.com/electerm/electerm"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
makedepends=(
    'npm'
    'git'
    'nvm'
    'gendesk'
    'python-setuptools'
    'curl'
    'yarn'
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
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
}
_set_build_env() {
	export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
	export ELECTRON_OVERRIDE_DIST_PATH="${ELECTRON_DIST}"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export WORKFLOW_NAME="local-build"
	_ev="$(electron${_electronversion} -v)"
	export SYSTEM_ELECTRON_VERSION="${_ev#v}"
	export HOME="${srcdir}/.electron-gyp"
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
}
_get_electron_version() {
    _elec_ver=$(find "${srcdir}" -name "package.json" -exec jq -r \
        '(.devDependencies.electron // .dependencies.electron) | select(. != null)' \
        {} + 2>/dev/null | head -n 1)
    _elec_ver=$(echo "${_elec_ver}" | sed 's/[^0-9.]//g')
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
        s/@cfgdirname@/${pkgname%-git}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="System" \
        --name="${pkgname%-git}" \
        --exec="${pkgname%-git} %U"
    _set_build_env
    _ensure_local_nvm
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/" package.json
    export NODE_ENV=development
    npm install --legacy-peer-deps
    npm add -D node-gyp --legacy-peer-deps
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    _set_build_env
    _ensure_local_nvm
    export NODE_ENV=production
    npm run clean
    npm run compile
    npm run prepare-file
    npx node build/bin/prepare-electron-build.js
    npm exec -c "electron-builder --linux dir -c.electronDist=${ELECTRON_DIST} --config electron-builder.json"
    local _app_dir=$(_get_app_dir)
    rm -rf \
        "${_app_dir}/resources/default_app.asar" \
        "${_app_dir}/resources/app.asar.unpacked/node_modules/@serialport/bindings-cpp/prebuilds/"{android-*,darwin-*,win32-*} \
        "${_app_dir}/resources/app.asar.unpacked/node_modules/font-list/libs/"{darwin,win32}
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
    local _app_dir=$(_get_app_dir)
    cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname%-git}/"
    install -Dm644 "${srcdir}/${pkgname//-/.}/node_modules/@${pkgname%-git}/${pkgname%-git}-resource/build-res/appx/StoreLogo.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}