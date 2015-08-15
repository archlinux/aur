# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: xantares <xantares09@hotmail.com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Iwan Timmer <irtimmer@gmail.com>
# Contributor: Ricardo Band <me [at] xengi [dot] de>

pkgname=popcorntime
pkgver=0.3.8.3
_pkgver=0.3.8-3
pkgrel=1
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
if [ "$CARCH" = 'i686' ]; then
  _platform=linux32
fi

source=("desktop-${_pkgver}.tar.bz2::https://git.popcorntime.io/popcorntime/desktop/repository/archive.tar.bz2?ref=${_pkgver}"
        "desktop-i18n-master.tar.bz2::https://git.popcorntime.io/popcorntime/desktop-i18n/repository/archive.tar.bz2?ref=master"
        "popcorntime.desktop")
sha256sums=('f6b4ebd11ec50a5c2a1ddaf42a043b16c21d8bbcdde634a8672236e85c68268d'
            'SKIP'
            'f89595aeaf1c09ad2b0a869be1ad14922b4747f901cec0f1b65c4c72719dcdec')

prepare() {
  cd "${srcdir}/${_gitname}"

  cp "${srcdir}"/desktop-i18n.git/* src/app/language

  export PYTHON=/usr/bin/python2

  npm install
}

build() {
  cd "${srcdir}/${_gitname}"

  grunt css
  grunt bower_clean
  grunt nodewebkit || grunt nodewebkit
}

package() {
  cd "${srcdir}"

  _bpath="${srcdir}/${_gitname}/build/releases/Popcorn-Time/${_platform}/Popcorn-Time"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"

  install -Dm755 "${_bpath}/Popcorn-Time" "${pkgdir}/usr/lib/${pkgname}/"
  install -Dm644 "${_bpath}/nw.pak" "${pkgdir}/usr/lib/${pkgname}/"
  install -Dm644 "${_bpath}/libffmpegsumo.so" "${pkgdir}/usr/lib/${pkgname}/"
  install -Dm644 "${srcdir}/${_gitname}/build/cache/${_platform}/${_nw_ver}/icudtl.dat" "${pkgdir}/usr/lib/${pkgname}/"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/Popcorn-Time" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "${srcdir}/popcorntime.desktop" "${pkgdir}/usr/share/applications/popcorntime.desktop"

  install -Dm644 "${srcdir}/${_gitname}/src/app/images/icon.png" "${pkgdir}/usr/share/pixmaps/popcorntime.png"
}
