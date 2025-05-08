# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=hackerpad-git
_pkgname=Hackerpad
pkgver=r93.731f5c0
_nodeversion=22
pkgrel=1
pkgdesc="Lightweight scratch pad for software engineers."
arch=('any')
url="https://github.com/hackerpad-app/hackerpad-tauri"
license=('LicenseRef-unknown')
depends=(
    'webkit2gtk'
    'libsoup'
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'curl'
    'yarn'
)
source=("${pkgname//-/.}::git+${url}.git")
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
    cd "${srcdir}/${pkgname//-/.}"
    _ensure_local_nvm
    export CARGO_HOME="${srcdir}/.cargo"
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo -e '\n'
            echo 'registry "https://registry.npmmirror.com"'
            echo "cacheFolder "${srcdir}"/.yarn/cache"
            echo "pluginsFolder "${srcdir}"/.yarn/plugins"
            echo "globalFolder "${srcdir}"/.yarn/global"
            echo 'useHardlinks true'
            #echo 'buildFromSource true'
            echo 'linkWorkspacePackages true'
            echo 'fetchRetries 3'
            echo 'fetchRetryTimeout 10000'
            echo 'networkConcurrency 10'
        } >> .yarnrc
        find ./ -type f -name "yarn.lock" -exec sed -i "s/registry.yarnpkg.com/registry.npmmirror.com/g" {} +
        export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
        export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
    fi
    sed -i "s/targets\"\: \"all/targets\"\: \"deb/g" src-tauri/tauri.conf.json
    NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache"
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    NODE_ENV=production     yarn run tauri build
}
package() {
    install -Dm755 "${srcdir}/${pkgname//-/.}/src-tauri/target/release/bundle/deb/${pkgname%-git}_"*/data/usr/bin/"${pkgname%-git}" \
        -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname//-/.}/src-tauri/target/release/bundle/deb/${pkgname%-git}_"*/data/usr/share/applications/"${pkgname%-git}.desktop" \
        -t "${pkgdir}/usr/share/applications"
    _icon_sizes=(32x32 128x128 256x256@2)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname//-/.}/src-tauri/target/release/bundle/deb/${pkgname%-git}_"*/data/usr/share/icons/hicolor/"${_icons}/apps/${pkgname%-git}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
}