# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=siyuan-git
pkgver=3.4.0.r0.gc58e626
_electronversion=38
_nodeversion=22
pkgrel=1
pkgdesc="A privacy-first, self-hosted, fully open source personal knowledge management software, written in typescript and golang.(Use system-wide electron)"
arch=('x86_64')
url="https://b3log.org/siyuan"
_ghurl="https://github.com/siyuan-note/siyuan"
license=('AGPL-3.0-only')
conflicts=(
    "${pkgname%-git}"
    "${pkgname%-git}-note"
)
provides=(
    "${pkgname%-git}"
)
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'git'
    'nvm'
    'npm'
    'go'
    'curl'
    'pnpm'
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
_get_electron_version() {
    _elec_ver="$(grep '^ *"electron": *"' "${srcdir}/${pkgname//-/.}/app/package.json" | cut -d'"' -f4 | cut -d. -f1)"
    echo -e "The electron version is: \033[1;31m${_elec_ver}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname//-/.}/app"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname%-git}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/SiYuan-Electron/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n \
        --pkgname="${pkgname%-git}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Office" \
        --name="${pkgname%-git}" \
        --exec="${pkgname%-git} %U" \
        --custom="Name[zh_CN]=思源笔记"
    export CGO_ENABLED=1
    export GO111MODULE=on
    export GOOS=linux
    export GOCACHE="${srcdir}/go-build"
    export GOMODCACHE="${srcdir}/go/pkg/mod"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo 'link-workspace-packages=true'
        echo 'fetch-retry-maxtimeout=10000'
        echo "cache-dir="${srcdir}"/.pnpm_cache"
        echo "store-dir="${srcdir}"/.pnpm_store"
        echo "shamefully-hoist=true"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo 'registry=https://registry.npmmirror.com'
            echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/'
            echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/'
        } >> .npmrc
        go env -w GOPROXY=https://goproxy.cn,direct
    fi
    sed -i "/build:mobile/d;s/\"electron\": \"\([^\"]*\)\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    pnpm install --no-frozen-lockfile
}
build() {
    cd "${srcdir}/${pkgname//-/.}/app"
    NODE_ENV=production     pnpm run build
    cd "${srcdir}/${pkgname//-/.}/kernel"
    case "${CARCH}" in
        aarch64)
            _CFG_FILE=electron-builder-linux-arm64.yml
            _KERNEL_DIR=kernel-linux-arm64
            ;;
        x86_64)
            _CFG_FILE=electron-builder-linux.yml
            _KERNEL_DIR=kernel-linux
            ;;
    esac
    go build --tags fts5 -o "../app/${_KERNEL_DIR}/SiYuan-Kernel" -v -ldflags "-s -w -X github.com/siyuan-note/siyuan/kernel/util.Mode=prod"
    cd "${srcdir}/${pkgname//-/.}/app"
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production pnpm -c exec "electron-builder --linux dir -c.electronDist=${electronDist} --config ${_CFG_FILE} "
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/app/build/linux-"*/resources/pandoc.zip -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname//-/.}/app/build/linux-"*/resources/{app,appearance,guide,kernel,stage} "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname//-/.}/app/appearance/boot/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname//-/.}/app/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
}
