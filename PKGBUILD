# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=tiny-rdm
_pkgname="Tiny RDM"
pkgver=1.1.8
_nodeversion=18
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
    'gcc'
)
options=(
    '!strip'
)
source=(
    "${pkgname}.git::git+${_ghurl}.git#tag=v${pkgver}"
)
sha256sums=('SKIP')
_ensure_local_nvm() {
    export NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    _ensure_local_nvm
    cd "${srcdir}/${pkgname}.git"
    npm install --prefix ./frontend
    export CGO_ENABLED=1
    export GOCACHE="${srcdir}/go-build"
    export GOMODCACHE="${srcdir}/go/pkg/mod"
    wails build -o "${pkgname}"
    sed -e "s|{{.Info.ProductName}}|${_pkgname}|g" \
        -e "s|/usr/local/bin/${pkgname}|${pkgname}|g" \
        -e "s|{{.Info.Comments}}|${pkgdesc}|g" \
        -i "build/linux/${pkgname}_0.0.0_amd64/usr/share/applications/${pkgname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.git/build/bin/${pkgname}" -t "${pkgdir}/usr/bin"
    install -Dm644 "${srcdir}/${pkgname}.git/build/linux/${pkgname}_0.0.0_amd64/usr/share/applications/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/build/appicon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.git/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}