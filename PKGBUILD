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
pkgrel=6
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
         'ttf-font')
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
        "popcorntime.desktop")
sha256sums=('58e903cdbed2eb6f7784b38ce847f3fff6315034f58adc806c7a50d0cd763c9c'
            'SKIP'
            'f89595aeaf1c09ad2b0a869be1ad14922b4747f901cec0f1b65c4c72719dcdec')

prepare() {
  cd "${srcdir}/${_gitname}"

  sed -i "s|opensubtitles.git|opensubtitles-api.git|g" package.json

  cp "${srcdir}"/desktop-i18n.git/* src/app/language

  # for gyp
  export PYTHON=/usr/bin/python2

  # Get dependencies
  npm install
}

build() {
  cd "${srcdir}/${_gitname}"

  grunt css
  grunt bower_clean
  # Fatal error: Cannot read property 'length' of undefined
  grunt nodewebkit || grunt nodewebkit
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
