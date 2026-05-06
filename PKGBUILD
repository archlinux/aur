# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=rocketchat-desktop-git
_pkgname=Rocket.Chat
pkgver=4.14.1.r1.gc2b584b
_electronversion=40
_nodeversion=25
pkgrel=1
pkgdesc="The Ultimate Open Source WebChat Platform.(Use system-wide electron)"
arch=('any')
url="https://rocket.chat/"
_ghurl="https://github.com/RocketChat/Rocket.Chat.Electron"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'git'
    'curl'
    'yarn'
    'jq'
    'patch'
)
optdepends=(
    'libnotify: For sending desktop notifications'
    'libindicator-gtk3: For the system tray icon'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}"
    "${pkgname%-git}-rollup.patch"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '1c186ddc7dc31bf46c92c58e235f2d5b99ef309b0b81663e38778ef397bdd41a'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
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
_get_electron_version() {
    _elec_ver=$(find "${srcdir}" -maxdepth 5 -name "package.json" ! -name "node_modules" \
        -exec jq -r '.devDependencies.electron // empty' {} + 2>/dev/null | grep -v "^$" | head -n 1)
    _elec_ver=$(echo "${_elec_ver}" | sed 's/[^0-9.]//g')
    _main_ver=$(echo "${_elec_ver}" | cut -d. -f1)
    echo -e "The electron version is: \033[1;31m${_main_ver}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname%-git}.git"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Network" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export ELECTRON_PATH="/usr/lib/electron${_electronversion}"
    export PATH="/usr/lib/electron${_electronversion}:$PATH"
    local HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            export ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
            export ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
            export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
            export YARN_CACHE_FOLDER="${srcdir}/.yarn/cache"
            export YARN_GLOBAL_FOLDER="${srcdir}/.yarn/global"
            export YARN_NETWORK_CONCURRENCY=32
            sed -i '/^npmRegistryServer:/d' .yarnrc.yml
            echo 'npmRegistryServer: "https://registry.npmmirror.com"' >> .yarnrc.yml
        }

        find ./ -type f -name "yarn.lock" -exec sed -i "s/registry.yarnpkg.com/registry.npmmirror.com/g" {} +
    fi
    patch -Np1 -i "${srcdir}/${pkgname%-git}-rollup.patch"
    _ensure_local_nvm
    local _electron_ver="$(electron${_electronversion} -v | sed 's/v//g')"
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${_electron_ver}\"/g" package.json
    yarn config set --home enableTelemetry 0
    NODE_ENV=development    yarn install
    rm -rf node_modules/electron
    mkdir -p node_modules/electron
    echo "${_electron_ver}" > node_modules/electron/.npm-version
    echo "{\"version\": \"${_electron_ver}\"}" > node_modules/electron/package.json
    cat > node_modules/electron/index.js << EOF
const path = require('path');
const electronPath = process.env.ELECTRON_PATH || '/usr/lib/electron${_electronversion}';
module.exports = {
  default: path.join(electronPath, 'electron'),
  path: path.join(electronPath, 'electron'),
};
EOF
    ln -sf "${ELECTRON_PATH}"/* node_modules/electron/
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    _ensure_local_nvm
    local electronDist="/usr/lib/electron${_electronversion}"
    local _electron_ver="$(electron${_electronversion} -v | sed 's/v//g')"
    rm -rf node_modules/electron
    mkdir -p node_modules/electron
    echo "${_electron_ver}" > node_modules/electron/.npm-version
    echo "{\"version\": \"${_electron_ver}\"}" > node_modules/electron/package.json
    cat > node_modules/electron/index.js << EOF
const path = require('path');
const electronPath = process.env.ELECTRON_PATH || '/usr/lib/electron${_electronversion}';
module.exports = {
  default: path.join(electronPath, 'electron'),
  path: path.join(electronPath, 'electron'),
};
EOF
    ln -sf "${electronDist}"/* node_modules/electron/
    NODE_ENV=production     yarn run build
    NODE_ENV=production     yarn electron-builder --linux dir -c.electronDist="${electronDist}" --config electron-builder.json
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	find "${srcdir}/${pkgname%-git}.git/dist/linux-"*"/resources" -maxdepth 1 -type f -exec install -Dm644 -t "${pkgdir}/usr/lib/${pkgname%-git}" {} +
    if find "${srcdir}/${pkgname%-git}.git/dist/linux-"*"/resources" -mindepth 1 -maxdepth 1 -type d | read; then
        for _subdir in "${srcdir}/${pkgname%-git}.git/dist/linux-"*"/resources/"*; do
            if [ -d "${_subdir}" ]; then
                cp -Pr --no-preserve=ownership "${_subdir}" "${pkgdir}/usr/lib/${pkgname%-git}"
            fi
        done
    fi
    install -Dm644 "${srcdir}/${pkgname%-git}.git/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    icon_sizes=(16x16 32x32 48x48 64x64 128x128 256x256 512x512)
    for _icons in "${icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname%-git}.git/build/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
