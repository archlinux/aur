# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=netflix
pkgname="discord-${_appname}"
_pkgname=Discord-Netflix
pkgver=1.2.18
_electronversion=37
_nodeversion=20
pkgrel=3
pkgdesc="An updated and improved version from the original Discord-Netflix from Nirewen."
arch=('any')
url="https://discord.gg/kbf8EjpxbU"
_ghurl="https://github.com/V0l-D/Discord-Netflix"
license=('GPL-3.0-only')
conflicts=("${pkgname}")
depends=(
    'nodejs'
    'gtk3'
    'nspr'
    'nss'
    'alsa-lib'
)
makedepends=(
    'gendesk'
    'nvm'
    'npm'
    'git'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
)
sha256sums=('3532c317b6f56cbc9e3375433566ef876a5ebd138ad5ada5726eb4ba6367c6c9')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _ensure_local_nvm
    gendesk -f -n -q \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Utility" \
        --name="${_pkgname}" \
        --exec="${pkgname} --no-sandbox %U"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'
        #echo 'build_from_source=true'
        echo "cache=${srcdir}/.npm_cache"
        echo "maxsockets=10"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        sed -i "s/https:\/\/github.com\/castlabs/https:\/\/cors.isteed.cc\/github.com/g" package.json
    fi
    NODE_ENV=development    npm install
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    NODE_ENV=production     npm exec -c "electron-builder --linux dir"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname}"}
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}/dist/linux-"*/* "${pkgdir}/usr/lib/${pkgname}"
    ln -sf "/usr/lib/${pkgname}/${_appname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
