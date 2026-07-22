# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=redisinsight-git
_pkgname='Redis Insight'
pkgver=3.8.0.r27.g723eb3c
_electronversion=41
_nodeversion=24
pkgrel=1
pkgdesc="Desktop manager that provides an intuitive and efficient GUI for Redis, allowing you to interact with your databases, monitor, and manage your data."
arch=('any')
url="https://redis.io/insight/"
_ghurl="https://github.com/RedisInsight/RedisInsight"
license=('SSPL-1.0')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    'gtk3'
    'alsa-lib'
    'nss'
    'libsecret'
    'nodejs'
)
makedepends=(
    'npm'
    'yarn'
    'git'
    'nvm'
    'gendesk'
    'curl'
    'jq'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
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
_set_build_env() {
    export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            export YARN_REGISTRY="https://mirrors.cloud.tencent.com/npm/"
            export ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
            export ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
            export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
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
}
_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
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
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Development" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} --no-sandbox %U"
    _set_build_env
    _ensure_local_nvm
    #find "${pkgname%-git}" -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-git}\'/g" {} +
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" -i package.json
    NODE_ENV=development    yarn --cwd "${pkgname%-git}" add -D "${pkgname%-git}-plugin-sdk" "react-json-tree" "@antv/x6" "@antv/x6-react-shape" "plotly.js-dist-min" "@antv/hierarchy"
    NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache"
    NODE_ENV=development    yarn add -D "parcel" "@parcel/transformer-sass" "@parcel/transformer-less" "@nestjs/cli"
    NODE_ENV=development    yarn --cwd "${pkgname%-git}"/api/ install --cache-folder "${srcdir}/.yarn_cache"
    # Fix vite file: reference for ui/src/packages plugins
    mkdir -p "${pkgname%-git}/ui/src/packages/node_modules"
    local _node_modules="${srcdir}/${pkgname//-/.}/node_modules"
    local _pkg_node_modules="${pkgname%-git}/ui/src/packages/node_modules"
    ln -sf "${_node_modules}/vite" "${_pkg_node_modules}/vite"
    ln -sf "${_node_modules}/vite-plugin-static-copy" "${_pkg_node_modules}/vite-plugin-static-copy"
    ln -sf "${_node_modules}/vite-plugin-ejs" "${_pkg_node_modules}/vite-plugin-ejs"
    ln -sf "${_node_modules}/@vitejs/plugin-react" "${_pkg_node_modules}/@vitejs/plugin-react"
    ln -sf "${_node_modules}/vite-plugin-svgr" "${_pkg_node_modules}/vite-plugin-svgr"
    ln -sf "${_node_modules}/esbuild" "${_pkg_node_modules}/esbuild"
    ln -sf "${_node_modules}/dotenv" "${_pkg_node_modules}/dotenv"
    ln -sf "${_node_modules}/react" "${_pkg_node_modules}/react"
    ln -sf "${_node_modules}/react-dom" "${_pkg_node_modules}/react-dom"
    ln -sf "${_node_modules}/@types/react" "${_pkg_node_modules}/@types/react"
    ln -sf "${_node_modules}/@types/react-dom" "${_pkg_node_modules}/@types/react-dom"
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    _set_build_env
    _ensure_local_nvm
    NODE_ENV=production     npx patch-package
    NODE_ENV=production     yarn run build:statics
    NODE_ENV=production     yarn ts-node ./scripts/prebuild.js dist
    NODE_ENV=production     yarn run build:prod
    NODE_ENV=production     yarn electron-builder --linux dir -c.electronDist="${ELECTRON_DIST}" --config="electron-builder.json"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname%-git}"}
    local _app_dir=$(_get_app_dir)
    cp -a "${_app_dir}"/* "${pkgdir}/usr/lib/${pkgname%-git}"
    ln -sf "/usr/lib/${pkgname%-git}/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 96x96 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname//-/.}/resources/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
