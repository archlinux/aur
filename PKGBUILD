# $Id$
# Contributor :	Harry Stern <harry.stern@rutgers.edu> 
# Contributor : kevin <kevin@archlinux.org>
# Contributor : Christian Schmidt <mucknert@gmx.net>
# Contributor : Markus Meissner <markus@meissna.de>
# Contributor : Nick Erdmann <erdmann@date.upb.de>

pkgname=nethack-qt
_pkgname=nethack
pkgver=3.4.3
pkgrel=1
pkgdesc='A single player dungeon exploration game'
arch=('i686' 'x86_64')
url="http://www.nethack.org/index.html"
license=('custom')
depends=('qt3' 'gzip' 'ncurses' 'libxaw' 'libxmu' 'libxext' 'libxt' 'libx11')

# unfortunately nethack is still hosted on sourceforge
source=("http://downloads.sourceforge.net/project/nethack/nethack/3.4.3/nethack-343-src.tgz"
		"nethack-qt.patch")
md5sums=('21479c95990eefe7650df582426457f9'
		 '8cf3124fb53e850cf22964d4787419c9')

build(){
  cd $srcdir/${_pkgname}-$pkgver/
  sh sys/unix/setup.sh

  patch -Np1 -i ../nethack-qt.patch || return 1

  sed -e "/^MANDIR\s*=/s|/usr/man/man6|$pkgdir/usr/share/man/man6|" -i doc/Makefile

  make
}
  
package() {
  cd $srcdir/${_pkgname}-$pkgver/

  install -dm755 $pkgdir/usr/share/{man/man6,doc/nethack-qt}
  install -dm775 $pkgdir/var/games/
  make PREFIX=$pkgdir install manpages
  sed -e "s|HACKDIR=$pkgdir/|HACKDIR=/|" \
      -e 's|HACK=$HACKDIR|HACK=/usr/lib/nethack-qt|' \
      -i $pkgdir/usr/bin/nethack-qt

  install -dm755 $pkgdir/usr/lib/nethack-qt
  mv $pkgdir/var/games/nethack-qt/{nethack-qt,recover} $pkgdir/usr/lib/nethack-qt/

  install -Dm644 doc/Guidebook.txt $pkgdir/usr/share/doc/nethack-qt/Guidebook.txt
      
  install -Dm644 dat/license $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
