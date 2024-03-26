# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=beekeeper-studio-git
_pkgname="Beekeeper Studio"
pkgver=4.2.0.r13.gedc3cb17
_electronversion=18
_nodeversion=16
pkgrel=1
pkgdesc="Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more"
arch=('any')
url="https://www.beekeeperstudio.io/"
_ghurl="https://github.com/beekeeper-studio/beekeeper-studio"
license=('GPL-3.0-only')
depends=(
    "electron${_electronversion}-bin"
)
makedepends=(
    'npm'
    'yarn'
    'git'
    'nvm'
    'gendesk'
    'python>=3.8'
    'base-devel'
    'gcc'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}.git"
    "${pkgname%-git}.sh")
sha256sums=('SKIP'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-git}|g" \
        -e "s|@runname@|app.asar|g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname%-git}.git/"
    export npm_config_build_from_source=true
    #export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    export ELECTRONVERSION="${_electronversion}"
    export npm_config_disturl=https://electronjs.org/headers
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    touch "${srcdir}/.electron-gyp/.yarnrc"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        echo 'registry="https://registry.npmmirror.com/"' >> .npmrc
        echo 'electron_mirror="https://registry.npmmirror.com/-/binary/electron/"' >> .npmrc
        echo 'electron_builder_binaries_mirror="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"' >> .npmrc
    else
        echo "Your network is OK."
    fi
    sed "/'snap',/d;/'deb',/d;s|'appImage'|'dir'|g" -i apps/studio/vue.config.js
    yarn install --cache-folder "${srcdir}/.yarn_cache"
    rm -rf apps/studio/dist_electron
    yarn run electron:build
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/apps/studio/dist_electron/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname%-git}.git/apps/studio/dist_electron/linux-"*/resources/{public,vendor} "${pkgdir}/usr/lib/${pkgname%-git}"
    for _icons in 16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024;do
        install -Dm644 "${srcdir}/${pkgname%-git}.git/apps/studio/public/icons/png/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}