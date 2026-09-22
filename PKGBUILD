# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Zaoqi
pkgname=electerm
pkgver=5.5.25
_electronversion=42
_nodeversion=24
pkgrel=1
pkgdesc="Free and open-sourced terminal/ssh/sftp/ftp/telnet/serialport/RDP/VNC/Spice client."
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://electerm.org/"
_ghurl="https://github.com/electerm/electerm"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'python'
    'nodejs'
)
makedepends=(
    'npm'
    'nvm'
    'gendesk'
    'python-setuptools'
    'curl'
    'git'
    'jq'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('1be1584f50553ca7d6d6eb9449b361969c4220ecd8a9f05107fb8f3852952746'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
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
	mkdir -p "${HOME}" "${npm_config_cache}" "${COREPACK_HOME}"
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
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="System" \
        --name="${pkgname}" \
        --exec="${pkgname} %U"
    _ensure_local_nvm
    _set_build_env
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    export NODE_ENV=development
    npm install --legacy-peer-deps
    npm add -D node-gyp --legacy-peer-deps
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _ensure_local_nvm
    _set_build_env
    export NODE_ENV=production
    npm run clean
    npm run compile
    npm run prepare-file
    WORKFLOW_NAME=linux-pkgbuild npm exec -c "electron-builder --linux dir -c.electronDist=${ELECTRON_DIST} --config build/electron-builder.json"
    local _app_dir=$(_get_app_dir)
    rm -rf \
        "${_app_dir}/resources/app.asar.unpacked/node_modules/@serialport/bindings-cpp/prebuilds/"{android-*,darwin-*,win32-*} \
        "${_app_dir}/resources/app.asar.unpacked/node_modules/font-list/libs/"{darwin,win32} \
        "${_app_dir}/resources/app.asar.unpacked/node_modules/note-pty/prebuilds/"{darwin-*,win32-*}
    case "${CARCH}" in
        aarch64)
            rm -rf \
                "${_app_dir}/resources/app.asar.unpacked/node_modules/@serialport/bindings-cpp/prebuilds/"{linux-arm,linux-x64} \
                "${_app_dir}/resources/app.asar.unpacked/node_modules/note-pty/prebuilds/linux-x64"
            ;;
        armv7h)
            rm -rf \
                "${_app_dir}/resources/app.asar.unpacked/node_modules/@serialport/bindings-cpp/prebuilds/"{linux-arm64,linux-x64}
            ;;
        x86_64)
            rm -rf \
                "${_app_dir}/resources/app.asar.unpacked/node_modules/@serialport/bindings-cpp/prebuilds/"linux-arm* \
                "${_app_dir}/resources/app.asar.unpacked/node_modules/note-pty/prebuilds/linux-arm64"
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    local _app_dir=$(_get_app_dir)
    cp -a "${_app_dir}/resources/." "${pkgdir}/usr/lib/${pkgname}/"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/node_modules/@${pkgname}/${pkgname}-resource/build-res/appx/StoreLogo.png" \
        "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}