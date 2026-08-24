# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=fusionkit-git
_pkgname=FusionKit
pkgver=0.3.0.r0.g6e73d37
_electronversion=41
_nodeversion=24
pkgrel=1
pkgdesc="Desktop toolbox,integrated with subtitle processing(AI translation,format conversion),batch renaming of files,paid music decryption(to FLAC/MP3) and other practical functions.(Use system-wide electron)"
arch=('any')
url="https://github.com/QiuYeDx/FusionKit"
license=('MIT')
provides=("${pkgname%-git}=${pkgver%.r*}")
conflicts=("${pkgname%-git}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'curl'
    'gendesk'
    'icoutils'
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
    git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//g;s/public.beta.//g' ||
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
    {
        export PNPM_LINK_WORKSPACE_PACKAGES=true
        export PNPM_FETCH_RETRY_MAXTIMEOUT=10000
        export PNPM_CACHE_DIR="${srcdir}/.pnpm_cache"
        export PNPM_STORE_DIR="${srcdir}/.pnpm_store"
        export PNPM_VIRTUAL_STORE_DIR="${srcdir}/.pnpm_store"
        export PNPM_SHAMEFULLY_HOIST=true
        export PNPM_VIRTUAL_STORE_DIR_MAX_LENGTH=80
        export PNPM_NODE_LINKER=hoisted
        export PNPM_NETWORK_CONCURRENCY=32
    }
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            export pnpm_config_registry="https://registry.npmmirror.com"
            export npm_config_registry="https://registry.npmmirror.com"
            export NPM_CONFIG_ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
            export NPM_CONFIG_ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
            export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
        }
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
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname%-git}/g
    " "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    _set_build_env
    _ensure_local_nvm
    find src -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-git}\'/g" {} +
    sed -i "s/\/\${version}//g" electron-builder.json
    icotool -x "public/${_pkgname}.ico" -o "public/${pkgname%-git}.png"
    cp "public/${_pkgname}.ico" "public/favicon.ico"
    sed -i "s/${_pkgname}.ico/${pkgname%-git}.png/g" electron/main/index.ts
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    # 移除 Linux 构建不需要的 beforePack 钩子和 extraResources（仅 macOS/Windows 需要）
    python3 -c "
import json
with open('electron-builder.json', 'r') as f:
    config = json.load(f)
config.pop('beforePack', None)
config.pop('extraResources', None)
with open('electron-builder.json', 'w') as f:
    json.dump(config, f, indent=2)
"
    NODE_ENV=development    pnpm add -D node-gyp node-pty node-addon-api
    # 升级 TypeScript 以支持 gpt-tokenizer 的新语法
    NODE_ENV=development    pnpm add -D typescript@latest
    # 修复 tsconfig.json 以兼容 TypeScript 7.x
    sed -i '/"esModuleInterop"/d' tsconfig.json
    sed -i 's/"moduleResolution": "Node"/"moduleResolution": "bundler"/' tsconfig.json
    sed -i '/"baseUrl"/d' tsconfig.json
    sed -i 's|"src/\*"|"./src/*"|' tsconfig.json
    NODE_ENV=development    pnpm install
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    _set_build_env
    _ensure_local_nvm
    NODE_ENV=production     npx tsc
    NODE_ENV=production     npx vite build
    NODE_ENV=production     node scripts/check-preload-bundle.mjs
    NODE_ENV=production     pnpm -c exec "electron-builder --linux dir -c.electronDist=${ELECTRON_DIST} --config electron-builder.json"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname%-git}/"
    install -Dm644 "${srcdir}/${pkgname//-/.}/public/${pkgname%-git}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}