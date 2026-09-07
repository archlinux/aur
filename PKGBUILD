# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=cherry-studio-git
_pkgname="Cherry Studio"
pkgver=2.0.9.r297.g6beb5e1
_electronversion=41
_nodeversion=24.11.1
pkgrel=1
pkgdesc="🍒 Cherry Studio is a desktop client that supports for multiple LLM providers.(Use system-wide electron)"
arch=('any')
url="https://cherryai.com/"
_ghurl="https://github.com/CherryHQ/cherry-studio"
license=(
    'AGPL-3.0-or-later'
    'LicenseRef-custom'
)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
    'libevdev'
    'python'
    'python-yaml'
    'nodejs'
    'bun'
    'ripgrep'
    'uv'
    'mise'
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'git'
    'curl'
    'pnpm'
    'jq'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}"
    'build-better-sqlite3.sh'
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '4e7aa663647066f2b85226e010de351c9a24f991c6fea6621f2c6b5edd880baa'
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
        export PNPM_NODE_LINKER=isolated
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
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${_pkgname// /}/g
    " "${srcdir}/${pkgname%-git}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"    
    _set_build_env
    _ensure_local_nvm
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json    
    # Update better-sqlite3 release.json to match system electron version
    sed -i "s/\"electronVersion\": \"[^\"]*\"/\"electronVersion\": \"${SYSTEM_ELECTRON_VERSION}\"/g" \
        scripts/linux-native/release.json
    sed -i "s/electron-v[0-9]*\.[0-9]*\.[0-9]*/electron-v${SYSTEM_ELECTRON_VERSION}/g" \
        scripts/linux-native/release.json
    find src -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-git}\'/g" {} +
    
    # Patch download.js to disable downloading (use prebuilt from source)
    sed -i '/const temporaryDir = /,/^}$/c\
  const verified = verifyReleaseArtifact({ artifactPaths, assets, expected })\
  return { ...verified, cached: true, ...artifactPaths }\
}' scripts/linux-native/download.js    
    # Patch before-pack.js to skip download-binaries.js (we use system binaries)
    sed -i '/Downloading bundled binaries/,+2c\
  console.log(`Using system binaries for ${platform}-${arch}...`);\
  // Skip download - using system binaries via symlinks' scripts/before-pack.js    
    # Create placeholder binaries (will be replaced with symlinks in package())
    local _arch_name
    case "${CARCH}" in
        x86_64)  _arch_name="x64" ;;
        aarch64) _arch_name="arm64" ;;
    esac
    local _binaries_dir="resources/binaries/linux-${_arch_name}"
    mkdir -p "${_binaries_dir}"
    # Create empty placeholder files (electron-builder needs these to exist during packaging)
    touch "${_binaries_dir}/"{mise,bun,uv,uvx,rg}    
    NODE_ENV=development pnpm install --ignore-scripts
    NODE_ENV=development pnpm add -w -D node-abi    
    # Build better-sqlite3 from source and prepare cached artifact
    source "${srcdir}/build-better-sqlite3.sh"
    build_better_sqlite3 "${SYSTEM_ELECTRON_VERSION}" "${CARCH}" "${srcdir}"
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    _set_build_env
    _ensure_local_nvm    
    NODE_ENV=production     pnpm exec dotenv pnpm run build
    NODE_ENV=production     pnpm -c exec "electron-builder --linux dir -c.electronDist=${ELECTRON_DIST} --config electron-builder.yml"
    local _arch_rem
    local _app_dir=$(_get_app_dir)
    case "${CARCH}" in
        aarch64) _arch_rem="x64-*" ;;
        x86_64)  _arch_rem="arm64-*" ;;
    esac
    find "${_app_dir}/resources" -type d \( \
        -name "*darwin*" -o \
        -name "*win32*" -o \
        -name "${_arch_rem}" \
    \) -exec rm -rf {} +
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname%-git}/"
    rm -rf "${pkgdir}/usr/lib/${pkgname%-git}/default_app.asar"
    # Replace placeholder binaries with symlinks to system binaries
    local _arch_name
    case "${CARCH}" in
        x86_64)  _arch_name="x64" ;;
        aarch64) _arch_name="arm64" ;;
    esac
    local _binaries_dir="${pkgdir}/usr/lib/${pkgname%-git}/app.asar.unpacked/resources/binaries/linux-${_arch_name}"
    mkdir -p "${_binaries_dir}"
    rm -rf "${_binaries_dir}/"{mise,bun,uv,uvx,rg}
    ln -sf /usr/bin/mise "${_binaries_dir}/mise"
    ln -sf /usr/bin/bun "${_binaries_dir}/bun"
    ln -sf /usr/bin/uv "${_binaries_dir}/uv"
    ln -sf /usr/bin/uvx "${_binaries_dir}/uvx"
    ln -sf /usr/bin/rg "${_binaries_dir}/rg"    
    install -Dm644 "${srcdir}/${pkgname%-git}.git/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/build/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
