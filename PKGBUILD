# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: ml <>
# Contributor: vryali@gmail.com
pkgname=google-chat-linux
_pkgname="Google Chat Linux"
pkgver=5.29.23_1
_electronversion=29
_nodeversion=18
pkgrel=2
pkgdesc='Unofficial electron-based desktop client for Google Chat, electron not included'
arch=('any')
url='https://github.com/squalou/google-chat-linux'
license=('LicenseRef-unknown')
depends=(
  "electron${_electronversion}"
  'xdg-desktop-portal-impl'
)
makedepends=(
  'npm'
  'nodejs'
  'git'
  'gendesk'
)
source=(
  "${pkgname}.git::git+${url}.git#tag=${pkgver//_/-}"
  "${pkgname}.sh"
)
sha256sums=('SKIP'
            'dc0c5ca385ad81a08315a91655c7c064b5bf110eada55e61265633ae198b39f8')
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
      -e "s|@options@||g" \
      -i "${srcdir}/${pkgname}.sh"
  _ensure_local_nvm
  gendesk -q -f -n --categories="Network" --name="${pkgname}" --exec="${pkgname} %U"
  cd "${srcdir}/${pkgname}.git"
  export npm_config_build_from_source=true
  export npm_config_cache="${srcdir}/.npm_cache"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
  export npm_config_target="${SYSTEM_ELECTRON_VERSION}"
  export ELECTRONVERSION="${_electronversion}"
  export npm_config_disturl=https://electronjs.org/headers
  HOME="${srcdir}/.electron-gyp"
  if [ `curl ifconfig.co/country` == "China" ];then
    echo 'registry="https://registry.npmmirror.com/"' >> .npmrc
    echo 'electron_mirror="https://registry.npmmirror.com/-/binary/electron/"' >> .npmrc
    echo 'electron_builder_binaries_mirror="https://registry.npmmirror.com/-/binary/electron-builder-binaries/"' >> .npmrc
  fi
  sed -e '/--no-force-async-hooks-checks/d' -e '/ELECTRON_DISABLE_SANDBOX/d' -i src/index.js
  sed -e "s|normal-64.png|..\/..\/..\/..\/${pkgname}\/icon\/default\/normal-64.png|g" \
      -e "s|badge-64.png|..\/..\/..\/..\/${pkgname}\/icon\/default\/badge-64.png|g" \
      -e "s|offline-64.png|..\/..\/..\/..\/${pkgname}\/icon\/default\/offline-64.png|g" \
      -i src/paths.js
  npm install
  npx electron-builder -l AppImage
}
package() {
  install -Dm755 "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.git/dist/linux-"*/resources/app.asar -t "${pkgdir}/usr/lib/${pkgname}"
  cp -r "${srcdir}/${pkgname}.git/dist/linux-"*/resources/icon "${pkgdir}/usr/lib/${pkgname}"
  install -Dm644 "${srcdir}/${pkgname}.git/build/icons/icon.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/${pkgname}.git/dist/linux-"*/LICENSE* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}