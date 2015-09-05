# Maintainer: Vlad M. <vlad@archlinux.net>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: xantares <xantares09@hotmail.com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Iwan Timmer <irtimmer@gmail.com>
# Contributor: Ricardo Band <me [at] xengi [dot] de>

pkgname=popcorntime
pkgver=0.3.8.4
_pkgver=v0.3.8-4
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
_commit_hash="ae59a0481c9c4f2127aaa376ff99c19039d90963"
_gitname="desktop-${_pkgver}-${_commit_hash}"
_nw_ver=0.12.2

_platform=linux64
if [ "$CARCH" = 'i686' ]; then
  _platform=linux32
fi

source=("desktop-${_pkgver}.tar.bz2::https://git.popcorntime.io/popcorntime/desktop/repository/archive.tar.bz2?ref=${_pkgver}"
        "popcorntime.desktop")
sha256sums=('286a96debcd3b337e1bed39891cf5f339de015f4aed95d4ed9f3264dc0ba9f9a'
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
