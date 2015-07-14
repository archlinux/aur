# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>

pkgname=popcorntime-git
pkgver=r5140.702f376
pkgrel=1
pkgdesc="Stream movies from torrents. Skip the downloads. Launch, click, watch."
arch=('i686' 'x86_64')
url="http://popcorntime.io"
license=('GPL3')
depends=('alsa-lib' 'gconf' 'gtk2' 'nss' 'ttf-liberation' 'libxtst')
optdepends=('net-tools: vpn.ht client')
makedepends=('git' 'nodejs-grunt-cli' 'nodejs-bower' 'npm')
conflicts=('popcorntime')
provides=('popcorntime')
options=('!strip')
install="popcorntime.install"

[ "$CARCH" = "i686" ]   && _platform=linux32
[ "$CARCH" = "x86_64" ] && _platform=linux64
_gitname=desktop
_nw_ver=0.12.1

source=('popcorntime.install'
        "git+https://git.popcorntime.io/popcorntime/desktop.git"
        "popcorntime.desktop")
md5sums=('efe872f41ed74a706308b4015e4fd82f'
         'SKIP'
         '9608f35f4cc083a0c36b0f4ef275ab10')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_gitname}"

  export PYTHON=/usr/bin/python2

  # Get dependencies
  npm install
}

build() {
  cd "${srcdir}/${_gitname}"

  # FIXME: fails the first time:
  # Fatal error: Cannot read property 'length' of undefined
  grunt build || grunt build
}

package() {
  cd "${srcdir}"

  _bpath="${srcdir}/${_gitname}/build/releases/Popcorn-Time/${_platform}/Popcorn-Time"

  install -d "${pkgdir}/usr/lib/popcorntime"
  install -d "${pkgdir}/usr/bin"

  # Program
  install -Dm755 "${_bpath}/Popcorn-Time" "${pkgdir}/usr/lib/popcorntime/"
  install -Dm644 "${_bpath}/nw.pak" "${pkgdir}/usr/lib/popcorntime/"
  install -Dm644 "${_bpath}/libffmpegsumo.so" "${pkgdir}/usr/lib/popcorntime/"
  install -Dm644 "${srcdir}/${_gitname}/build/cache/${_platform}/${_nw_ver}/icudtl.dat" "${pkgdir}/usr/lib/popcorntime/"

  # Link to program
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/lib/popcorntime/Popcorn-Time" "${pkgdir}/usr/bin/popcorntime"

  # Desktop file
  install -Dm644 "${srcdir}/popcorntime.desktop" "${pkgdir}/usr/share/applications/popcorntime.desktop"

  # Icon
  install -Dm644 "${srcdir}/${_gitname}/src/app/images/icon.png" "${pkgdir}/usr/share/pixmaps/popcorntime.png"
}

# vim:set ts=2 sw=2 et:

