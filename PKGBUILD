# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Xiaozhu1337 <nihaoaheheda@gmail.com>
pkgname=siyuan
pkgver=3.1.7
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
sha256sums=('92ebbff96d7b58e121cc11b6c3042ea7a22df98a472a244f4b831af8eb2866b4'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/SiYuan-Electron/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Office" --name="${pkgname}" --exec="${pkgname} %U"
    sed "2i\Name[zh_CN]=思源笔记" -i "${srcdir}/${pkgname}.desktop"
    cd "${srcdir}/${pkgname}.git/app"
    export CGO_ENABLED=1
    export GO111MODULE=on
    export GOOS=linux
    export GOCACHE="${srcdir}/go-build"
    export GOMODCACHE="${srcdir}/go/pkg/mod"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    HOME="${srcdir}/.electron-gyp"
    echo -e '\n' >> .npmrc
    #echo 'build_from_source=true' >> .npmrc
    echo "cache=${srcdir}/.npm_cache" >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
    {
        echo 'registry=https://registry.npmmirror.com'
        echo 'disturl=https://registry.npmmirror.com/-/binary/node/'
        echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/'
        echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/'
    } >> .npmrc
    go env -w GOPROXY=https://goproxy.cn,direct
    fi
    sed -i "/tar.gz/d;/deb/d;s/AppImage/dir/;s/icon.icns/icon.png/g" {electron-builder-linux.yml,electron-builder-linux-arm64.yml}
    sed -i "s/\"electron\": \"\([^\"]*\)\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/" -i package.json
    NODE_ENV=development    pnpm install --no-frozen-lockfile
    NODE_ENV=production     pnpm run build
    cd "${srcdir}/${pkgname}.git/kernel"
    go build --tags fts5 -o "../app/kernel-linux/SiYuan-Kernel" -v -ldflags "-s -w -X github.com/siyuan-note/siyuan/kernel/util.Mode=prod"
    cd "${srcdir}/${pkgname}.git/app"
    case "${CARCH}" in
        aarch64)
            _CFG_FILE=electron-builder-linux-arm64.yml
            ;;
        x86_64)
            _CFG_FILE=electron-builder-linux.yml
            ;;
    esac
    NODE_ENV=production npx electron-builder -l --dir --config "${_CFG_FILE}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/app/build/linux-"*/resources/pandoc.zip -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/app/build/linux-"*/resources/{app,appearance,changelogs,guide,kernel,stage} "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/app/src/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}