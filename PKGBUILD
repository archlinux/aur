# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=aionui
_pkgname=AionUi
pkgver=1.9.3
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
    "${pkgname}-${pkgver}::git+${_ghurl}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('6af75a648ceb9443ca15c6378b33e60c51adc892d207191c3e904d2e2b184836'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_electron_version() {
    _elec_ver=$(jq -r '.devDependencies["electron"] // .dependencies["electron"]' "${srcdir}/${pkgname}-${pkgver}/package.json" | tr -d '^')
    _main_ver=$(echo "${_elec_ver}" | cut -d. -f1)
    echo -e "The electron version is: \033[1;31m${_main_ver}\033[0m"
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
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    rm -rf bunfig.toml bun.lockb || true
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
        export BUN_REGISTRY_MIRROR="https://registry.npmmirror.com"
        export BUN_BINARY_MIRROR_OVERRIDE="https://registry.npmmirror.com/-/binary/"
        export BUN_INSTALL_REWRITE="https://registry.npmjs.org/*=https://registry.npmmirror.com/\$1"
        export BUN_INSTALL_NO_CACHE=1
        export BUN_INSTALL_DISABLE_DEFAULT_REGISTRY_FALLBACK=1
        export BUN_CACHE_DIR="${srcdir}/.bun_cache"
    fi
    _ensure_local_nvm
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    sed -i "s/target\: deb/target\: dir/g" electron-builder.yml
    case "${CARCH}" in
        aarch64)
            sed -i "s/x64, arm64/arm64/g" electron-builder.yml
            ;;
        x86_64)
            sed -i "s/x64, arm64/x64/g" electron-builder.yml
            ;;
    esac
    bun run postinstall || true
    bunx electron-builder install-app-deps
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _ensure_local_nvm
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    local electronDist="/usr/lib/electron${_electronversion}"
    bun run dist:linux
    case "${CARCH}" in
        aarch64)
            ln -sf "/usr/bin/bun" "out/linux-arm64-unpacked/resources/bundled-bun/linux-arm64/bun"
            ;;
        x86_64)
            ln -sf "/usr/bin/bun" "out/linux-unpacked/resources/bundled-bun/linux-x64/bun"
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname}"
	find "${srcdir}/${pkgname}-${pkgver}/out/linux-"*"/resources" -maxdepth 1 -type f -exec install -Dm644 -t "${pkgdir}/usr/lib/${pkgname}" {} +
    if find "${srcdir}/${pkgname}-${pkgver}/out/linux-"*"/resources" -mindepth 1 -maxdepth 1 -type d | read; then
        for _subdir in "${srcdir}/${pkgname}-${pkgver}/out/linux-"*"/resources/"*; do
            if [ -d "${_subdir}" ]; then
                cp -Pr --no-preserve=ownership "${_subdir}" "${pkgdir}/usr/lib/${pkgname}"
            fi
        done
    fi
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/resources/app.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}