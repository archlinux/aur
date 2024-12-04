# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=pandora-box
_pkgname=Pandora-Box
pkgver=0.2.22
_nodeversion=20
pkgrel=2
pkgdesc="A Simple Mihomo GUI.(Written in Go)"
arch=('any')
url="https://github.com/snakem982/Pandora-Box"
license=('GPL-3.0-only')
depends=(
    'webkit2gtk'
    'gtk3'
    'libsoup'
)
makedepends=(
    'gendesk'
    'npm'
    'nvm'
    'go'
    'wails'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('874ef48d282c99c92eee58b6dff60863de36d9e9fb7649480a3280c4b79d1850')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Network" --name="${_pkgname}" --exec="${pkgname}"
    cd "${srcdir}/${_pkgname}-${pkgver}/frontend"
    electronDist="/usr/lib/electron${_electronversion}"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'	
        #echo 'build_from_source=true'
        echo "cache=${srcdir}/.npm_cache"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo 'registry=https://registry.npmmirror.com'
        } >> .npmrc
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    NODE_ENV=development    npm install
    NODE_ENV=production     npm run build
    cd "${srcdir}/${_pkgname}-${pkgver}"
    export CGO_ENABLED=1
    export GO111MODULE=on
    export GOOS=linux
    export GOCACHE="${srcdir}/go-build"
    export GOMODCACHE="${srcdir}/go/pkg/mod"
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        export GOPROXY=https://goproxy.cn,direct
    fi
    wails build -tags with_gvisor -skipbindings -m -s -trimpath -nosyncgomod -platform linux
}
package() {
    install -Dm755 "${srcdir}/${_pkgname}-${pkgver}/build/bin/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/build/appicon.png" "${srcdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
