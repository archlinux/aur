# Maintainer: Pieter Goetschalckx <3.14.e.ter [at] gmail [dot] com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>

pkgname=popcorntime-git
_pkgname=popcorntime
_gitname=popcorn-desktop
pkgver=r5929.1815690
pkgrel=1
pkgdesc="Stream movies and TV shows from torrents"
arch=('i686' 'x86_64')
url="https://popcorntime.sh"
license=('GPL3')
depends=('alsa-lib' 'gconf' 'gtk2' 'nss' 'ttf-font' 'libxtst' 'libnotify' 'desktop-file-utils')
makedepends=('git' 'npm' 'bower' 'nodejs-grunt-cli' 'gulp')
conflicts=('popcorntime' 'popcorn-time-ce')
provides=('popcorntime')
options=('!strip')
install=popcorntime.install
source=("git+https://github.com/popcorn-official/${_gitname}.git#branch=master"
        "package.json"
        "torrent_collection.js"
        "ysubs.js"
        "${_pkgname}.desktop")
sha256sums=('SKIP'
            'cb1eea1c8e40b8d65014ffe126039221da813aa5bdfc838b998513bdce47cb0c'
            '5129767f341f0949feb7e0eb7dbdecb2a537f5d12463fa48ab62e42e13f92dd6'
            '493fbe11a58699b8d1076b4909c1edb3625915fdcb20d22037a2951dedd58508'
            '7e22d234a2e7dd1e632e094154c44b31be7f93962df93dd865f3775b8e644c05')

[ "$CARCH" = "i686" ]   && _platform=linux32
[ "$CARCH" = "x86_64" ] && _platform=linux64

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_gitname}"
  cp "$srcdir/package.json" "package.json"
  cp "$srcdir/torrent_collection.js" "src/app/lib/views/torrent_collection.js"
  cp "$srcdir/ysubs.js" "src/app/lib/providers/ysubs.js"
  npm install
}

build() {
  cd "${_gitname}"
  gulp build -p ${_platform}
}

package() {
  _bpath="${_gitname}/build/Popcorn-Time/${_platform}"

  install -dm755 "${pkgdir}/usr/share/${_pkgname}"
  install -dm755 "${pkgdir}/usr/bin"

  # Program
  install -Dm755 "${_bpath}/Popcorn-Time" "${pkgdir}/usr/share/${_pkgname}/"
  install -Dm644 "${_bpath}/"{icudtl.dat,libffmpegsumo.so,nw.pak,package.json} \
    "${pkgdir}/usr/share/${_pkgname}/"

  # Directories
  cp -a "${_bpath}/"{locales,node_modules,src} "${pkgdir}/usr/share/${_pkgname}/"

  # Link to program
  ln -s "/usr/share/${_pkgname}/Popcorn-Time" "${pkgdir}/usr/bin/${_pkgname}"

  # Desktop file
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icon
  install -Dm644 "${_bpath}/src/app/images/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"
}

# vim:set ts=2 sw=2 et:
