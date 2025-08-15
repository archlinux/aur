# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=flyenv-git
_pkgname=FlyEnv
pkgver=4.10.6.r3.g6d0d554
_electronversion=35
_nodeversion=22
pkgrel=1
pkgdesc="All-In-One Full-Stack Environment Management Tool.Help developers quickly set up a local development environment.(Use system-wide electron)"
arch=(
    'aarch64'
    'x86_64'
)
url="https://www.flyenv.com/"
_ghurl="https://github.com/xpf0000/FlyEnv"
license=('BSD-3-Clause')
depends=(
    "electron${_electronversion}"
    '7zip'
)
makedepends=(
    'git'
    'yarn'
    'curl'
    'gendesk'
    'nvm'
    'go'
)
optdepends=(
    'ollala'
    'apache'
    'caddy'
    'consul'
    'nginx'
    'tomcat10'
    'bun'
    'deno'
    'erlang'
    'go'
    'jdk-openjdk'
    'nodejs'
    'perl'
    'php'
    'python'
    'ruby'
    'rust'
    'mariadb'
    'mysql'
    'mongodb'
    'postgresql'
    'etcd'
    'memcached'
    'rabbitmq'
    'redis'
    'mailpit'
    'dnsmasq'
    'bind'
    'pure-ftpd'
    'minio'
)
source=(
    "${pkgname//-/.}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
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
prepare() {
    cd "${srcdir}/${pkgname//-/.}"
    sed -i -e "
        s/@electronversion@/${_electronversion}/
        s/@appname@/${pkgname%-git}/
        s/@runname@/app.asar/
        s/@cfgdirname@/${_pkgname}/
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/
    " "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Development" \
        --name="${_pkgname}" \
        --exec="${pkgname%-git} %U"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    mkdir -p "${srcdir}/.electron-gyp"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo -e '\n'
            echo 'registry "https://registry.npmmirror.com"'
            echo 'electron_mirror "https://registry.npmmirror.com/-/binary/electron/"'
            echo 'electron_builder_binaries_mirror "https://registry.npmmirror.com/-/binary/electron-builder-binaries/"'
            echo "cacheFolder "${srcdir}"/.yarn/cache"
            echo "pluginsFolder "${srcdir}"/.yarn/plugins"
            echo "globalFolder "${srcdir}"/.yarn/global"
            echo 'useHardlinks true'
            #echo 'buildFromSource true'
            echo 'linkWorkspacePackages true'
            echo 'fetchRetries 3'
            echo 'fetchRetryTimeout 10000'
            echo 'networkConcurrency 32'
        } >> .yarnrc
        export GOPROXY=https://goproxy.cn,direct
    fi
    sed -i "s/'deb'/'dir'/;s/'rpm'/'dir'/" configs/electron-builder.ts
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/;s/git pull \&\& //" package.json
    #NODE_ENV=development    yarn install --cache-folder "${srcdir}/.yarn_cache" --no-lockfile
    # Init notarize.ts File
    if [ -f build/notarize.ts ];then
        rm -rf build/notarize.ts
    fi
    mkdir -p build
    {
        echo 'export default async function notarizing() {'
        echo '  return;'
        echo '}'
    } >> build/notarize.ts
    # Build Go helper
    cd "${srcdir}/${pkgname//-/.}/src/helper-go"
    export CGO_ENABLED=1
    export GO111MODULE=on
    export GOOS=linux
    export GOCACHE="${srcdir}/go-build"
    export GOMODCACHE="${srcdir}/go/pkg/mod"
    chmod +x ./build-os.sh
    bash ./build-os.sh
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     yarn run build
    case "${CARCH}" in
        aarch64)
            rm -rf "${srcdir}/${pkgname//-/.}/release/linux-arm64-unpacked/resources/app.asar.unpacked/node_modules/7zip-bin/"{linux/{arm,ia32,x64},mac}
            ln -sf "/usr/bin/7za" "${srcdir}/${pkgname//-/.}/release/linux-arm64-unpacked/resources/app.asar.unpacked/node_modules/7zip-bin/linux/arm64/7za"
            ;;
        x86_64)
            rm -rf "${srcdir}/${pkgname//-/.}/release/linux-arm64-unpacked/resources/app.asar.unpacked/node_modules/7zip-bin/"{linux/{arm,arm64,ia32},mac}
            ln -sf "/usr/bin/7za" "${srcdir}/${pkgname//-/.}/release/linux-arm64-unpacked/resources/app.asar.unpacked/node_modules/7zip-bin/linux/x64/7za"
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    case "${CARCH}" in
        aarch64)
            _builddir=linux-arm64-unpacked
            ;;
        x86_64)
            _builddir=linux-unpacked
            ;;
    esac
    install -Dm644 "${srcdir}/${pkgname//-/.}/release/${_builddir}/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname//-/.}/release/${_builddir}/resources/"{app.asar.unpacked,helper} "${pkgdir}/usr/lib/${pkgname%-git}"
    _icon_sizes=(16x16 32x32 128x128 256x256 512x512)
    for _icons in "${_icon_sizes[@]}";do
        install -Dm644 "${srcdir}/${pkgname//-/.}/build/icons/${_icons}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
    done
    install -Dm644 "${srcdir}/${pkgname//-/.}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname//-/.}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}