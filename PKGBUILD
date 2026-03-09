# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nvm-desktop-git
_pkgname='NVM Desktop'
pkgver=alpha.r0.g8ad318b
_nodeversion=22
pkgrel=1
pkgdesc="A version management desktop client for the Nodejs."
arch=('any')
url="https://github.com/1111mp/nvm-desktop"
_nvmdurl="https://github.com/1111mp/nvmd-command"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
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
    'git'
    'rust'
    'librsvg'
    'patchelf'
)
source=(
    "${pkgname%-git}.git::git+${url}"
    "nvmd.git::git+${_nvmdurl}"
)
sha256sums=('SKIP'
            'SKIP')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
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
prepare() {
    gendesk -f -n -q \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Development" \
        --name="${pkgname%-git}" \
        --exec="${pkgname%-git} %U"
    export CARGO_HOME="${srcdir}/.cargo"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
        export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
        export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
    fi
    rustup default stable
    # build nvmd
    cd "${srcdir}/nvmd.git"
    cargo install toml-cli
    cargo build --release
    # build nvm-desktop
    cd "${srcdir}/${pkgname%-git}.git"
    install -Dm755 "${srcdir}/nvmd.git/target/release/nvmd" -t "${srcdir}/${pkgname%-git}.git/src-tauri/resources"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo 'link-workspace-packages=true'
        echo 'fetch-retry-maxtimeout=10000'
        echo "cache-dir="${srcdir}"/.pnpm_cache"
        echo "store-dir="${srcdir}"/.pnpm_store"
    } >> .npmrc
    _ensure_local_nvm
    sed -i "s/\"active\"\: true\,/\"active\"\: false\,/g" src-tauri/tauri.conf.json
    cp "src-tauri/icons/128x128@2x.png" "src-tauri/icons/256x256.png"
    NODE_ENV=development    pnpm install
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    _ensure_local_nvm
    rustup default stable
    NODE_ENV=production     pnpm run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.git/src-tauri/target/release/${pkgname%-git}" -t "${pkgdir}/usr/bin"
    install -Dm755 "${srcdir}/nvmd.git/target/release/nvmd" -t "${pkgdir}/usr/lib/${_pkgname//-/ }/resources"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(32x32 64x64 128x128 256x256)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname%-git}.git/src-tauri/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}