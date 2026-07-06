# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aionui
_pkgname=AionUi
pkgver=2.1.30
_electronversion=37
_nodeversion=22
pkgrel=1
pkgdesc="Free, local, open-source 24/7 Cowork app and OpenClaw for Gemini CLI, Claude Code, Codex, OpenCode, Qwen Code, Goose CLI, Auggie, and more.(Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.aionui.com/"
_ghurl="https://github.com/iOfficeAI/AionUi"
license=('Apache-2.0')
conflicts=("${pkgname}-bin")
depends=(
    "electron${_electronversion}"
    'python'
    'libsecret'
)
makedepends=(
    'bun'
    'nvm'
    'gendesk'
    'curl'
    'git'
    'jq'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('abccf38046cda66835132872e9d4628511a1f792905d3043e43dcd6500df35ed'
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
_get_electron_version() {
    _elec_ver=$(find "${srcdir}" -maxdepth 5 -name "package.json" ! -name "node_modules" \
        -exec jq -r '.devDependencies.electron // empty' {} + 2>/dev/null | grep -v "^$" | head -n 1)
    _elec_ver=$(echo "${_elec_ver}" | sed 's/[^0-9.]//g')
    _main_ver=$(echo "${_elec_ver}" | cut -d. -f1)
    echo -e "The electron version is: \033[1;31m${_main_ver}\033[0m"
}
_set_build_env() {
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    local HOME="${srcdir}/.electron-gyp"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    electronDist="/usr/lib/electron${_electronversion}"
    rm -rf bunfig.toml bun.lockb || true
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
        export BUN_REGISTRY_MIRROR="https://registry.npmmirror.com"
        export BUN_BINARY_MIRROR_OVERRIDE="https://registry.npmmirror.com/-/binary/"
        export BUN_INSTALL_REWRITE="https://registry.npmjs.org/*=https://registry.npmmirror.com/\$1"
        export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
        export BUN_INSTALL_NO_CACHE=1
        export BUN_INSTALL_DISABLE_DEFAULT_REGISTRY_FALLBACK=1
        export BUN_CACHE_DIR="${srcdir}/.bun_cache"
    fi
}
prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname}/g
    " "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="System" \
        --name="${pkgname}" \
        --exec="${pkgname} %U"
    _set_build_env
    _ensure_local_nvm
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    bun run postinstall || true
    bunx electron-builder install-app-deps
}
build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    _set_build_env
    _ensure_local_nvm   
    bun run dist:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
    local _app_dir=$(_get_app_dir)
    cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname}/"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/resources/app.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
