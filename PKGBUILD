# Maintainer: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: xantares <xantares09@hotmail.com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Iwan Timmer <irtimmer@gmail.com>
# Contributor: Ricardo Band <me [at] xengi [dot] de>

pkgname=popcorntime
pkgver=0.3.7.2
pkgrel=1
pkgdesc="Stream movies from torrents. Skip the downloads. Launch, click, watch."
arch=('i686' 'x86_64')
url="http://popcorntime.io/"
license=('GPL3')
makedepends=('git' 'nodejs-grunt-cli' 'nodejs-bower')
depends=('alsa-lib' 'gconf' 'gtk2' 'nss' 'ttf-font' 'libxtst')
optdepends=('net-tools: vpn.ht client')
options=('!strip')
install="popcorntime.install"
_gitname=desktop.git
_nw_ver=0.9.2
md5sums=('5b3ddb62787e9ed381105b56626974bb'
         'SKIP'
         'fc25eb312257b8c7e04e8e59c973566e'
         'efe872f41ed74a706308b4015e4fd82f'
         '9608f35f4cc083a0c36b0f4ef275ab10')

_platform=linux64
_nw_platform=linux-x64
if [ "$CARCH" = 'i686' ]; then
  _platform=linux32
  _nw_platform=linux-ia32
  md5sums[2]='dca779c67be155aa53458a146cda41ee'
fi
_nw_file=node-webkit-v${_nw_ver}-${_nw_platform}.tar.gz

source=("desktop-v${pkgver}.tar.bz2::https://git.popcorntime.io/popcorntime/desktop/repository/archive.tar.bz2?ref=v${pkgver}"
        "desktop-i18n-master.tar.bz2::https://git.popcorntime.io/popcorntime/desktop-i18n/repository/archive.tar.bz2?ref=master"
        "http://get.popcorntime.io/nw/v${_nw_ver}/${_nw_file}"
        "popcorntime.install"
        "popcorntime.desktop")

prepare() {
  cd "${srcdir}/${_gitname}"
  
  # https://git.popcorntime.io/popcorntime/desktop/commit/6f1864cb00b0af4da062391de04206f9495c88b0
  sed -i "s|git+https://git.popcorntime.io/mirrors/peerflix.git|https://git.popcorntime.io/mirrors/peerflix/repository/archive.tar.gz|g" package.json
  
  cp "${srcdir}"/desktop-i18n.git/* src/app/language

  mkdir -p "${srcdir}/${_gitname}/build/cache/${_platform}/${_nw_ver}/"
  mv "${srcdir}/node-webkit-v${_nw_ver}-${_nw_platform}/"* \
    "${srcdir}/${_gitname}/build/cache/${_platform}/${_nw_ver}/"

  # for gyp
  export PYTHON=/usr/bin/python2

  # Get dependencies
  npm install
}

build() {
  cd "${srcdir}/${_gitname}"

  # The grunt 'build' task served as a reference for this:
  grunt css
  grunt bower_clean
  grunt nodewebkit
}

package() {
  cd "${srcdir}"

  _bpath="${srcdir}/${_gitname}/build/releases/Popcorn-Time/${_platform}/Popcorn-Time"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"

  # Program
  install -Dm755 "${_bpath}/Popcorn-Time" "${pkgdir}/usr/lib/${pkgname}/"
  install -Dm644 "${_bpath}/nw.pak" "${pkgdir}/usr/lib/${pkgname}/"
  install -Dm644 "${_bpath}/libffmpegsumo.so" "${pkgdir}/usr/lib/${pkgname}/"

  # Link to program
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/Popcorn-Time" "${pkgdir}/usr/bin/${pkgname}"

  # Desktop file
  install -Dm644 "${srcdir}/popcorntime.desktop" "${pkgdir}/usr/share/applications/popcorntime.desktop"

  # Icon
  install -Dm644 "${srcdir}/${_gitname}/src/app/images/icon.png" "${pkgdir}/usr/share/pixmaps/popcorntime.png"
}
