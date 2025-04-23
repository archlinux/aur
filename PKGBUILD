# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=salvage-git
_pkgname=Salvage
pkgver=2.3.0.r0.g832fd01
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
    'webkit2gtk-4.1'
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
prepare() {
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname%-git}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname//-/.}"
    HOME="${srcdir}/.electron-gyp"
    export CARGO_HOME="${srcdir}/.cargo"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo 'link-workspace-packages=true'
        echo 'fetch-retry-maxtimeout=10000'
        echo "cache-dir="${srcdir}"/.pnpm_cache"
        echo "store-dir="${srcdir}"/.pnpm_store"
        echo "shamefully-hoist=true"
        echo "virtual-store-dir-max-length=80"
        echo "node-linker=hoisted"
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
    cd "${srcdir}/${pkgname//-/.}"
    sed -i "s/all/deb/g" src-tauri/tauri.conf.json
    NODE_ENV=production     pnpm -c tauri build
    sed -i -e "
        s/Exec=${_pkgname}/Exec=${pkgname%-git}/g
        s/Icon=${_pkgname}/Icon=${pkgname%-git}/g
        3i\Comment=${pkgdesc}
    " "${srcdir}/${pkgname//-/.}/src-tauri/target/release/bundle/deb/${_pkgname}_"*/data/usr/share/applications/"${_pkgname}.desktop"
}
package() {
    cd "${srcdir}/${pkgname//-/.}/src-tauri/target/release/bundle/deb/${_pkgname}_"*/data/usr
    install -Dm755 ./bin/"${_pkgname}" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 ./share/applications/"${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 ./share/icons/hicolor/"${_icons}/apps/${_pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname//-/.}/README.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}