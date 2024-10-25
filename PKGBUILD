# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=netflix
pkgname="discord-${_appname}"
_pkgname=Discord-Netflix
pkgver=1.1.16
_electronversion="30.0.1+wvcus"
_nodeversion=20
pkgrel=2
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
    'cmake'
    'gcc'
    'git'
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('4f5c835c8ce3496b8bd189cca8e8d9d0e162adf74099eb7c31529def583416d2')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
build() {
    _ensure_local_nvm
    gendesk -f -n -q --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${pkgname} --no-sandbox %U"
    cd "${srcdir}/${_pkgname}-${pkgver}"
    HOME="${srcdir}/.electron-gyp"
    {
        echo -e '\n'	
        #echo 'build_from_source=true'
        echo "cache=${srcdir}/.npm_cache"
    } >> .npmrc
    if [[ "$(curl -s ipinfo.io/country)" == *"CN"* ]]; then
        {
            echo 'registry=https://registry.npmmirror.com'
            echo 'disturl=https://registry.npmmirror.com/-/binary/node/'
        } >> .npmrc
        find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
        sed -i "s/github.com\/castlabs/ghproxy.com\/https:\/\/github.com\/castlabs/g" package.json
    fi
    NODE_ENV=development    npm install
    NODE_ENV=production     npm exec -c "electron-builder --linux dir"
}
package() {
    install -Dm755 -d "${pkgdir}/usr/"{bin,lib/"${pkgname}"}
    cp -Pr --no-preserve=ownership "${srcdir}/${_pkgname}-${pkgver}/dist/linux-"*/* "${pkgdir}/usr/lib/${pkgname}"
    ln -sf "/usr/lib/${pkgname}/${_appname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${_pkgname}-${pkgver}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}