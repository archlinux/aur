# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: xantares <xantares09@hotmail.com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Iwan Timmer <irtimmer@gmail.com>
# Contributor: Ricardo Band <me [at] xengi [dot] de>

pkgname=popcorntime
pkgver=0.3.8.0
_pkgver=0.3.8-0
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
_nw_ver=0.12.1

_platform=linux64
_nw_platform=linux-x64
if [ "$CARCH" = 'i686' ]; then
  _platform=linux32
  _nw_platform=linux-ia32
  sha256sums[2]='a676024eff0900067d9c78c13b7d09ee5f87b8e0efed9517f8e163696e8e80cb'
fi
_nw_file=node-webkit-v${_nw_ver}-${_nw_platform}.tar.gz

source=("desktop-v${_pkgver}.tar.bz2::https://git.popcorntime.io/popcorntime/desktop/repository/archive.tar.bz2?ref=v${_pkgver}"
        "desktop-i18n-master.tar.bz2::https://git.popcorntime.io/popcorntime/desktop-i18n/repository/archive.tar.bz2?ref=master"
        "https://get.popcorntime.io/nw/v${_nw_ver}/${_nw_file}"
        "popcorntime.desktop")
sha256sums=('58e903cdbed2eb6f7784b38ce847f3fff6315034f58adc806c7a50d0cd763c9c'
            '447bafbdbd06f9e7833732629f333f71b52c78b48dbc0818bfbbc7e2de1e0f47'
            '1366ea08e022ae78d5fc63bcfa9ce50797da0573302d867c6082bc39aaf576ab'
            'ac2b7183d3ea62ae821c7d1f4b243b0ca41c7838efa16babe29cad0c4958ee25')

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
