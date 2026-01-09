# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
_appname=netflix
pkgname="discord-${_appname}"
_pkgname=Discord-Netflix
pkgver=1.3.0
_electronversion=37
_nodeversion=22
pkgrel=1
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
    'jq'
)
source=(
    "${pkgname}-${pkgver}::git+${_ghurl}#tag=v${pkgver}"
)
sha256sums=('cfe88e337dd947b8502f0950f2302cbdcf22cd28822d4a67f1efb35e0c9df831')
_ensure_local_nvm() {
    local NVM_DIR="${srcdir}/.nvm"
    source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
    nvm install "${_nodeversion}"
    nvm use "${_nodeversion}"
}
_get_electron_version() {
    _elec_ver=$(jq -r '.build["electronVersion"]' "${srcdir}/${pkgname}-${pkgver}/package.json" | tr -d '^')
    _main_ver=$(echo "${_elec_ver}" | cut -d. -f1)
    echo -e "The electron version is: \033[1;31m${_main_ver}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _get_electron_version
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
    _ensure_local_nvm
    NODE_ENV=development    npm install
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _ensure_local_nvm
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
