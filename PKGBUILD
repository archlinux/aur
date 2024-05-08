# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nvm-desktop
pkgver=3.3.0
_nvmdver="${pkgver}"
_electronversion=30
_nodeversion=20
pkgrel=1
pkgdesc="A version management desktop client for the Nodejs."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/1111mp/nvm-desktop"
_nvmdurl="https://github.com/1111mp/nvmd-command"
license=('MIT')
conflicts=("${pkgname}")
noextract=("nvmd-${_nvmdver}-${CARCH}.zip")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'pnpm'
    'curl'
)
source_aarch64=("nvmd-${_nvmdver}-aarch64.zip::${_nvmdurl}/releases/download/v${_nvmdver}/Linux-arm64.zip")
source_x86_64=("nvmd-${_nvmdver}-x86_64.zip::${_nvmdurl}/releases/download/v${_nvmdver}/Linux-x64.zip")
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('75d22a3e513530999b03614e99ea9bb2bd8fe59ef29586e562c921dd7297b9ff'
            '05762c556c85a4423b28600ccbbe7b7dcdd3d1be526ef4a588a510671fa6c62a')
sha256sums_aarch64=('425aea3c4194c2c3a297e459563491b8fa8d5e4331f93cbc784d5e44b84bf8c4')
sha256sums_x86_64=('7f24745cf7a9785206dcbf59a9ad969bd8cdc0b38be3d20782062fbe599e9732')
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
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -f -n -q --categories "Development" --name "${pkgname}" --exec "${pkgname} %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    bsdtar -xf "${srcdir}/nvmd-${_nvmdver}-${CARCH}.zip" -C "${srcdir}"
    install -Dm755 "${srcdir}/Linux-"*/nvmd -t "${srcdir}/${pkgname}-${pkgver}/assets/sources"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    HOME="${srcdir}/.electron-gyp"
    pnpm config set store-dir "${srcdir}/.pnpm_store"
    pnpm config set cache-dir "${srcdir}/.pnpm_cache"
    pnpm config set link-workspace-packages true
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_disturl=https://registry.npmmirror.com/-/binary/node/
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
    else
        echo "Your network is OK."
    fi
    sed "s|AppImage|dir|g" -i package.json
    sed "s|resourcesPath, \"_locales\"|resourcesPath,\"..\/..\/${pkgname}/_locales\"|g" -i src/main/locale.ts
    sed "s|resourcesPath, \"assets\",|resourcesPath, \"..\/..\/${pkgname}/assets\",|g" -i src/main/main.ts
    pnpm install
    pnpm run package:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/release/build/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/release/build/linux-"*/resources/{_locales,assets} "${pkgdir}/usr/lib/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}