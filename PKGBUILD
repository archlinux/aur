# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nvm-desktop
pkgver=3.2.0
_nvmdver="${pkgver}"
_electronversion=29
_nodeversion=20
pkgrel=1
pkgdesc="A version management desktop client for the Nodejs."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/1111mp/nvm-desktop"
license=('MIT')
conflicts=("${pkgname}")
noextract=("nvmd-${_nvmdver}-${CARCH}.zip")
depends=(
    "electron${_electronversion}"
    'hicolor-icon-theme'
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'pnpm'
    'git'
)
source_aarch64=("nvmd-${_nvmdver}-aarch64.zip::https://github.com/1111mp/nvmd-command/releases/download/v${_nvmdver}/Linux-arm64.zip")
source_x86_64=("nvmd-${_nvmdver}-x86_64.zip::https://github.com/1111mp/nvmd-command/releases/download/v${_nvmdver}/Linux-x64.zip")
source=(
    "${pkgname}.git::git+${url}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('SKIP'
            '50b10386d13e5bec806aeb78f819c4edd0208a4d184332e53866c802731217fe')
sha256sums_aarch64=('12d756d331e9da32a625748e13ee66231b88155e8dea9a014b888ba6fd8ac5d0')
sha256sums_x86_64=('789f181af5c5e3c3104a427bdc1e171ddc34173d115c14cab688423fe75623fc')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname}.sh"
    gendesk -f -n -q --categories "Development" --name "${pkgname}" --exec "${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
    bsdtar -xf "${srcdir}/nvmd-${_nvmdver}-${CARCH}.zip" -C "${srcdir}"
    install -Dm755 "${srcdir}/Linux-"*/nvmd -t "${srcdir}/${pkgname}.git/assets/sources"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    pnpm config set store-dir "${srcdir}/.pnpm_store"
    pnpm config set cache-dir "${srcdir}/.pnpm_cache"
    pnpm config set link-workspace-packages true
    sed "s|resourcesPath, \"_locales\"|resourcesPath,\"..\/..\/${pkgname}/_locales\"|g" -i src/main/locale.ts
    sed "s|resourcesPath, \"assets\",|resourcesPath, \"..\/..\/${pkgname}/assets\",|g" -i src/main/main.ts
    pnpm install
    pnpm run package:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    case "${CARCH}" in
        aarch64)
            _osarchdir="linux-arm64-unpacked"
            ;;
        x86_64)
            _osarchdir="linux-unpacked"
            ;;
    esac
    install -Dm644 "${srcdir}/${pkgname}.git/release/build/${_osarchdir}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/release/build/${_osarchdir}/resources/"{_locales,assets} "${pkgdir}/usr/lib/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}.git/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}