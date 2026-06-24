# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=smartsub-git
_pkgname=SmartSub
_zhsname='妙幕'
pkgver=3.1.0.r0.ge8f972c
_electronversion=30
_nodeversion=20
pkgrel=1
pkgdesc="Generate subtitle files for video or audio in batches, and support subtitle translation. Support Baidu, Volcano, OpenAI, Olama, Deepseek and other translations.(Use system-wide electron)"
arch=('x86_64')
url="https://smartsub.linxiaodong.com/"
_ghurl="https://github.com/buxuku/SmartSub"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
    'python-openai-whisper'
    'ffmpeg'
    'nodejs'
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'git'
    'curl'
    'yarn'
    'jq'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'a774c2f54fbbeeaac3cefc0f7250796d30c86d27f0fd40b7eaf9c0fdb021623d')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
    set -o pipefail
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
_get_app_dir() {
    find "${srcdir}" -type f -name "resources.pak" -exec dirname {} + | head -n 1
}
_set_build_env() {
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
	export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
	local HOME="${srcdir}/.electron-gyp"
    local electronDist="/usr/lib/electron${_electronversion}"
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
    cd "${srcdir}/${pkgname%-git}.git"
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname}/g
    " "${srcdir}/${pkgname%-git}.sh"
    _get_electron_version
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="AudioVideo" \
        --name="${_pkgname}" \
        --custom=Name[zh_CN]="${_zhsname}" \
        --exec="${pkgname%-git} %U"
    _set_build_env
    _ensure_local_nvm
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    find main -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-git}\'/g" {} +
    NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache"
    NODE_ENV=development    yarn sherpa:fetch
    curl -L -o "${srcdir}/addon-linux-x64.node" \
        "https://github.com/buxuku/whisper.cpp/releases/download/latest/addon-linux-x64.node"
    curl -L -o "${srcdir}/addon-linux-vulkan.node.gz" \
        "https://github.com/buxuku/whisper.cpp/releases/download/latest/addon-linux-vulkan.node.gz"
    cp "${srcdir}/addon-linux-x64.node" extraResources/addons/addon.node
    gunzip -c "${srcdir}/addon-linux-vulkan.node.gz" > extraResources/addons/addon.vulkan.node
    BUILD_PLATFORM=linux BUILD_ARCH=x64 node scripts/inject-build-info.js
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    _set_build_env
    _ensure_local_nvm
    NODE_ENV=production     yarn run build
    NODE_ENV=production     yarn electron-builder --linux dir -c.electronDist="${electronDist}" --config=electron-builder.yml
    local _app_dir=$(_get_app_dir)
    ln -sf "/usr/bin/ffmpeg" "${_app_dir}/resources/app.asar.unpacked/node_modules/ffmpeg-static/ffmpeg"
    ln -sf "/usr/bin/ffmpeg" "${_app_dir}/resources/app.asar.unpacked/node_modules/@ffmpeg-installer/linux-x64/ffmpeg"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
    local _app_dir=$(_get_app_dir)
    cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-git}/"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/resources/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
