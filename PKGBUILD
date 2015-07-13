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
pkgrel=4
pkgdesc="Stream movies from torrents. Skip the downloads. Launch, click, watch."
arch=('i686' 'x86_64')
url="http://popcorntime.io/"
license=('GPL3')
makedepends=('git'
             'nodejs-bower'
             'nodejs-grunt-cli'
             'npm')
depends=('alsa-lib'
         'gconf'
         'gtk2'
         'libnotify'
         'libxtst'
         'nss'
         'ttf-liberation')
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
  sha256sums[2]='973a8a7eeb1d26035869be39450a6f0f796a84ad7db7ea4f27ef8c8e64017948'
fi

source=("desktop-v${_pkgver}.tar.bz2::https://git.popcorntime.io/popcorntime/desktop/repository/archive.tar.bz2?ref=v${_pkgver}"
        "desktop-i18n-master.tar.bz2::https://git.popcorntime.io/popcorntime/desktop-i18n/repository/archive.tar.bz2?ref=master"
        "http://dl.nwjs.io/v${_nw_ver}/nwjs-v${_nw_ver}-${_nw_platform}.tar.gz"
        "popcorntime.desktop")
sha256sums=('58e903cdbed2eb6f7784b38ce847f3fff6315034f58adc806c7a50d0cd763c9c'
            'SKIP'
            '7f46d6c00fd2bb3aae70e177b94685af2f53476c3ee50c1c243760d0f271b505'
            'f89595aeaf1c09ad2b0a869be1ad14922b4747f901cec0f1b65c4c72719dcdec')

prepare() {
  cd "${srcdir}/${_gitname}"

  # https://git.popcorntime.io/popcorntime/desktop/commit/6f1864cb00b0af4da062391de04206f9495c88b0
  sed -i "s|git+https://git.popcorntime.io/mirrors/peerflix.git|https://git.popcorntime.io/mirrors/peerflix/repository/archive.tar.gz|g" package.json

  cp "${srcdir}"/desktop-i18n.git/* src/app/language

  mkdir -p "${srcdir}/${_gitname}/build/cache/${_platform}/${_nw_ver}/"
  mv "${srcdir}/nwjs-v${_nw_ver}-${_nw_platform}/"* \
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
  install -Dm644 "${srcdir}/${_gitname}/build/cache/${_platform}/${_nw_ver}/icudtl.dat" "${pkgdir}/usr/lib/${pkgname}/"

  # Link to program
  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/Popcorn-Time" "${pkgdir}/usr/bin/${pkgname}"

  # Desktop file
  install -Dm644 "${srcdir}/popcorntime.desktop" "${pkgdir}/usr/share/applications/popcorntime.desktop"

  # Icon
  install -Dm644 "${srcdir}/${_gitname}/src/app/images/icon.png" "${pkgdir}/usr/share/pixmaps/popcorntime.png"
}
