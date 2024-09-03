# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Xiaozhu1337 <nihaoaheheda@gmail.com>
pkgname=siyuan
pkgver=3.1.5
_electronversion=30
_nodeversion=18
pkgrel=1
pkgdesc="A privacy-first, self-hosted, fully open source personal knowledge management software, written in typescript and golang."
arch=(
    'aarch64'
    'x86_64'
)
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
    'go'
    'pnpm'
    'git'
)
source=(
    "${pkgname}.git::git+${_ghurl}.git#tag=v${pkgver}"
    "${pkgname}.sh"
)
sha256sums=('cadb49d557c3fd68abd57622ca68946df4025005594ea2dfa6fe631da1067c9d'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
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
    gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Office" --name="${pkgname}" --exec="${pkgname} %U"
    sed "2i\Name[zh_CN]=思源笔记" -i "${srcdir}/${pkgname}.desktop"
    cd "${srcdir}/${pkgname}.git/app"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    export CGO_ENABLED=1
    export GO111MODULE=on
    export GOOS=linux
    export GOCACHE="${srcdir}/go-build"
    export GOMODCACHE="${srcdir}/go/pkg/mod"
    HOME="${srcdir}/.electron-gyp"
    echo 'build_from_source=true'  >> .npmrc
    echo 'link-workspace-packages=true'  >> .npmrc
    echo 'fetch-retry-maxtimeout=10000'  >> .npmrc
    echo "cache-dir="${srcdir}"/.pnpm_cache"  >> .npmrc
    echo "store-dir="${srcdir}"/.pnpm_store"  >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        echo 'registry=https://registry.npmmirror.com' >> .npmrc
        echo 'disturl=https://registry.npmmirror.com/-/binary/node/' >> .npmrc
        echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/' >> .npmrc
        echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/' >> .npmrc
        go env -w GOPROXY=https://goproxy.cn,direct

    else
        echo "Your network is OK."
    fi
    sed "/tar.gz/d;/deb/d;s|AppImage|dir|g;s|icon.icns|icon.png|g" -i electron-builder-linux.yml
    sed "s|tar.gz|dir|g;s|deb|dir|g;s|AppImage|dir|g;s|icon.icns|icon.png|g" -i electron-builder-linux-arm64.yml
    sed -i "s/\"electron\": \"\([^\"]*\)\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/" -i package.json
    NODE_ENV=development    pnpm install --no-frozen-lockfile
    NODE_ENV=production     pnpm run build
    cd "${srcdir}/${pkgname}.git/kernel"
    go build --tags fts5 -o "../app/kernel-linux/SiYuan-Kernel" -v -ldflags "-s -w -X github.com/siyuan-note/siyuan/kernel/util.Mode=prod"
    cd "${srcdir}/${pkgname}.git/app"
    case "${CARCH}" in
        aarch64)
            NODE_ENV=production pnpm run dist-linux-arm64
            ;;
        x86_64)
            NODE_ENV=production pnpm run dist-linux
            ;;
    esac
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/app/build/linux-"*/resources/pandoc.zip -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/app/build/linux-"*/resources/{app,appearance,changelogs,guide,kernel,stage} "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/app/src/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}