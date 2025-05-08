# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pandora-box
_pkgname=Pandora-Box
pkgver=0.2.29
_nodeversion=20
pkgrel=1
pkgdesc="A Simple Mihomo GUI.(Written in Go)"
arch=('any')
url="https://github.com/snakem982/Pandora-Box"
license=('GPL-3.0-only')
depends=(
    'webkit2gtk'
    'gtk3'
    'libsoup'
    'mihomo'
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'go'
    'wails'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}"
)
sha256sums=('00bb3b9aa1c8132de836a0b6fad6279e66801660beab5ec5e86806e7cd01c974')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}/frontend"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Network" --name="${_pkgname}" --exec="${pkgname}"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo "cache=${srcdir}/.npm_cache"
        echo "maxsockets=10"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo 'registry=https://registry.npmmirror.com'
        } >> .npmrc
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    NODE_ENV=development    npm install
    NODE_ENV=production     npm run build
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    export CGO_ENABLED=1
    export GO111MODULE=on
    export GOOS=linux
    export GOCACHE="${srcdir}/go-build"
    export GOMODCACHE="${srcdir}/go/pkg/mod"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export GOPROXY=https://goproxy.cn,direct
    fi
    wails build -tags with_gvisor,webkit2_41 -skipbindings -m -s -trimpath -nosyncgomod -platform linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}/build/bin/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/appicon.png" "${srcdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}