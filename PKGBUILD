# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nvm-desktop
_pkgname=NVM-Desktop
pkgver=3.4.0
_nvmdver="${pkgver}"
_electronversion=31
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
source_aarch64=("nvmd-${_nvmdver}-aarch64.zip::${_nvmdurl}/releases/download/${_nvmdver}/Linux-arm64.zip")
source_x86_64=("nvmd-${_nvmdver}-x86_64.zip::${_nvmdurl}/releases/download/${_nvmdver}/Linux-x64.zip")
source=(
    "${pkgname}.git::git+${url}.git#tag=${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('2c56d7a6682cc6600b3f08b3b6ff9b96c0bdf2500a8107818539d1ddbd40f434'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
sha256sums_aarch64=('86c478d22cb3dabd54be43722a3fbe2422d885c649378aa702ae042c1a0109e2')
sha256sums_x86_64=('db3568252601ba44637a6b39ffffc84cad4211fadbf239146881bdf22a7bed84')
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
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -f -n -q --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Development" --name="${pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
    bsdtar -xf "${srcdir}/nvmd-${_nvmdver}-${CARCH}.zip" -C "${srcdir}"
    install -Dm755 "${srcdir}/Linux-"*/nvmd -t "${srcdir}/${pkgname}.git/assets/sources"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
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
    sed "s|\"electron\": \"\^31.3.0\",|\"electron\": \"${SYSTEM_ELECTRON_VERSION}\",|g;s|--linux|-l --dir|g" -i package.json
    find src -type f | xargs sed -i "s|process.resourcesPath|\"\/usr\/lib\/${pkgname}\"|g"
    NODE_ENV=development    pnpm install
    NODE_ENV=production     pnpm run package:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    case "${CARCH}" in
        'aarch64')
            _osarch=linux-arm64-unpacked
            ;;
        'x86_64')
            _osarch=linux-unpacked
            ;;
    esac
    install -Dm644 "${srcdir}/${pkgname}.git/release/build/${_osarch}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/release/build/${_osarch}/resources"/{_locales,assets} "${pkgdir}/usr/lib/${pkgname}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname}.git/assets/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-bin}.png"
    done
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}