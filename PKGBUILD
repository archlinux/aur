# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cultivation
_pkgname=Cultivation
pkgver=1.5.9
_nodeversion=18
pkgrel=1
pkgdesc="A custom launcher designed to make it as easy as possible to proxy anime game traffic to private servers."
arch=('any')
url="https://github.com/NotThorny/Cultivation"
license=('Apache-2.0')
depends=(
    'gtk3'
    'webkit2gtk'
    'grasscutter'
)
makedepends=(
    'nvm'
    'gendesk'
    'curl'
    'rust'
    'yarn'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${url}.git#tag=${pkgver}"
)
sha256sums=('1eeb605444bd3bd1c38a531d4e76ba7bff459d98f6bfe38482df24a33eb7071b')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    _ensure_local_nvm
    cd "${srcdir}/${pkgname}-${pkgver}"
    HOME="${srcdir}/.electron-gyp"
    export CARGO_HOME="${srcdir}/.cargo"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export RUSTUP_DIST_SERVER=https://mirrors.ustc.edu.cn/rust-static
        export RUSTUP_UPDATE_ROOT=https://mirrors.ustc.edu.cn/rust-static/rustup
        {
            echo -e '\n'
            echo 'registry "https://registry.npmmirror.com"'
            echo 'electron_mirror "https://registry.npmmirror.com/-/binary/electron/"'
            echo 'electron_builder_binaries_mirror "https://registry.npmmirror.com/-/binary/electron-builder-binaries/"'
            echo "cacheFolder "${srcdir}"/.yarn/cache"
            echo "pluginsFolder "${srcdir}"/.yarn/plugins"
            echo "globalFolder "${srcdir}"/.yarn/global"
            echo 'useHardlinks true'
            #echo 'buildFromSource true'
            echo 'linkWorkspacePackages true'
            echo 'fetchRetries 3'
            echo 'fetchRetryTimeout 10000'
        } >> .yarnrc
        find ./ -type f -name "yarn.lock" -exec sed -i "s/registry.yarnpkg.com/registry.npmmirror.com/g" {} +
        sed -i "s/https:\/\/github.com\/an-anime-team/https:\/\/github.moeyy.xyz\/https:\/\/github.com\/an-anime-team/g" src-tauri/Cargo.toml
    fi
    NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache"
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    sed -i "s/\"targets\": \"all\"/\"targets\": \"deb\"/g" src-tauri/tauri.conf.json
    NODE_ENV=production     yarn run build
}
package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/src-tauri/target/release/bundle/deb/${pkgname}_"*/data/usr/bin/"${pkgname}" \
        -t "${pkgdir}/usr/bin"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}/src-tauri/target/release/bundle/deb/${pkgname}_"*/data/usr/lib "${pkgdir}/usr"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src-tauri/target/release/bundle/deb/${pkgname}_"*/data/usr/share/applications/"${pkgname}.desktop" \
        -t "${pkgdir}/usr/share/applications"
    for _icons in 32x32 128x128 256x256@2;do
        install -Dm644 "${srcdir}/${pkgname}-${pkgver}/src-tauri/target/release/bundle/deb/${pkgname}_"*/data/usr/share/icons/hicolor/"${_icons}/apps/${pkgname}.png" \
            -t "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps"
    done
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}