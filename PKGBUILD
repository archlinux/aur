# Maintainer: M0Rf30

pkgname=torrentv-git
pkgver=r47.3aab1c5
pkgrel=1
pkgdesc="Stream Torrents to your AppleTV/Roku/Chromecast"
arch=('i686' 'x86_64')
url="http://torrentv.github.io/"
license=('GPL3')
depends=('nodejs')
makedepends=('git' 'nodejs-grunt-cli' 'nodejs-bower')
conflicts=('torrentv')
provides=("torrentv")
options=('!strip')
export PYTHON=/usr/bin/python2
[ "$CARCH" = "i686" ]   && _platform=linux32
[ "$CARCH" = "x86_64" ] && _platform=linux64
_gitname=torrentv
_DEST="/usr/share/torrentv"

source=(${_gitname}::git+https://github.com/TorrenTV/TorrenTV.git
        "torrentv.desktop")
md5sums=('SKIP'
         '82ea8fbf59b3a9b0079be7ad06269dc0')

pkgver() {
  cd "${srcdir}/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${_gitname}"

  # Get dependencies
  npm install
  npm install subtitles-server
: << 'COMMENT'
  # Copy local node-webkit (will be used if grunt wants the same version)
  if [ -d /usr/lib/node-webkit/ ]
  then
    _nwver=$(pacman -Q node-webkit | cut -d" " -f 2 | cut -d- -f1)
    install -d "${srcdir}/${_gitname}/build/cache/${_platform}/${_nwver}"
    install /usr/lib/node-webkit/* "${srcdir}/${_gitname}/build/cache/${_platform}/${_nwver}"
  fi
COMMENT
}

build() {
  cd "${srcdir}/${_gitname}"

  # Build
  grunt build
}

package() {
  cd "${srcdir}/${_gitname}/build/releases/TorrenTV/${_platform}/TorrenTV"

  # Program
  msg2 "Installing program to ${_DEST}"
  install -dm755 "${pkgdir}${_DEST}"
  install -m755 "TorrenTV" "${pkgdir}${_DEST}"
  install -m644 "nw.pak" "${pkgdir}${_DEST}"
  install -m644 "libffmpegsumo.so" "${pkgdir}${_DEST}"

  # Link to program
  msg2 "Symlink /usr/bin/${provides[0]} -> ${_DEST}/TorrenTV"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "${_DEST}/TorrenTV" "${pkgdir}/usr/bin/${provides[0]}"

  # Desktop file
  install -Dm644 "${srcdir}/torrentv.desktop" "${pkgdir}/usr/share/applications/torrentv.desktop"

  # Icon
  install -Dm644 "${srcdir}/${_gitname}/src/app/images/icon.png" "${pkgdir}/usr/share/pixmaps/torrentv.png"
}

md5sums=('SKIP'
         'b07f00426e616e773b7c6af46be2461a')
