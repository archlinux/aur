# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tiny-rdm-git
_pkgname='Tiny RDM'
pkgver=1.2.3.r13.g2fb7e06
_nodeversion=20
pkgrel=1
pkgdesc="A modern lightweight cross-platform Redis desktop manager"
arch=('any')
url="https://redis.tinycraft.cc/"
_ghurl="https://github.com/tiny-craft/tiny-rdm"
license=('GPL-3.0-only')
conflicts=("${pkgname%-git}")
depends=(
    'gtk3'
    'webkit2gtk'
)
makedepends=(
    'nvm'
    'npm'
    'git'
    'go'
    'wails'
    'curl'
)
options=(
    '!strip'
)
source=(
    "${pkgname%-git}.git::git+${_ghurl}.git"
)
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname%-git}.git"
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
build() {
    _ensure_local_nvm
    cd "${srcdir}/${pkgname%-git}.git"
    HOME="${srcdir}/.electron-gyp"
    export CGO_ENABLED=1
    export GO111MODULE=on
    export GOOS=linux
    export GOCACHE="${srcdir}/go-build"
    export GOMODCACHE="${srcdir}/go/pkg/mod"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo "cache=${srcdir}/.npm_cache"
    } >> frontend/.npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo 'registry=https://registry.npmmirror.com'
            echo 'disturl=https://registry.npmmirror.com/-/binary/node/'
        } >> frontend/.npmrc
        export GOPROXY=https://goproxy.cn,direct
    fi
    export NODE_ENV=development
    wails build -platform linux -o "${pkgname%-git}"
    sed -e "
        s/{{.Info.ProductName}}/${_pkgname}/g
        s/\/usr\/local\/bin\/${pkgname%-git}/${pkgname%-git}/g
        s/{{.Info.Comments}}/${pkgdesc}/g
    " -i "build/linux/${pkgname%-git}_0.0.0_amd64/usr/share/applications/${pkgname%-git}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-git}.git/build/bin/${pkgname%-git}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/build/linux/${pkgname%-git}_0.0.0_amd64/usr/share/applications/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/build/appicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-git}.png"
    install -Dm644 "${srcdir}/${pkgname%-git}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname%-git}"
}