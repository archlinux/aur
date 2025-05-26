# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=simpleshell-git
_pkgname=SimpleShell
pkgver=1.3.3.r6.ge0f6f7e
_electronversion=35
_nodeversion=22
pkgrel=1
pkgdesc="A Simple Terminal based on Electron & NodeJS.(Use system-wide electron)"
arch=('any')
url="https://github.com/funkpopo/simpleshell"
license=('Apache-2.0')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'yarn'
    'nvm'
    'git'
    'curl'
    'gendesk'
)
source=(
    "${pkgname//-/.}::git+${url}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
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
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-git}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
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
            echo 'networkConcurrency 10'
        } >> .yarnrc
        find ./ -type f -name "yarn.lock" -exec sed -i "s/registry.yarnpkg.com/registry.npmmirror.com/g" {} +
    fi
    sed -i "s/logo.ico/${_pkgname}.png/g" src/main.js
    cp src/core/configManager.js src/core/ConfigManager.js
    rm -rf src/core/configManager.js
    sed -i "3i\const configDir = process.env.XDG_CONFIG_HOME || path.join(require('os').homedir(), '.config');" src/core/ConfigManager.js
    sed -i "3i\const configDir = process.env.XDG_CONFIG_HOME || path.join(require('os').homedir(), '.config');" src/core/utils/logger.js
    sed -i 's/return path.join(path.dirname(app.getPath("exe")), "config.json");/return path.join(configDir, 'simpleshell', 'config.json');/g' src/core/ConfigManager.js
    sed -i "s/return path.join(path.dirname(process.execPath), 'log');/return path.join(configDir, 'simpleshell', 'log');/g" src/core/utils/logger.js
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache"
    #NODE_ENV=development    pnpm add -D "@vercel/webpack-asset-relocator-loader@latest"
    NODE_ENV=development    yarn add -D "@electron-forge/plugin-local-electron" "@mui/material" "@mui/icons-material" \
        "@mui/types" "@mui/core-downloads-tracker" "@mui/private-theming" "@mui/styled-engine" "@mui/system" "@mui/utils"
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    local electronDist="/usr/lib/electron${_electronversion}"
    sed -i "/^[[:space:]]*plugins:[[:space:]]*\[.*\$/a\\
    {\\
        name: \"@electron-forge/plugin-local-electron\",\\
        config: {\\
            electronPath: \'${electronDist}\',\\
        },\\
    }," forge.config.*
    NODE_ENV=development    yarn run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/out/${pkgname%-git}-linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname//-/.}/out/${pkgname%-git}-linux-"*/resources/app.asar.unpacked -t "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/src/assets/${_pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}