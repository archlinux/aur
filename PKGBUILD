# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=r3playx-git
_pkgname=R3PLAYX
pkgver=2.7.5.r26.g18fa22b
_electronversion=28
_nodeversion=18
pkgrel=1
pkgdesc="A music player forked from YesPlayMusic.(Use system-wide electron)高颜值的第三方网易云播放器."
arch=(
    'aarch64'
    'x86_64'
)
url="https://github.com/Sherlockouo/music"
license=('AGPL-3.0-only')
conflicts=(
    "${pkgname%-git}"
    "yesplaymusic"
    "r3play"
    "my-yesplaymusic"
)
provides=("yesplaymusic")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'git'
    'nvm'
    'npm'
    'pnpm'
    'curl'
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
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="AudioVideo" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
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
            export NPM_CONFIG_REGISTRY="https://registry.npmmirror.com"
            export NPM_CONFIG_ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
            export NPM_CONFIG_ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
            export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
            export ELECTRON_MIRROR="https://npmmirror.com/mirrors/electron/"
            export ELECTRON_BUILDER_BINARIES_MIRROR="https://npmmirror.com/mirrors/electron-builder-binaries/"
            export NODE_MIRROR="https://npmmirror.com/mirrors/node/"
            export npm_config_disturl="https://npmmirror.com/mirrors/node-shasum/"
            export npm_config_nodedir="/usr"
        }
    fi
    _ensure_local_nvm
    cp .env.example .env
    sed -i "s/'deb'/'dir'/g;s/'AppImage'/'dir'/g" packages/desktop/.electron-builder.config.js
    sed -i "s/\.\.\/resources\/bin\/better_sqlite3.node/\/usr\/lib\/${pkgname%-git}\/bin\/better_sqlite3.node/g" \
        packages/desktop/main/db.ts
    
    # 先安装依赖，忽略脚本
    NODE_ENV=development    pnpm install --ignore-scripts
    
    # 手动运行 Prisma 的 postinstall 脚本
    if [ -d "node_modules/@prisma/client" ]; then
        cd packages/server
        ../../node_modules/.bin/prisma generate
        cd ../..
    fi
    
    # 禁用 afterPack 钩子，因为我们不需要复制 better-sqlite3
    sed -i 's/afterPack: .*//g' packages/desktop/.electron-builder.config.js
    
    # 使用 Node.js 脚本精确修改 linux.target，只构建当前架构
    cat > modify_config.js << 'EOF'
const fs = require('fs');
const path = require('path');

const configPath = path.join(__dirname, 'packages/desktop/.electron-builder.config.js');
const config = require(configPath);

const CARCH = process.env.CARCH || 'x86_64';
let targetArch;

if (CARCH === 'aarch64') {
  targetArch = 'arm64';
} else {
  targetArch = 'x64';
}

config.linux = {
  target: [
    {
      target: 'dir',
      arch: [targetArch]
    }
  ],
  artifactName: '${productName}-${version}-${os}-${arch}.${ext}',
  category: 'Music',
  icon: './build/icon.png'
};

const newConfigContent = `/**
 * @type {import('electron-builder').Configuration}
 * @see https://www.electron.build/configuration/configuration
 */

const pkg = require('./package.json')
const electronVersion = pkg.devDependencies.electron.replaceAll('^', '')

module.exports = ${JSON.stringify(config, null, 2)}
`;

fs.writeFileSync(configPath, newConfigContent);
console.log(`Modified config to only build for ${targetArch}`);
EOF
    CARCH="${CARCH}" node modify_config.js
    rm -f modify_config.js
    
    # 然后处理 electron 模块 - 既简单又能工作的方案
    rm -rf node_modules/electron
    mkdir -p node_modules/electron
    local _electron_ver="28.3.3"
    echo "${_electron_ver}" > node_modules/electron/.npm-version
    cat > node_modules/electron/package.json << 'EOF'
{
  "name": "electron",
  "version": "28.3.3",
  "main": "index.js"
}
EOF
    cat > node_modules/electron/index.js << 'EOF'
const path = require('path');
module.exports = path.join(__dirname, 'electron', 'electron');
EOF
    ln -sf "/usr/lib/electron${_electronversion}" node_modules/electron/electron
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    _ensure_local_nvm
    local electronDist="/usr/lib/electron${_electronversion}"
    export ELECTRON_PATH="/usr/lib/electron${_electronversion}"
    
    NODE_ENV=production     pnpm exec turbo run build
    NODE_ENV=production     pnpm --filter desktop exec electron-builder build -c .electron-builder.config.js -c.electronDist="${electronDist}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
    local _app_dir=$(find "${srcdir}" -type f -name "resources.pak" ! -path "*/node_modules/*" -exec dirname {} + | head -n 1)
    cp -a "${_app_dir}/resources/". "${pkgdir}/usr/lib/${pkgname%-git}/"
    _icon_sizes=(16x16 24x24 32x32 64x64 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname//-/.}/packages/desktop/build/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
}