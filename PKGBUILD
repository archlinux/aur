# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Xiaozhu1337 <nihaoaheheda@gmail.com>
pkgname=siyuan
pkgver=3.0.16
_electronversion=28
_nodeversion=18
pkgrel=1
pkgdesc="A privacy-first, self-hosted, fully open source personal knowledge management software, written in typescript and golang."
arch=('x86_64')
url="https://b3log.org/siyuan"
_ghurl="https://github.com/siyuan-note/siyuan"
license=('AGPL-3.0-only')
conflicts=(
    "${pkgname}"
    "${pkgname}-note"
)
provides=("${pkgname}")
depends=(
    "electron${_electronversion}"
)
makedepends=(
    'gendesk'
    'curl'
    'nvm'
    'npm'
    'go>=1.22'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('caf541d341ac0650ee556458db60971ff96cdac9c4ea8efaf1de3469dcd12df1'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app|g" \
        -e "s|@cfgdirname@|SiYuan-Electron|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories="Office" --name="${pkgname}" --exec="${pkgname} %U"
    sed "2i\Name[zh_CN]=思源笔记" -i "${srcdir}/${pkgname}.desktop"
    cd "${srcdir}/${pkgname}-${pkgver}/app"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    #export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    #export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    #export ELECTRONVERSION="${_electronversion}"
    HOME="${srcdir}/.electron-gyp"
    pnpm config set store-dir "${srcdir}/.pnpm_store"
    pnpm config set cache-dir "${srcdir}/.pnpm_cache"
    pnpm config set link-workspace-packages true
    export CGO_ENABLED=1
    export GO111MODULE=on
    export GOOS=linux
    export GOCACHE="${srcdir}/go-build"
    export GOMODCACHE="${srcdir}/go/pkg/mod"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
        export npm_config_registry=https://registry.npmmirror.com
        export npm_config_disturl=https://registry.npmmirror.com/-/binary/node/
        export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
        export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
        export GOPROXY=https://goproxy.cn
    else
        echo "Your network is OK."
    fi
    sed "/tar.gz/d;s|AppImage|dir|g" -i electron-builder-linux.yml
    sed "/pnpm@9.0.6/d" -i package.json
    pnpm install --no-frozen-lockfile
    pnpm run build
    cd "${srcdir}/${pkgname}-${pkgver}/kernel"
    go build --tags fts5 -o "../app/kernel-linux/SiYuan-Kernel" -v -ldflags "-s -w -X github.com/siyuan-note/siyuan/kernel/util.Mode=prod"
    cd "${srcdir}/${pkgname}-${pkgver}/app"
    pnpm run dist-linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/app/build/linux-"*/resources/pandoc.zip -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}-${pkgver}/app/build/linux-"*/resources/{app,appearance,guide,kernel,stage} "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/app/appearance/boot/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}