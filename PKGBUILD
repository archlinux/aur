# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nvm-desktop
_pkgname=NVM-Desktop
pkgver=4.0.2
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
    'libappindicator-gtk3'
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
)
source_aarch64=("nvmd-${_nvmdver}-aarch64::${_nvmdurl}/releases/download/v${_nvmdver}/nvmd_linux-arm64")
source_x86_64=("nvmd-${_nvmdver}-x86_64::${_nvmdurl}/releases/download/v${_nvmdver}/nvmd_linux-x64")
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('177000c56b5adbc840a05cc45813ed0f6ed053cb4467821cf3a21dcebc3a7a28')
sha256sums_aarch64=('980b65d2a88562c546390b400a733229a417ca2dcdce212fb86ce5d6e583a71b')
sha256sums_x86_64=('21148432a1f770969fc3ebfe73e36b3e489dd72b9c9741c8409a84385aa553b3')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    _ensure_local_nvm
    gendesk -f -n -q --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Development" --name="${pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm755 "${srcdir}/nvmd-${_nvmdver}-${CARCH}" "${srcdir}/${pkgname}-${pkgver}/src-tauri/resources/nvmd"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
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
            echo 'disturl=https://registry.npmmirror.com/-/binary/node/'
        } >> .npmrc
    fi
    NODE_ENV=development    pnpm install
    NODE_ENV=production     pnpm tauri build -b deb
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