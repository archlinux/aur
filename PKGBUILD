# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=beekeeper-studio-git
_pkgname="Beekeeper Studio"
pkgver=4.4.0.r1.g0ea794e
_electronversion=18
_nodeversion=16
pkgrel=1
pkgdesc="Modern and easy to use SQL client for MySQL, Postgres, SQLite, SQL Server, and more"
arch=('any')
url="https://www.beekeeperstudio.io/"
_ghurl="https://github.com/beekeeper-studio/beekeeper-studio"
license=('GPL-3.0-only')
depends=(
    "electron${_electronversion}"
    'openssl'
)
makedepends=(
    'npm'
    'yarn'
    'git'
    'nvm'
    'gendesk'
    'python>=3.8'
    'gcc'
    'cmake'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}.git"
    "${pkgname%-git}.sh")
sha256sums=('SKIP'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g'
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
        -e "s|@cfgdirname@|${_pkgname}|g" \
        -e "s|@options@||g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname%-git}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname%-git} %U"
    cd "${srcdir}/${pkgname%-git}.git/apps/studio"
    export npm_config_build_from_source=true
    #export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    #export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    #export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    #export ELECTRONVERSION="${_electronversion}"
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    touch "${srcdir}/.electron-gyp/.yarnrc"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_disturl=https://npmmirror.com/mirrors/node
        export npm_config_chromedriver_cdnurl=https://npmmirror.com/mirrors/chromedriver
        export npm_config_node_sqlite3_binary_host_mirror=https://npmmirror.com/mirrors
        export npm_config_electron_mirror=https://npmmirror.com/mirrors/electron/
        export npm_config_python_mirror=https://npmmirror.com/mirrors/python
        export npm_config_sass_binary_site=https://npmmirror.com/mirrors/node-sass
        export npm_config_bin_mirrors_prefix=https://npmmirror.com/mirrors
        export npm_config_electron_custom_dir="{{ version }}"
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
    else
        echo "Your network is OK."
    fi
        sed "/'snap',/d;/'deb',/d;s|'appImage'|'dir'|g" -i ./vue.config.js
        rm -rf ./dist_electron
        yarn install --cache-folder "${srcdir}/.yarn_cache"
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