# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: Shuyuan Liu <liu_shuyuan at qq dot com>
pkgname=issie
pkgver=4.1.0
_electronversion=24
_nodeversion=18
pkgrel=4
pkgdesc="An intuitive cross-platform hardware design application."
arch=('any')
url="https://tomcl.github.io/issie"
_ghurl="https://github.com/tomcl/issie"
license=('GPL3')
conflicts=("${pkgname}")
depends=(
    'expat'
    'at-spi2-core'
    'nspr'
    'pango'
    'nss'
    'cairo'
    'libxkbcommon'
    'libxcomposite'
    'libcups'
    'libxfixes'
    'libxdamage'
    'libx11'
    'libxext'
    'libdrm'
    'mesa'
    'libxrandr'
    'libxcb'
    'alsa-lib'
    'gtk3'
)
makedepends=(
    'nvm'
    'npm'
    'dotnet-sdk>=7'
    'gendesk'
    'git'
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
    gendesk -q -f -n --categories "Development" --name "${pkgname}" --exec "${pkgname} --no-sandbox %U"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    #export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    #export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    #export ELECTRONVERSION="${_electronversion}"
    dotnet tool restore
    dotnet paket install
    npm install
    npm run pack
}
package() {
    install -Dm755 -d "${pkgdir}/"{opt/"${pkgname}",usr/bin}
    cp -r "${srcdir}/${pkgname}.git/dist/linux-"*/* "${pkgdir}/opt/${pkgname}"
    ln -sf "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/public/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}