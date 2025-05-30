# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nvm-desktop
_pkgname=NVM-Desktop
pkgver=4.0.9
_nvmdver="${pkgver}"
_nodeversion=20
pkgrel=1
pkgdesc="Node Version Manager Desktop - A desktop application to manage multiple active node.js versions."
arch=(
    'aarch64'
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
    'rust'
    'librsvg'
    'patchelf'
    'git'
)
source_aarch64=("nvmd-${_nvmdver}-aarch64::${_nvmdurl}/releases/download/v${_nvmdver}/nvmd_linux-arm64")
source_x86_64=("nvmd-${_nvmdver}-x86_64::${_nvmdurl}/releases/download/v${_nvmdver}/nvmd_linux-x64")
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('ce02b5735b518a5ff35fc4b225b6e7603e5e2972b96ec7c063be62782563570f')
sha256sums_aarch64=('a81f8cbd08024195e226f92adc4113a32625042c6b87d536651d6ef62599c1af')
sha256sums_x86_64=('f204caff56970e8941c0e542aab22a652dc0b062101e430e577962eea6b85d54')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    _ensure_local_nvm
    gendesk -f -n -q \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Development" \
        --name="${pkgname}" \
        --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "${srcdir}/nvmd-${_nvmdver}-${CARCH}" "${srcdir}/${pkgname}-${pkgver}/src-tauri/resources/nvmd"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo 'link-workspace-packages=true'
        echo 'fetch-retry-maxtimeout=10000'
        echo "cache-dir="${srcdir}"/.pnpm_cache"
        echo "store-dir="${srcdir}"/.pnpm_store"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
        export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
        {
            echo 'registry=https://registry.npmmirror.com'
        } >> .npmrc
    fi
    NODE_ENV=development    pnpm install
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i "/plugin-updater/d" package.json
    sed -i "/updater/d" src-tauri/capabilities/default.json
    sed -i "/tauri_plugin_updater/d" src-tauri/src/main.rs
    sed -i "/tauri-plugin-updater/d" src-tauri/Cargo.toml
    sed -i -e "
        53,60d
        /createUpdaterArtifacts/d
        s/versions\.\",/versions\.\"/g
    " src-tauri/tauri.conf.json
    sed -i "s/\"deb\", \"rpm\"/\"deb\"/g" src-tauri/tauri.linux.conf.json
    NODE_ENV=production     pnpm run build
}
package() {
    _sourcedir="${srcdir}/${pkgname}-${pkgver}/src-tauri/target/release/bundle/deb"
    install -Dm755 "${_sourcedir}/${_pkgname//-/ }_${pkgver}_"*/data/usr/bin/"${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm755 "${_sourcedir}/${_pkgname//-/ }_${pkgver}_"*/data/usr/lib/"${_pkgname//-/ }"/resources/nvmd -t "${pkgdir}/usr/lib/${_pkgname//-/ }/resources"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src-tauri/icons/icon.png" -t "${pkgdir}/usr/lib/${_pkgname//-/ }/icons"
    install -Dm644 "${_sourcedir}/${_pkgname//-/ }_${pkgver}_"*/data/usr/share/applications/"${_pkgname//-/ }".desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src-tauri/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
