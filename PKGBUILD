# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nvm-desktop
_pkgname=NVM-Desktop
pkgver=4.4.0
_nvmdver="${pkgver}"
_nodeversion=24
pkgrel=1
pkgdesc="Node Version Manager Desktop - A desktop application to manage multiple active node.js versions."
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://github.com/1111mp/nvm-desktop"
_nvmdurl="https://github.com/1111mp/nvmd-command"
license=('MIT')
conflicts=("${pkgname}")
depends=(
    'webkit2gtk-4.1'
    'gtk3'
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'pnpm'
    'curl'
    'rustup'
    'librsvg'
    'patchelf'
    'git'
)
source_aarch64=("nvmd-${_nvmdver}-aarch64::${_nvmdurl}/releases/download/v${_nvmdver}/nvmd_linux-arm64")
source_armv7h=("nvmd-${_nvmdver}-armv7h::${_nvmdurl}/releases/download/v${_nvmdver}/nvmd_linux-armv7")
source_x86_64=("nvmd-${_nvmdver}-x86_64::${_nvmdurl}/releases/download/v${_nvmdver}/nvmd_linux-x64")
source=("${pkgname}-${pkgver}::git+${url}.git#tag=v${pkgver}")
sha256sums=('20c4e5324069038753d21b2387177692887097a6de26a14c7846f43332528979')
sha256sums_aarch64=('d25bb17da578f5c66daa9e3bd1c7af259d01f1cfe111dd42d64c94d7e6f715ba')
sha256sums_armv7h=('caf6f5d0eb1110c44ad201c681501c3881d0dd7c258f1d405bd931390f4a52b6')
sha256sums_x86_64=('c6a6cbb0ab600058c0c01bf05014fec84f77f8a956e9990ad8c9b853829ac856')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_set_build_env() {
    export HOME="${srcdir}/.electron-gyp"
    export CARGO_HOME="${srcdir}/.cargo"
    {
        export PNPM_LINK_WORKSPACE_PACKAGES=true
        export PNPM_FETCH_RETRY_MAXTIMEOUT=10000
        export PNPM_CACHE_DIR="${srcdir}/.pnpm_cache"
        export PNPM_STORE_DIR="${srcdir}/.pnpm_store"
        export PNPM_VIRTUAL_STORE_DIR="${srcdir}/.pnpm_store"
        export PNPM_SHAMEFULLY_HOIST=true
        export PNPM_VIRTUAL_STORE_DIR_MAX_LENGTH=80
        export PNPM_NODE_LINKER=hoisted
        export PNPM_NETWORK_CONCURRENCY=32
    }
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            export pnpm_config_registry="https://registry.npmmirror.com"
            export npm_config_registry="https://registry.npmmirror.com"
            export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
            export RUSTUP_DIST_SERVER="https://mirrors.aliyun.com/rustup"
            export RUSTUP_UPDATE_ROOT="https://mirrors.aliyun.com/rustup/rustup"

        }
    fi
}
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    gendesk -f -n -q \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Development" \
        --name="${pkgname}" \
        --exec="${pkgname} %U"
    install -Dm755 "${srcdir}/nvmd-${_nvmdver}-${CARCH}" "${srcdir}/${pkgname}-${pkgver}/src-tauri/resources/nvmd"
    _set_build_env
    _ensure_local_nvm
    sed -i "s/\"active\"\: true\,/\"active\"\: false\,/g" src-tauri/tauri.conf.json
    rustup default stable
    cp "src-tauri/icons/128x128@2x.png" "src-tauri/icons/256x256.png"
    NODE_ENV=development    pnpm install
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _set_build_env
    _ensure_local_nvm
    NODE_ENV=production     pnpm run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/src-tauri/target/release/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/nvmd-${_nvmdver}-${CARCH}" "${pkgdir}/usr/lib/${_pkgname//-/ }/resources/nvmd"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src-tauri/icons/icon.png" -t "${pkgdir}/usr/lib/${_pkgname//-/ }/icons"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    _icon_sizes=(32x32 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src-tauri/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons//@2/}/apps/${pkgname}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
