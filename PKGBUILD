# Maintainer: Pieter Goetschalckx <3.14.e.ter [at] gmail [dot] com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>

pkgname=popcorntime-git
_pkgname=popcorntime
_gitname=popcorn-desktop
pkgver=r6211.db796345
pkgrel=1
pkgdesc="Stream movies and TV shows from torrents"
arch=('i686' 'x86_64')
url="https://popcorntime.sh"
license=('GPL3')
depends=('alsa-lib' 'gconf' 'gtk2' 'nss' 'ttf-font' 'libxtst' 'libnotify')
makedepends=('git' 'npm')
conflicts=('popcorntime' 'popcorn-time-ce')
provides=('popcorntime')
options=('!strip')
source=("git+https://github.com/popcorn-official/${_gitname}.git#branch=development"
        "${_pkgname}.desktop")
sha256sums=('SKIP'
            '7e22d234a2e7dd1e632e094154c44b31be7f93962df93dd865f3775b8e644c05')

[ "$CARCH" = "i686" ]   && _platform=linux32
[ "$CARCH" = "x86_64" ] && _platform=linux64

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_gitname}"

  npm install
  node_modules/.bin/gulp build --platforms ${_platform}
}

package() {
  _bpath="${_gitname}/build/Popcorn-Time/${_platform}"

  install -dm755 "${pkgdir}/usr/share/${_pkgname}"
  install -dm755 "${pkgdir}/usr/bin"

  # Link to program
  ln -s "/usr/share/${_pkgname}/Popcorn-Time" "${pkgdir}/usr/bin/${_pkgname}"

  # Desktop file
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icon
  install -Dm644 "${_bpath}/src/app/images/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"

  # Copy complete content of source archive to /usr/share/${_pkgname}/
  cp -a "${_bpath}"/* "${pkgdir}/usr/share/${_pkgname}/"
  chmod +x "${pkgdir}/usr/share/${_pkgname}/Popcorn-Time"
}
