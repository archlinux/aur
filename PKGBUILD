# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: ml <>
# Contributor: vryali@gmail.com
pkgname=google-chat-linux
_pkgname='Google Chat Linux'
pkgver=5.39.24_1
_electronversion=39
_nodeversion=22
pkgrel=2
pkgdesc="Unofficial electron-based desktop client for Google Chat, electron not included.(Use system-wide electron)"
arch=('any')
url="https://github.com/squalou/google-chat-linux"
license=('WTFPL')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'xdg-desktop-portal'
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'gendesk'
    'curl'
    'jq'
)
source=(
    "${pkgname}-${pkgver}::git+${url}#tag=${pkgver//_/-}"
    "${pkgname}.sh"
)
sha256sums=('0aa4d88d71ca4709bff1bbcbb21b10c1e095de2b54047f3781130ea5706026e1'
            '31ad33b633744f5361abd964be306cea53ae1050e760c787115f7eca60045ae6')
_ensure_local_nvm() {
  local NVM_DIR="${srcdir}/.nvm"
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install "${_nodeversion}"
  nvm use "${_nodeversion}"
}
_get_electron_version() {
    _elec_ver=$(jq -r '.devDependencies["electron"] // .dependencies["electron"]' "${srcdir}/${pkgname}-${pkgver}/package.json" | tr -d '^')
    _main_ver=$(echo "${_elec_ver}" | cut -d. -f1)
    echo -e "The electron version is: \033[1;31m${_main_ver}\033[0m"
}
prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _get_electron_version
    sed -i -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " "${srcdir}/${pkgname}.sh"
    gendesk -q -f -n \
        --pkgname="${pkgname}" \
        --pkgdesc="${pkgdesc}" \
        --categories="Network" \
        --name="${_pkgname}" \
        --exec="${pkgname} %U"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
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
        echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/'
        echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/'
      } >> .npmrc
      find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    _ensure_local_nvm
    sed -e "
      /--no-force-async-hooks-checks/d
      /ELECTRON_DISABLE_SANDBOX/d
    " -i src/index.js
    find src -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-git}\'/g" {} +
    sed -i "s/\"electron\": \"[^\"]*\"/\"electron\": \"${SYSTEM_ELECTRON_VERSION}\"/g" package.json
    NODE_ENV=development    npm install
}
build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    _ensure_local_nvm
    local electronDist="/usr/lib/electron${_electronversion}"
    NODE_ENV=production     npm exec -c "electron-builder --linux dir -c.electronDist=${electronDist}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver}/dist/linux-"*/resources/icon "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/build/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}
