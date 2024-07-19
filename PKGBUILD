# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: ml <>
# Contributor: vryali@gmail.com
pkgname=google-chat-linux
_pkgname="Google Chat Linux"
pkgver=5.29.23_1
_electronversion=29
_nodeversion=18
pkgrel=4
pkgdesc='Unofficial electron-based desktop client for Google Chat, electron not included'
arch=('any')
url='https://github.com/squalou/google-chat-linux'
license=('WTFPL')
conflicts=("${pkgname}")
depends=(
    "electron${_electronversion}"
    'xdg-desktop-portal-impl'
)
makedepends=(
    'npm'
    'nvm'
    'git'
    'gendesk'
    'curl'
)
source=(
    "${pkgname}.git::git+${url}.git#tag=${pkgver//_/-}"
    "${pkgname}.sh"
)
sha256sums=('dff55f33845da6a38aef87c97d8e41fcd6194da1f548dddf02a58a74d9772732'
            '2b2e8aeed33fd71c521e49fd54fb2fa81218d16aef8bccb88d77909055ab8051')
_ensure_local_nvm() {
  export NVM_DIR="${srcdir}/.nvm"
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install "${_nodeversion}"
  nvm use "${_nodeversion}"
}
build() {
    sed -e "s|@electronversion@|${_electronversion}|" \
        -e "s|@appname@|${pkgname}|g" \
        -e "s|@runname@|app.asar|g" \
        -e "s|@cfgdirname@|${pkgname}|g" \
        -e "s|@options@|env ELECTRON_OZONE_PLATFORM_HINT=auto|g" \
        -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Network" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}.git"
    export npm_config_build_from_source=true
    export npm_config_cache="${srcdir}/.npm_cache"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    #export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
    #export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
    #export ELECTRONVERSION="${_electronversion}"
    HOME="${srcdir}/.electron-gyp"
    if [ `curl -s ipinfo.io/country | grep CN | wc -l ` -ge 1 ];then
      export npm_config_registry=https://registry.npmmirror.com
      export npm_config_disturl=https://registry.npmmirror.com/-/binary/node/
      export npm_config_electron_mirror=https://registry.npmmirror.com/-/binary/electron/
      export npm_config_electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/
    else
      echo "Your network is OK."
    fi
    sed -e '/--no-force-async-hooks-checks/d' -e '/ELECTRON_DISABLE_SANDBOX/d' -i src/index.js
    sed "s|process.resourcesPath|\"\/usr\/lib\/${pkgname}\"|g" -i src/paths.js
    NODE_ENV=development npm install
    NODE_ENV=production npm run pack
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -r "${srcdir}/${pkgname}.git/dist/linux-"*/resources/icon "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}.git/build/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/${pkgname}.git/dist/linux-"*/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}