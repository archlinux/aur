# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: ekse <ekse.0x[AT]gmail[DOT]com>
# Maintainer: mirandir <mirandir[AT]orange[DOT]fr>

pkgname=jumpnbump
pkgver=1.61
pkgrel=3
pkgdesc="You, as a bunny, have to jump on your opponents to make them explode. It's a true multiplayer game which can't be played alone. It has network support. This program is a Unix port of the old DOS game by brainchilddesign. SDL2 port."
arch=('i686' 'x86_64')
url="https://libregames.gitlab.io/jumpnbump/"
license=('GPL')
depends=('sdl2' 'sdl2_mixer' 'sdl2_net' 'gtk3' 'python' 'python-gobject')
optdepends=('jumpnbump-levels: more levels for jumpnbump')
conflicts=('jumpnbump-menu')
source=(https://gitlab.com/LibreGames/jumpnbump/uploads/95acdae2a232513f068e260977371dcf/jumpnbump-${pkgver}.tar.xz menu.patch desktop.patch b72b70a4233776bdaa6a683c89af2becefd53bd6.diff)
sha256sums=('6a81300336cc4616d8343f65bea6776cf3d71862e50b5d08dab52a46da58d7ad'
            'c779543e05f954886d6ef3a3a8e552358e3590b8c8416fe29dbdf022a613fc13'
            '03f21c44bb5c930f3da1d9b532b95395a587a7c4e9e80b235f964fb15971edb9'
            '60adc26e959b161ff22a459ff849f11c87033bd36a501269f4a23826c5238bc7')

build() {
  cd $srcdir/${pkgname}-${pkgver}/
  patch < ../b72b70a4233776bdaa6a683c89af2becefd53bd6.diff
  
  cd $srcdir/${pkgname}-${pkgver}/menu
  patch -p0 < ../../../menu.patch || return 1
  
  cd "${srcdir}/${pkgname}-${pkgver}/"
  
  make PREFIX=/usr all
  make PREFIX=/usr -C menu
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make PREFIX="${pkgdir}/usr/" install
  make PREFIX="${pkgdir}/usr/" install -C menu
  
  cd ${pkgdir}/usr/share/applications/
  rm "jumpnbump.desktop"
  patch -p0 < ${srcdir}/desktop.patch || return 1
}
