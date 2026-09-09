# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hydrogen-music
_pkgname=Hydrogen-Music
pkgver=0.6.3
_electronversion=38
_nodeversion=22
pkgrel=1
pkgdesc="Arknights-style third-party NetEase Cloud Music player built with Electron and Vue 3."
arch=('x86_64')
url="https://github.com/ldx123000/Hydrogen-Music"
license=('MIT')
depends=(
    "electron${_electronversion}"
    'ffmpeg'
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'curl'
    'yarn'
    'jq'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('61a97966def56f043536fd2875c55ffac0b303576fce7608ee69ed4a768376c3'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_set_build_env() {
	export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
    export ELECTRON_OVERRIDE_DIST_PATH="${electronDist}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export HOME="${srcdir}/.electron-gyp"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export BUN_CONFIG_REGISTRY="https://registry.npmmirror.com"
        export npm_config_registry="https://registry.npmmirror.com"
        export BUN_INSTALL_DISABLE_DEFAULT_REGISTRY_FALLBACK=1
        export npm_config_nodejs_org_mirror="https://npmmirror.com/mirrors/node"
        export NVM_NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
        export ELECTRON_MIRROR="https://npmmirror.com/mirrors/electron"
        export npm_config_electron_mirror="https://npmmirror.com/mirrors/electron/"
        export BUN_BINARY_MIRROR_OVERRIDE="https://npmmirror.com/-/binary/"
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
}
_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
}
_get_electron_version() {
    _elec_ver=$(find "${srcdir}" -maxdepth 5 -name "package.json" ! -path "*/node_modules/*" \
        -exec grep -l '"electron"' {} + | xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null | head -1)
    [[ -z "${_elec_ver}" ]] && return 1
    echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname//-/}/g
    " "${srcdir}/${pkgname}.sh"    
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Graphics;Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U"
    _set_build_env
    _ensure_local_nvm
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    bun install
}
build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	_set_build_env
    _ensure_local_nvm
    bun run build
    bunx electron-builder --linux dir -c.electronDist="${ELECTRON_DIST}" --config electron-builder.config.cjs
    local _app_dir=$(_get_app_dir)
    ln -sf "/usr/bin/ffmpeg" "${_app_dir}/resources/app.asar.unpacked/node_modules/ffmpeg-static/ffmpeg"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname}/"
	rm -rf "${pkgdir}/usr/lib/${pkgname}/default_app.asar"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/img/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
