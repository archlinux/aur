# Maintainer: Jose Riha <jose 1711 gmail com>
# Contributor: Dominika Solarz <dominikasolarz@gmail.com>
# Contributor: J!PRA

pkgname=openlierox
pkgver=0.58_rc5
pkgrel=5
pkgdesc="An extremely addictive realtime worms shoot-em-up backed by an active gamers community"
arch=(i686 x86_64)
license=("GPL")
url="http://openlierox.sourceforge.net/"
depends=("sdl" "sdl_mixer" "sdl_image" "hawknl" "gd" "zlib" "libxml2" "libzip")
makedepends=("gendesk" "cmake")
source=("http://downloads.sourceforge.net/sourceforge/openlierox/OpenLieroX_${pkgver}.src.tar.bz2"
        "options.cfg"
        "OpenLieroX.png")
md5sums=('9899f4c7e11eb02abe5bebfbdef80dcb'
         '04d00deb6521b3fbcdba6e9546ae67cf'
         'f2aec85a3ad86a6cf7d1362f31b38e51')

prepare() {
  cd $srcdir/OpenLieroX
  gendesk -f -n --pkgname OpenLieroX --pkgdesc "${pkgdesc}" --exec "openlierox" --categories "Game;Shooter;ActionGame"
}

build() {
  cd $srcdir/OpenLieroX
  if [ -d bd ]
  then
    rm -rf bd
  fi

  mkdir bd && cd bd
  cmake -DSYSTEM_DATA_DIR=/usr/share \
        -DDEBUG=OFF  \
        ..
  make
}

package() {
  cd $srcdir/OpenLieroX
  install -Dm755 bd/bin/openlierox $pkgdir/usr/bin/openlierox
  install -dm755 $pkgdir/usr/share/OpenLieroX
  cp -r share/gamedir/* $pkgdir/usr/share/OpenLieroX/
  find "${pkgdir}/usr/share/OpenLieroX"  -type d -print0 | xargs -0 -- chmod 755
  find "${pkgdir}/usr/share/OpenLieroX" -type f -print0 | xargs -0 -- chmod 644
  install -Dm644 OpenLieroX.desktop "${pkgdir}/usr/share/applications/OpenLieroX.desktop"
  install -Dm644 "${srcdir}/OpenLieroX.png" "${pkgdir}/usr/share/pixmaps/OpenLieroX.png"
  install -Dm644 ${srcdir}/options.cfg "${pkgdir}/usr/share/OpenLieroX/cfg/options.cfg"
}
