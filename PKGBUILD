# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=windows95-git
_pkgname='Windows 95'
pkgver=5.0.0.r0.g35c82c5
_electronversion=41
_nodeversion=22
pkgrel=1
pkgdesc="💩🚀 Windows 95 in Electron. Runs on macOS, Linux, and Windows.(Use system-wide electron)"
arch=('any')
url="https://github.com/felixrieseberg/windows95"
license=('LicenseRef-custom')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
depends=(
    "electron${_electronversion}"
    'nodejs'
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'curl'
    'gendesk'
    'yarn'
    'libicns'
    'jq'
)
options=(
    '!emptydirs'
)
source=(
    "${pkgname//-/.}::git+${url}.git"
    "${pkgname//-/.}.rpm::${url}/releases/download/v${pkgver%.r*}/${pkgname%-git}-${pkgver%.r*}-1.x86_64.rpm"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '9385f8f72be41b975c4e6a5f3c25ac5dc8bf4bf71ec75dff71aa91836767601f'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
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
_get_electron_version() {
    _elec_ver=$(jq -r '.devDependencies["electron"] // .dependencies["electron"]' "${srcdir}/${pkgname//-/.}/package.json" | tr -d '^')
    _main_ver=$(echo "${_elec_ver}" | cut -d. -f1)
    echo -e "The electron version is: \033[1;31m${_main_ver}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname//-/.}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app/g
        s/@cfgdirname@/${pkgname%-git}/g
        s/@options@//g
    " "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    install -Dm755 -d "${srcdir}/${pkgname//-/.}/images"
    cp "${srcdir}/usr/lib/${pkgname%-git}/resources/app/images/"* "${srcdir}/${pkgname//-/.}/images"
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    local HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            export YARN_REGISTRY="https://registry.npmmirror.com"
            export ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
            export ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
            export YARN_CACHE_FOLDER="${srcdir}/.yarn/cache"
            export YARN_PLUGINS_FOLDER="${srcdir}/.yarn/plugins"
            export YARN_GLOBAL_FOLDER="${srcdir}/.yarn/global"
            export YARN_USE_HARDLINKS=true
            # export YARN_BUILD_FROM_SOURCE=true
            export YARN_LINK_WORKSPACE_PACKAGES=true
            export YARN_FETCH_RETRIES=3
            export YARN_FETCH_RETRY_TIMEOUT=10000
            export YARN_NETWORK_CONCURRENCY=32
        }
        find ./ -type f -name "yarn.lock" -exec sed -i "s/registry.yarnpkg.com/registry.npmmirror.com/g" {} +
    fi
    _ensure_local_nvm
    icns2png -x assets/icon.icns -o assets
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    sed -i -e '
        4i\const os = require("os");
        s|`C:\\\\Users\\\\FelixRieseberg\\\\AppData\\\\Local\\\\Temp`|os.tmpdir();|g
    ' forge.config.js
    NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache"
    NODE_ENV=development    yarn add -D @electron-forge/plugin-local-electron
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    _ensure_local_nvm
    local electronDist="/usr/lib/electron${_electronversion}"
    sed -i '/makers: \[/i\
	plugins: [\
		{\
			name: "@electron-forge/plugin-local-electron",\
			config: {\
				electronPath: "'"${electronDist}"'",\
			},\
		},\
	],' forge.config.*
    NODE_ENV=production     yarn run package
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -a "${srcdir}/${pkgname//-/.}/out/${pkgname%-git}-linux-"*"/resources/". "${pkgdir}/usr/lib/${pkgname%-git}/"
    _icon_sizes=(256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname//-/.}/assets/icon_${_icons}x32.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE.md" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
