# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: iFlygo
pkgname=figma-linux-git
pkgver=0.11.2.r7.g21a518c
_electronversion=27
_nodeversion=18
pkgrel=1
arch=('any')
pkgdesc="The collaborative interface design tool. Unofficial Figma desktop client for Linux"
url="https://github.com/Figma-Linux/figma-linux"
license=("GPL2")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
depends=(
  "electron${_electronversion}"
  'hicolor-icon-theme'
  'libdbusmenu-glib'
  'libdbusmenu-gtk3'
)
makedepends=(
  'git'
  'nvm'
  'npm'
  'xdg-utils'
)
source=(
  "${pkgname%-git}.git::git+${url}.git"
  "${pkgname%-git}.sh"
)
sha256sums=('SKIP'
            'd4272fed78cdcacd9edfb019134ac485d65b43f4d8c7a4179edbaed56af9b231')
pkgver() {
  cd "${srcdir}/${pkgname%-git}.git"
  git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}
_ensure_local_nvm() {
  export NVM_DIR="${srcdir}/.nvm"
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install "${_nodeversion}"
  nvm use "${_nodeversion}"
}
build() {
  sed -e "s|@electronversion@|${_electronversion}|" \
      -e "s|@appname@|${pkgname%-git}|g" \
      -e "s|@appasar@|app|g" \
      -i "${srcdir}/${pkgname%-git}.sh"
  _ensure_local_nvm
  cd "${srcdir}/${pkgname%-git}.git"
  export npm_config_build_from_source=true
  export npm_config_cache="${srcdir}/.npm_cache"
  export ELECTRON_SKIP_BINARY_DOWNLOAD=1
  export SYSTEM_ELECTRON_VERSION="$(electron${_electronversion} -v | sed 's/v//g')"
  export ELECTRONVERSION="${_electronversion}"
  sed '62,73d' -i config/builder.json
  npm install --no-frozen-lockfile
  npm run build
  npm run package
  sed "s|/opt/${pkgname%-git}/${pkgname%-git}|${pkgname%-git}|g" -i "resources/${pkgname%-git}.desktop"
}

package() {
  install -Dm755 "${srcdir}/${pkgname%-git}.sh" "${pkgdir}/usr/bin/${pkgname%-git}"
  install -Dm644 "${srcdir}/${pkgname%-git}.git/build/installers/linux-unpacked/resources/app.asar" -t "${pkgdir}/usr/lib/${pkgname%-git}"
  install -Dm644 "${srcdir}/${pkgname%-git}.git/build/installers/linux-unpacked/lib/${CARCH}-linux-gnu/"* -t "${pkgdir}/usr/lib/${pkgname%-git}/lib"
  install -Dm644 "${srcdir}/${pkgname%-git}.git/build/installers/linux-unpacked/usr/lib/${CARCH}-linux-gnu/"*.* -t "${pkgdir}/usr/lib/${pkgname%-git}/lib"
  install -Dm644 "${srcdir}/${pkgname%-git}.git/build/installers/linux-unpacked/usr/lib/${CARCH}-linux-gnu/nss/"* -t "${pkgdir}/usr/lib/${pkgname%-git}/lib/nss"
  install -Dm644 "${srcdir}/${pkgname%-git}.git/build/installers/linux-unpacked/swiftshader/"* -t "${pkgdir}/usr/lib/${pkgname%-git}/swiftshader"
  for _icons in 24x24 36x36 48x48 64x64 96x96 128x128 256x256 512x512;do
    install -Dm644 "${srcdir}/${pkgname%-git}.git/build/installers/linux-unpacked/icons/${_icons}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_icons}/apps/${pkgname%-git}.png"
  done
  install -Dm644 "${srcdir}/${pkgname%-git}.git/build/installers/linux-unpacked/icons/scalable.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname%-git}.svg"
  install -Dm644 "${srcdir}/${pkgname%-git}.git/resources/${pkgname%-git}.desktop" -t "${pkgdir}/usr/share/applications"
}