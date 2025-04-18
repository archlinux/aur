# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=nvm-desktop-git
_pkgname='NVM Desktop'
pkgver=alpha.r1.g6c671d1
_nodeversion=20
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
    gendesk -f -n -q --pkgname="${pkgname%-git}" --pkgdesc="${pkgdesc}" --categories="Development" --name="${pkgname%-git}" --exec="${pkgname%-git} %U"
    # build nvmd
    cd "${srcdir}/nvmd.git"
    export CARGO_HOME="${srcdir}/.cargo"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
        export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
    fi
    cargo install toml-cli
    cargo build --release
    cd "${srcdir}/${pkgname%-git}.git"
    # build nvm-desktop
    _ensure_local_nvm
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
    cd "${srcdir}/${pkgname%-git}.git"
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
    _sourcedir="${srcdir}/${pkgname%-git}.git/src-tauri/target/release/bundle/deb"
    install -Dm755 "${_sourcedir}/${_pkgname}_"*/data/usr/bin/"${pkgname%-git}" -t "${pkgdir}/usr/bin"
    install -Dm755 -d "${pkgdir}/usr/lib"
    cp -Pr --no-preserve=ownership "${_sourcedir}/${_pkgname}_"*/data/usr/lib/"${_pkgname}" "${pkgdir}/usr/lib"
    install -Dm644 "${_sourcedir}/${_pkgname}_"*/data/usr/share/applications/"${_pkgname}.desktop" \
        "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/src-tauri/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}