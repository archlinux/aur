# Maintainer: Beini <bane [at] iki [dot] fi>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>

pkgname=popcorntime-experimental-git
pkgver=0.3.7.r559.g96c362f
pkgrel=1
pkgdesc="Stream movies from torrents. Skip the downloads. Launch, click, watch. Experimental branch"
arch=('i686' 'x86_64')
url="http://popcorntime.io"
license=('GPL3')
depends=('alsa-lib' 'gconf' 'gtk2' 'nss' 'ttf-liberation' 'libxtst' 'libnotify')
optdepends=('net-tools: vpn.ht client')
makedepends=('git' 'nodejs-grunt-cli' 'nodejs-bower' 'npm')
provides=('popcorntime')
conflicts=('popcorntime')
options=('!strip')
install="popcorntime.install"
source=('popcorntime.install'
        "git+https://git.popcorntime.io/popcorntime/desktop.git#branch=nw12"
        "popcorntime.desktop")
md5sums=('efe872f41ed74a706308b4015e4fd82f'
         'SKIP'
         '9608f35f4cc083a0c36b0f4ef275ab10')

[ "$CARCH" = "i686" ]   && _platform=linux32
[ "$CARCH" = "x86_64" ] && _platform=linux64
_gitname=desktop

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${_gitname}"

  export PYTHON=/usr/bin/python2

  # Get dependencies
  npm install
}

build() {
  cd "${srcdir}/${_gitname}"
  grunt build
}

package() {
  cd "${srcdir}"

  _bpath="${srcdir}/${_gitname}/build/releases/Popcorn-Time/${_platform}/Popcorn-Time"
  _nw="0.12.1"

  install -d "${pkgdir}/usr/lib/popcorntime"
  install -d "${pkgdir}/usr/bin"

  # Program
  install -Dm755 "${_bpath}/Popcorn-Time" "${pkgdir}/usr/lib/popcorntime/"
  install -Dm644 "${_bpath}/nw.pak" "${pkgdir}/usr/lib/popcorntime/"
  install -Dm644 "${_bpath}/libffmpegsumo.so" "${pkgdir}/usr/lib/popcorntime/"
  install -Dm644 "${srcdir}/${_gitname}/build/cache/${_platform}/${_nw}/icudtl.dat" "${pkgdir}/usr/lib/popcorntime/"

  # Link to program
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/lib/popcorntime/Popcorn-Time" "${pkgdir}/usr/bin/popcorntime"

  # Desktop file
  install -Dm644 "${srcdir}/popcorntime.desktop" "${pkgdir}/usr/share/applications/popcorntime.desktop"

  # Icon
  install -Dm644 "${srcdir}/${_gitname}/src/app/images/icon.png" "${pkgdir}/usr/share/pixmaps/popcorntime.png"
}

# vim:set ts=2 sw=2 et:
