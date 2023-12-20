# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=siyuan-git
pkgver=2.11.3.r0.gfd0e44fbf
_electronversion=27
_nodeversion=18
pkgrel=1
pkgdesc="A privacy-first, self-hosted, fully open source personal knowledge management software, written in typescript and golang."
arch=('any')
url="https://b3log.org/siyuan"
_ghurl="https://github.com/siyuan-note/siyuan"
license=('AGPL3')
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
    'go>=1.21'
    'pnpm'
)
source=(
    "${pkgname%-git}::git+${_ghurl}.git"
    "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            '5ce46265f0335b03568aa06f7b4c57c5f8ffade7a226489ea39796be91a511bf')
pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname%-git}|g" \
        -e "s|@appasar@|app|g" \
        -i "${srcdir}/${pkgname%-git}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --categories "Utility" --name="${pkgname%-git}" --exec="${pkgname%-git}"
    sed "2i Name[zh_CN]=思源笔记" -i "${srcdir}/${pkgname%-git}.desktop"
    cd "${srcdir}/${pkgname%-git}/app"
    export npm_config_build_from_source=true
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    export ELECTRONVERSION="${_electronversion}"
    pnpm config set store-dir "${srcdir}/.pnpm_store"
    pnpm config set cache-dir "${srcdir}/.pnpm_cache"
    pnpm config set link-workspace-packages true
    sed '/- target: "tar.gz"/d' -i electron-builder-linux.yml
    pnpm install --no-frozen-lockfile
    pnpm run build
    cd "${srcdir}/${pkgname%-git}/kernel"
    export CGO_ENABLED=1
    export GOCACHE="${srcdir}/go-build"
    export GOMODCACHE="${srcdir}/go/pkg/mod"
    #For Chinese Only
    #export GOPROXY=https://goproxy.cn,direct
    go build --tags fts5 -o "../app/kernel-linux/SiYuan-Kernel" -v -ldflags "-s -w -X github.com/siyuan-note/siyuan/kernel/util.Mode=prod"
    cd "${srcdir}/${pkgname%-git}/app"
    pnpm run dist-linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}/app/build/linux-unpacked/resources/pandoc.zip" -t "${pkgdir}/usr/lib/${pkgname%-git}"
    cp -r "${srcdir}/${pkgname%-git}/app/build/linux-unpacked/resources/"{app,appearance,guide,kernel,stage} "${pkgdir}/usr/lib/${pkgname%-git}"
    install -Dm644 "${srcdir}/${pkgname%-git}/app/appearance/boot/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
}