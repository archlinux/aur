# Maintainer: 0xGingi <0xgingi@0xgingi.com>
_appname=netflix
pkgname=('discord-netflix-git')
_pkgname=Discord-Netflix
__pkgname=discord-netflix
pkgver=v1.1.16.r0.g530c545
_electronversion="30.0.1+wvcus"
_nodeversion=18
pkgrel=2
pkgdesc="An updated and improved version from the original Discord-Netflix from Nirewen."
arch=('any')
url="https://discord.gg/kbf8EjpxbU"
_ghurl="https://github.com/V0l-D/Discord-Netflix"
license=('GPL-3.0-only')
conflicts=("${_pkgname}")
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
source=("git+https://github.com/V0l-D/Discord-Netflix.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


_ensure_local_nvm() {
  export NVM_DIR="${srcdir}/.nvm"
  source /usr/share/nvm/init-nvm.sh || [[ $? != 1 ]]
  nvm install "${_nodeversion}"
  nvm use "${_nodeversion}"
}

build() {
  _ensure_local_nvm
  gendesk -f -n -q --pkgname="${__pkgname}" --pkgdesc="${pkgdesc}" --categories="Utility" --name="${_pkgname}" --exec="${__pkgname} --no-sandbox %U"
  cd "${srcdir}/${_pkgname}"
  export npm_config_build_from_source=true
  export npm_config_cache="${srcdir}/.npm_cache"
  HOME="${srcdir}/.electron-gyp"
  sed "s|AppImage|dir|g" -i package.json
  NODE_ENV=development npm install
  NODE_ENV=production npm run linbuild
}

package() {
  install -Dm755 -d "${pkgdir}/"{opt/"${__pkgname}",usr/bin}
  cp -r "${srcdir}/${_pkgname}/dist/linux-unpacked/"* "${pkgdir}/opt/${__pkgname}"
  ln -sf "/opt/${__pkgname}/${_appname}" "${pkgdir}/usr/bin/${__pkgname}"
  install -Dm644 "${srcdir}/${_pkgname}/assets/icon.png" "${pkgdir}/usr/share/pixmaps/${__pkgname}.png"
  install -Dm644 "${srcdir}/discord-netflix.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" -t "${pkgdir}/usr/share/licenses/${__pkgname}"
}