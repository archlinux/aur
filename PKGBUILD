# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tiny-rdm
_pkgname='Tiny RDM'
pkgver=1.2.5
_nodeversion=20
pkgrel=1
pkgdesc="A modern lightweight cross-platform Redis desktop manager"
arch=('any')
url="https://redis.tinycraft.cc/"
_ghurl="https://github.com/tiny-craft/tiny-rdm"
license=('GPL-3.0-only')
conflicts=("${pkgname}")
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
    "${pkgname}.git::git+${_ghurl}.git#tag=v${pkgver}"
)
sha256sums=('070c20510268211f44685f0bb8248c13c6fc9f16a5f0e4c91c7608ca9122790e')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    _ensure_local_nvm
    cd "${srcdir}/${pkgname}.git"
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
        echo "maxsockets=32"
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
    sed -i -e "
        s/{{.Info.ProductName}}/${_pkgname}/g
        s/\/usr\/local\/bin\/${pkgname%-git}/${pkgname%-git}/g
        s/{{.Info.Comments}}/${pkgdesc}/g
    " "build/linux/${pkgname%-git}_"*/usr/share/applications/"${pkgname%-git}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.git/build/bin/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname}.git/build/linux/${pkgname}_"*/usr/share/applications/"${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/build/appicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
