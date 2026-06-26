# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor and Ahthor: qier22 <qier222@outlook.com>
pkgname=yesplaymusic-git
_pkgname=YesPlayMusic
pkgver=0.4.10.r9.gdf075cc
_electronversion=13
_nodeversion=16
pkgrel=1
pkgdesc="A third party music application for Netease Music.(Use system-wide electron).高颜值的第三方网易云播放器."
arch=('any')
url="https://music.qier222.com/"
_ghurl="https://github.com/qier222/YesPlayMusic"
license=('MIT')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=(
    "${pkgname%-git}"
    "my-${pkgname%-git}"
    "${pkgname%-git}-appimage"
    "${pkgname%-git}osd-electron"
    "${pkgname%-git}osd-origin"
    "r3play"
    "r3playx"
)
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'curl'
    'yarn'
    'gendesk'
    'jq'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
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
_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
}
_set_build_env() {
    export electronDist="/usr/lib/electron${_electronversion}"
	export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
	export HOME="${srcdir}/.electron-gyp"
	mkdir -p "${srcdir}/.electron-gyp"
	if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
		{
			export YARN_REGISTRY="https://registry.npmmirror.com"
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
        s/@cfgdirname@/${pkgname%-git}/g
    " "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="AudioVideo" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    _set_build_env
    _ensure_local_nvm
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    sed -i "/productName: 'YesPlayMusic'/a\\
        electronDist: \"/usr/lib/electron${_electronversion}\"," vue.config.js
    NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache"
    echo "/usr/lib/electron${_electronversion}/electron" > node_modules/electron/path.txt
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    _set_build_env
    _ensure_local_nvm
    DISABLE_ESLINT_PLUGIN=true NODE_ENV=production     yarn run electron:build-linux --dir
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
    local _app_dir=$(_get_app_dir)
    cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-git}/"
    _icon_sizes=(16x16 24x24 32x32 48x48 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname//-/.}/build/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}