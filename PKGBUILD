# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=salvage-git
_pkgname=Salvage
pkgver=r212.b236382
_nodeversion=20
pkgrel=1
pkgdesc="Copy files comfortably and automate your backups."
arch=('any')
url="https://github.com/RenanSui/salvage"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%-r*}")
depends=(
    'gtk3'
    'gdk-pixbuf2'
    'webkit2gtk'
)
makedepends=(
    'gendesk'
    'git'
    'nvm'
    'npm'
    'pnpm'
    'curl'
    'rust'
)
source=(
    "${pkgname//-/.}::git+${url}.git"
)
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname%-git}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname//-/.}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export CARGO_HOME="${srcdir}/.cargo"
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
    install -Dm755 "${srcdir}/${pkgname//-/.}/src-tauri/target/release/bundle/deb/${pkgname%-git}_"*/data/usr/bin/"${pkgname%-git}" \
        -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname//-/.}/src-tauri/target/release/bundle/deb/${pkgname%-git}_"*/data/usr/share/applications/"${pkgname%-git}.desktop" \
        -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/${pkgname//-/.}/src-tauri/target/release/bundle/deb/${pkgname%-git}_"*/data/usr/share/icons/hicolor/"${_icons}/apps/${pkgname%-git}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/${pkgname//-/.}/README.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}