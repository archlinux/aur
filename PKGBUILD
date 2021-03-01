# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=glhack
pkgver=1.2
pkgrel=9
pkgdesc="A port of Nethack, a single player dungeon exploration game in 2D"
arch=('x86_64')
url="http://glhack.sourceforge.net/"
license=('custom')
depends=('sdl' 'libpng' 'libgl')
makedepends=('mesa')
options=('!makeflags')
install=glhack.install
source=(https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz glhack-libpng15.patch)
sha1sums=('7dc46e6bd4a3c2ec10ab4d314acfbb30cefc6eae'
          '4cf1a13e76cc1f1eb3708d42c74b85b7f321092d')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p0 -i ../glhack-libpng15.patch
  sed -i 's|/usr/lib/games|/usr/share|' include/config.h
  sed -i 's|/var/lib/games/glhack|/var/games/glhack|' include/unixconf.h
  sed -i -e 's|PREFIX	 = /usr|PREFIX	 = $(DESTDIR)/usr|' Makefile
  sed -i -e 's|VARDIR   = /var/lib/games/glhack|VARDIR   = $(DESTDIR)/var/games/glhack|' Makefile
  sed -i -e 's|/usr/man/man6|$(DESTDIR)/usr/share/man/man6|' doc/Makefile
  sed -i -e 's|GAMEDIR  = $(PREFIX)/lib/games/$(GAME)|GAMEDIR  = $(PREFIX)/share/$(GAME)|' Makefile
}

build(){
  cd ${pkgname}-${pkgver}
  make
}

package() {
  cd ${pkgname}-${pkgver}
  install -d "${pkgdir}"/usr/share/man/man{5,6}
  make DESTDIR="$pkgdir" install
  install -D -m644 dat/license "${pkgdir}/usr/share/licenses/${pkgname}/license"

# Renaming man pages which conflicts with nethack
  pushd "${pkgdir}/usr/share/man/man6"
  for manpage in dgn_comp dlb lev_comp nethack recover; do
    mv $manpage.6 $manpage-glhack.6
  done
  popd

  mv "${pkgdir}/usr/share/glhack/glhack" "${pkgdir}/usr/bin/glhack"
  mv "${pkgdir}/usr/share/glhack/recover_glhack" "${pkgdir}/usr/bin/recover_glhack"

  chown -R root:root "${pkgdir}/usr/share/glhack"

  rm -r "${pkgdir}"/var/games/glhack
  install -d "${pkgdir}/var/games/glhack/save"
  chmod -R 775 "${pkgdir}/var/games"
  chown -R root:games "${pkgdir}/var/games"
}
