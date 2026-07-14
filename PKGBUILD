# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Ian MacKay <immackay0@gmail.com>
# Contributor: Mikel Pintado <mikelaitornube2010@gmail.com>
# Contributor: Jiawen Geng
pkgname=github-desktop-git
_pkgname="GitHub Desktop"
pkgver=release.2.9.10.r5357.gcab1d2c
_electronversion=32
_nodeversion=20
pkgrel=1
pkgdesc="GUI for managing Git and GitHub.Use system-wide electron."
arch=(
    'aarch64'
    'armv7h'
    'x86_64'
)
url="https://github.com/shiftkey/desktop"
license=('MIT')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}=${pkgver%.r*}")
depends=(
    "electron${_electronversion}"
    'perl'
    'curl'
    'libsecret'
    'git'
)
makedepends=(
    'npm'
    'yarn'
    'nvm'
    'gendesk'
    'jq'
)
source=(
    "${pkgname%-git}.git::git+${url}.git"
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
_get_electron_version() {
    _elec_ver=$(find "${srcdir}" -maxdepth 5 -name "package.json" ! -path "*/node_modules/*" \
        -exec grep -l '"electron"' {} + | xargs -I{} jq -r '(.devDependencies.electron // .dependencies.electron) // empty' {} 2>/dev/null | head -1)
    [[ -z "${_elec_ver}" ]] && return 1
    echo -e "The electron version is: \033[1;31m${_elec_ver%%.*}\033[0m"
}
_set_build_env() {
    export ELECTRON_DIST="/usr/lib/electron${_electronversion}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    case "${CARCH}" in
        x86_64)  _target_arch="x64" ;;
        aarch64) _target_arch="arm64" ;;
        armv7h)  _target_arch="arm" ;;
        *)       _target_arch="x64" ;;
    esac
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            export YARN_REGISTRY="https://registry.npmmirror.com"
            export ELECTRON_MIRROR="https://registry.npmmirror.com/-/binary/electron/"
            export ELECTRON_BUILDER_BINARIES_MIRROR="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"
            export NODEJS_ORG_MIRROR="https://npmmirror.com/mirrors/node"
            export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
            export npm_config_runtime="electron"
            export npm_config_build_from_source="true"
            export npm_config_target_arch="${_target_arch}"
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
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    _set_build_env
    _ensure_local_nvm
    rm -rf dist node_mudules out
	sed -i "/compile:prod/s/4096/4096 --openssl-legacy-provider/g" package.json
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    sed -i "s/AppImage/dir/g" script/electron-builder-linux.yml
    sed -i "/nativeTheme.addListener('updated',/s/(event: string, userInfo: any) =>/() =>/" app/src/main-process/app-window.ts
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        find . -type f -name "embedded-git.json" -exec sed -i 's|https://github.com/|https://gh-proxy.com/https://github.com/|g' {} +
        local _electron_headers_url="https://artifacts.electronjs.org/headers/dist/v${SYSTEM_ELECTRON_VERSION}/node-v${SYSTEM_ELECTRON_VERSION}-headers.tar.gz"
        local _headers_dir="${HOME}/.electron-gyp/${SYSTEM_ELECTRON_VERSION}"
        mkdir -p "${_headers_dir}"
        if [[ ! -f "${_headers_dir}/common.gypi" ]]; then
            msg2 "Downloading Electron headers..."
            curl -L "${_electron_headers_url}" -o "${srcdir}/electron-headers.tar.gz"
            cd "${_headers_dir}"
            tar -xzf "${srcdir}/electron-headers.tar.gz" --strip-components=1
            cd "${srcdir}/${pkgname%-git}.git"
        fi
        export npm_config_nodedir="${_headers_dir}"
    fi
    NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache"
}
build() {
    cd "${srcdir}/${pkgname%-git}.git"
    NODE_ENV=production     yarn run build:prod
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm755 -d "${pkgdir}/usr/lib/${pkgname%-git}"
	local _app_dir=$(_get_app_dir)
	cp -a "${_app_dir}/resources/"* "${pkgdir}/usr/lib/${pkgname%-git}/"
    _icon_sizes=(32x32 64x64 128x128 256x256 512x512 1024x1024)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname%-git}.git/app/static/linux/logos/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname%-git}.git/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
    # Replace bundled git (~99MB) with symlinks to system packages
    rm -rf "${pkgdir}/usr/lib/${pkgname%-git}/app/git"
    mkdir -p "${pkgdir}/usr/lib/${pkgname%-git}/app/git/bin"
    mkdir -p "${pkgdir}/usr/lib/${pkgname%-git}/app/git/libexec"
    mkdir -p "${pkgdir}/usr/lib/${pkgname%-git}/app/git/share/git-core"
    mkdir -p "${pkgdir}/usr/lib/${pkgname%-git}/app/git/ssl"
    mkdir -p "${pkgdir}/usr/lib/${pkgname%-git}/app/git/etc"
    ln -s /usr/bin/git "${pkgdir}/usr/lib/${pkgname%-git}/app/git/bin/git"
    ln -s /usr/bin/scalar "${pkgdir}/usr/lib/${pkgname%-git}/app/git/bin/scalar"
    ln -s /usr/lib/git-core "${pkgdir}/usr/lib/${pkgname%-git}/app/git/libexec/git-core"
    ln -s /usr/share/git-core/templates "${pkgdir}/usr/lib/${pkgname%-git}/app/git/share/git-core/templates"
    touch "${pkgdir}/usr/lib/${pkgname%-git}/app/git/etc/gitconfig"
    ln -s /etc/ssl/certs/ca-certificates.crt "${pkgdir}/usr/lib/${pkgname%-git}/app/git/ssl/cacert.pem"
}
