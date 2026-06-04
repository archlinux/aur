# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=losslesscut-git
_pkgname=LosslessCut
_appname="no.mifi.${pkgname%-git}"
pkgver=3.69.0.r0.g260603c
_electronversion=42
_nodeversion=22
pkgrel=1
pkgdesc="The swiss army knife of lossless video/audio editing.Using system-wide ffmpeg.(Use system-wide electron)"
arch=('x86_64')
url="https://github.com/mifi/lossless-cut"
license=('GPL-2.0-only')
conflicts=(
    "${pkgname%-git}"
)
provides=(
    "${pkgname%-git}"
)
depends=(
    "electron${_electronversion}"
    'ffmpeg'
)
makedepends=(
    'git'
    'nvm'
    'npm'
    'gcc'
    'curl'
    'yarn'
    'jq'
)
source=(
    "${pkgname//-/.}::git+${url}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
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
    _elec_ver=$(find "${srcdir}" -maxdepth 5 -name "package.json" ! -path "*/node_modules/*" \
        -exec grep -l '"electron"' {} + | xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null | head -1)
    [[ -z "${_elec_ver}" ]] && return 1
    echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname//-/.}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-git}.sh"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
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
    find src -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-git}\'/g" {} +
    sed -e "
        s/\/app\/bin\/run.sh/${pkgname%-git}/g;
        s/${_appname}/${pkgname%-git}/g
    " -i "${_appname}.desktop"
    sed -i "s/${_appname}/${pkgname%-git}/g" "${_appname}.appdata.xml"
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    yarn config set --home enableTelemetry 0
    NODE_ENV=development    yarn add node-gyp
    NODE_ENV=development    yarn install
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    _ensure_local_nvm
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     yarn run build
    NODE_ENV=production     yarn electron-builder --linux dir -c.electronDist="${electronDist}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
    local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" ! -path "*/node_modules/*" -exec dirname {} + | head -n 1)
    cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-git}/"
    ln -sf "/usr/bin/ffmpeg" "${pkgdir}/usr/lib/${pkgname%-git}/ffmpeg"
    ln -sf "/usr/bin/ffprobe" "${pkgdir}/usr/lib/${pkgname%-git}/ffprobe"
    install -Dm644 "${srcdir}/${pkgname//-/.}/icon-build/app-512.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname//-/.}/${_appname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-git}.desktop"
    install -Dm644 "${srcdir}/${pkgname//-/.}/${_appname}.appdata.xml" "${pkgdir}/usr/share/appdata/${pkgname%-git}.appdata.xml"
}
