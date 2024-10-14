# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nvm-desktop
_pkgname=NVM-Desktop
pkgver=4.0.1
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
sha256sums=('f84442d202a1e2f53ae7315337b96d31b67fd72e422ece8c1b02c112914deeb6')
sha256sums_aarch64=('adb3df5f6cba4c8d2b8c4d5da479d89ecf5cee01966ad60219c713f8d3f4aea9')
sha256sums_x86_64=('f9633ceddc14971a6afd108cbaca7d69704c65184715f27c7363a25cc68a3c2d')
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