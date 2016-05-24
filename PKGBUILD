# Maintainer: M0Rf30

pkgname=butter-desktop-git
_pkgname=butter-desktop
_gitname=butter-desktop
pkgver=r5917.daeab75
pkgrel=1
pkgdesc="Stream movies and TV shows from torrents"
arch=('i686' 'x86_64')
url="https://butter-desktop.sh"
license=('GPL3')
depends=('alsa-lib' 'gconf' 'gtk2' 'nss' 'ttf-font' 'libxtst' 'libnotify' 'desktop-file-utils')
makedepends=('git' 'npm' 'bower' 'nodejs-grunt-cli' 'gulp')
conflicts=('butter-desktop')
provides=('butter-desktop')
options=('!strip')
install=butter-desktop.install
source=("git+https://github.com/butterproject/${_gitname}.git#branch=master"
        "${_pkgname}.desktop")

[ "$CARCH" = "i686" ]   && _platform=linux32
[ "$CARCH" = "x86_64" ] && _platform=linux64

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_gitname}"
  npm install
}

build() {
  cd "${_gitname}"
  gulp build -p ${_platform}
}

package() {
  _bpath="${_gitname}/build/Butter/${_platform}"

  install -dm755 "${pkgdir}/usr/share/${_pkgname}"
  install -dm755 "${pkgdir}/usr/bin"

  # Program
  install -Dm755 "${_bpath}/Butter" "${pkgdir}/usr/share/${_pkgname}/"
  install -Dm644 "${_bpath}/"{icudtl.dat,libffmpegsumo.so,nw.pak,package.json} \
    "${pkgdir}/usr/share/${_pkgname}/"

  # Directories
  cp -a "${_bpath}/"{locales,node_modules,src} "${pkgdir}/usr/share/${_pkgname}/"

  # Link to program
  ln -s "/usr/share/${_pkgname}/butter-desktop" "${pkgdir}/usr/bin/${_pkgname}"

  # Desktop file
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icon
  install -Dm644 "${_bpath}/src/app/images/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
}

md5sums=('SKIP'
         '4bb780d7d8f23666a49c45c38957cbb9')
