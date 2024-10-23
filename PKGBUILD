# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: ml <>
# Contributor: vryali@gmail.com
pkgname=google-chat-linux
_pkgname="Google Chat Linux"
pkgver=5.29.23_1
_electronversion=29
_nodeversion=18
pkgrel=5
pkgdesc="Unofficial electron-based desktop client for Google Chat, electron not included.Use system-wide electron."
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
)
source=(
    "${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver//_/-}.tar.gz"
    "${pkgname}.sh"
)
sha256sums=('dd1c116899b54a6e49d71c9f389a2bf6015a10a21d65c3817dd7f8bfc54861a4'
            '291f50480f5a61bc9c68db7d44cd0412071128706baa868a9cb854f8779a1980')
_ensure_local_nvm() {
  local NVM_DIR="${srcdir}/.nvm"
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install "${_nodeversion}"
  nvm use "${_nodeversion}"
}
build() {
    sed -e "
        s/@electronversion@/${_electronversion}/g
        s/@appname@/${pkgname}/g
        s/@runname@/app.asar/g
        s/@cfgdirname@/${pkgname}/g
        s/@options@/env ELECTRON_OZONE_PLATFORM_HINT=auto/g
    " -i "${srcdir}/${pkgname}.sh"
    _ensure_local_nvm
    gendesk -q -f -n --pkgname="${pkgname}" --pkgdesc="${pkgdesc}" --categories="Network" --name="${_pkgname}" --exec="${pkgname} %U"
    cd "${srcdir}/${pkgname}-${pkgver//_/-}"
    electronDist="/usr/lib/electron${_electronversion}"
    export ELECTRON_SKIP_BINARY_DOWNLOAD=1
    export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
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
        echo 'electron_mirror=https://registry.npmmirror.com/-/binary/electron/'
        echo 'electron_builder_binaries_mirror=https://registry.npmmirror.com/-/binary/electron-builder-binaries/'
      } >> .npmrc
      find ./ -type f -name "package-lock.json" -exec sed -i "s/registry.npmjs.org/registry.npmmirror.com/g" {} +
    fi
    sed -e "
      /--no-force-async-hooks-checks/d
      /ELECTRON_DISABLE_SANDBOX/d
    " -i src/index.js
    find src -type f -exec sed -i "s/process.resourcesPath/\'\/usr\/lib\/${pkgname%-git}\'/g" {} +
    NODE_ENV=development  npm install
    NODE_ENV=production     npm exec -c "electron-builder --linux dir -c.electronDist=${electronDist}"
}
package() {
    install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver//_/-}/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
    cp -Pr --no-preserve=ownership "${srcdir}/${pkgname}-${pkgver//_/-}/dist/linux-"*/resources/icon "${pkgdir}/usr/lib/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}-${pkgver//_/-}/build/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}