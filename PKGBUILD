# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=openmtp-git
_pkgname=OpenMTP
pkgver=3.3.0.r1.g1c38907
_electronversion=18
_nodeversion=16.17.0
pkgrel=1
pkgdesc="Advanced Android File Transfer Application.(Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://openmtp.ganeshrvel.com/"
_ghurl="https://github.com/ganeshrvel/openmtp"
license=("MIT")
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'npm'
    'git'
    'nvm'
    'gendesk'
    'gcc'
    'cmake'
    'curl'
    'yarn'
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
_set_build_env() {
    export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
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
            export NODE_TLS_REJECT_UNAUTHORIZED=0
            export npm_config_strict_ssl=false
            export SENTRYCLI_CDNURL="https://registry.npmmirror.com/-/binary/sentry-cli"
        }
        # 创建 .yarnrc 文件强制 yarn 使用镜像
        cat > "${srcdir}/${pkgname//-/.}/.yarnrc" << 'EOF'
registry "https://registry.npmmirror.com"
EOF
        find "${srcdir}/${pkgname//-/.}" -type f -name "yarn.lock" -exec \
            sed -i "s/registry.yarnpkg.com/registry.npmmirror.com/g;s/registry.npmjs.org/registry.npmmirror.com/g" {} +
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
    sed "/node-mac-permissions/d" -i package.json
    # 修复 node-mac-permissions 在 Linux 上的导入问题
    sed -i '/const { askForFoldersAccess, askForPhotosAccess } = await import(/,/);/c\
    // Only available on macOS\
    let askForFoldersAccess, askForPhotosAccess;\
    try {\
      const macPermissions = await import(\
        // eslint-disable-next-line import/no-unresolved\
        '\''node-mac-permissions'\''\
      );\
      askForFoldersAccess = macPermissions.askForFoldersAccess;\
      askForPhotosAccess = macPermissions.askForPhotosAccess;\
    } catch (e) {\
      // Module not available (e.g., on Linux), return true\
      return true;\
    }' app/data/file-explorer/data-sources/FileExplorerLocalDataSource.js
    # 修复 Linux 上 isKalamModeSupported 返回错误结果的问题
    sed -i 's/export function isKalamModeSupported() {/export function isKalamModeSupported() {\n  \/\/ Kalam mode is only supported on macOS\n  if (getPlatform() !== '\''mac'\'') {\n    return false;\n  }/' app/helpers/binaries.js
    # 修复 FileExplorerRepository.js 在 Linux 上导入 Kalam 的问题 - 使用动态导入
    cat > /tmp/kalam_import_patch.py << 'PYTHON_EOF'
import re

with open('app/data/file-explorer/repositories/FileExplorerRepository.js', 'r') as f:
    content = f.read()

# Replace the static import with a conditional dynamic import
old_import = "import { FileExplorerKalamDataSource } from '../data-sources/FileExplorerKalamDataSource';"
new_import = """// Kalam is only supported on macOS, use dynamic import to prevent loading on Linux
let FileExplorerKalamDataSource = null;
async function getKalamDataSource() {
  if (!FileExplorerKalamDataSource) {
    try {
      const module = await import('../data-sources/FileExplorerKalamDataSource');
      FileExplorerKalamDataSource = module.FileExplorerKalamDataSource;
    } catch (e) {
      // Module not available (e.g., on Linux)
      return null;
    }
  }
  return FileExplorerKalamDataSource;
}"""

content = content.replace(old_import, new_import)

# Replace constructor to not initialize kalamMtpDataSource
content = content.replace(
    'this.kalamMtpDataSource = new FileExplorerKalamDataSource();',
    'this.kalamMtpDataSource = null; // Will be initialized lazily on macOS'
)

with open('app/data/file-explorer/repositories/FileExplorerRepository.js', 'w') as f:
    f.write(content)
PYTHON_EOF
    python3 /tmp/kalam_import_patch.py
    # 修复 Linux 图标配置
    sed -i "s/linux: {/linux: {\n      icon: 'build\/icons\/',/" electron-builder-config.js
    NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache"
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    _set_build_env
    _ensure_local_nvm
    NODE_ENV=production     yarn build-no-verify
    NODE_ENV=production     yarn electron-builder build --linux dir -c.electronDist="${ELECTRON_DIST}" --config electron-builder-config.js
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname%-git}/"
    icon_sizes=(16x16 32x32 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname%-git}.git/build/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}