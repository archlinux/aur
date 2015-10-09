# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: xantares <xantares09@hotmail.com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Iwan Timmer <irtimmer@gmail.com>
# Contributor: Ricardo Band <me [at] xengi [dot] de>

pkgname=popcorntime
pkgver=0.3.8.5
_pkgver=v0.3.8-5
pkgrel=2
pkgdesc="Stream movies from torrents. Skip the downloads. Launch, click, watch."
arch=('i686' 'x86_64')
url="http://popcorntime.io/"
license=('GPL3')
makedepends=('git'
             'bower'
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
_commit_hash="9d0b6efe81f5a0a005e244115a94139a62a76459"
_gitname="desktop-${_pkgver}-${_commit_hash}"
_nw_ver=0.12.2

_platform=linux64
if [ "$CARCH" = 'i686' ]; then
  _platform=linux32
fi

source=("desktop-${_pkgver}.tar.bz2::https://git.popcorntime.io/popcorntime/desktop/repository/archive.tar.bz2?ref=${_pkgver}"
        "popcorntime.desktop")
sha256sums=('b4980fc2ba7ffd53fbf7463b09d39a9f14a8b138708e3fb7f36a0939a3184190'
            '4422f21e16176fda697ed0c8a6d1fb6f9dd7c4bc3f3694f9bcc19cbe66630334')

prepare() {
  cd "${_gitname}"

  export PYTHON=/usr/bin/python2

  npm install
}

build() {
  cd "${_gitname}"

  grunt bower_clean
  grunt css
  grunt nodewebkit || grunt nodewebkit
}

package() {
  _bpath="${_gitname}/build/releases/Popcorn-Time/${_platform}/Popcorn-Time"

  install -dm755 "${pkgdir}/usr/lib/${pkgname}"
  install -dm755 "${pkgdir}/usr/bin"

  install -Dm755 "${_bpath}/Popcorn-Time" "${pkgdir}/usr/lib/${pkgname}/"
  install -Dm644 "${_bpath}/nw.pak" "${pkgdir}/usr/lib/${pkgname}/"
  install -Dm644 "${_bpath}/libffmpegsumo.so" "${pkgdir}/usr/lib/${pkgname}/"
  install -Dm644 "${_gitname}/build/cache/${_platform}/${_nw_ver}/icudtl.dat" "${pkgdir}/usr/lib/${pkgname}/"

  mkdir -p "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/Popcorn-Time" "${pkgdir}/usr/bin/${pkgname}"

  install -Dm644 "popcorntime.desktop" "${pkgdir}/usr/share/applications/popcorntime.desktop"

  install -Dm644 "${_gitname}/src/app/images/icon.png" "${pkgdir}/usr/share/pixmaps/popcorntime.png"
}
