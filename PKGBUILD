#
# PKGBUILD for the development version of NetHack
#    Maintainer: Eric Biggers <ebiggers3@gmail.com>
#
# Based on the PKGBUILD for nethack 3.6.0
#

pkgname=nethack-git
pkgver=3.6.3d.r5.g8a5702950
pkgrel=1
pkgdesc='A single player dungeon exploration game'
arch=('i686' 'x86_64')
url='https://www.nethack.org/index.html'
license=('custom')
depends=('ncurses' 'gzip' 'gdb')
install=nethack.install
source=('git://github.com/NetHack/NetHack#branch=NetHack-3.6')
#'git://github.com/NetHack/NetHack.git')
sha256sums=('SKIP')
conflicts=('nethack')
provides=('nethack')
replaces=('nethack')

pkgver() {
  cd NetHack
  git describe --long --tags | \
    sed 's/NetHack-//;s/_Release//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd $srcdir/NetHack

  sed -e 's|^/\* \(#define LINUX\) \*/|\1|' -i include/unixconf.h

  # we are setting up for setgid games, so modify all necessary permissions
  # to allow full access for groups

  sed -e '/^HACKDIR/ s|/games/lib/\$(GAME)dir|/var/games/nethack/|' \
      -e '/^SHELLDIR/ s|/games|/usr/bin|' \
      -e '/^VARDIRPERM/ s|0755|0775|' \
      -e '/^VARFILEPERM/ s|0600|0664|' \
      -e '/^GAMEPERM/ s|0755|02755|' \
      -e 's|\(DSYSCF_FILE=\)\\"[^"]*\\"|\1\\"/var/games/nethack/sysconf\\"|' \
      -e 's|\(DHACKDIR=\)\\"[^"]*\\"|\1\\"/var/games/nethack/\\"|' -i sys/unix/hints/linux

  sed -e 's|^#GAMEUID.*|GAMEUID = root|' \
      -e 's|^#GAMEGRP.*|GAMEGRP = games|' \
      -e '/^FILEPERM\s*=/ s|0644|0664|' \
      -e '/^DIRPERM\s*=/ s|0755|0775|' -i sys/unix/Makefile.top

  sed -e "/^MANDIR\s*=/s|/usr/man/man6|$pkgdir/usr/share/man/man6|" -i sys/unix/Makefile.doc
}

build() {
  cd $srcdir/NetHack/sys/unix
  sh setup.sh hints/linux

  cd $srcdir/NetHack
  make
}

package() {
  cd $srcdir/NetHack/

  install -dm755 $pkgdir/usr/share/{man/man6,doc/nethack}
  install -dm775 $pkgdir/var/games/
  make PREFIX=$pkgdir -j1 install manpages # Multi-threaded builds fail.
  sed -e "s|HACKDIR=$pkgdir/|HACKDIR=/|" \
      -e 's|HACK=$HACKDIR|HACK=/usr/lib/nethack|' \
      -i $pkgdir/usr/bin/nethack

  install -dm755 $pkgdir/usr/lib/nethack
  mv $pkgdir/var/games/nethack/{nethack,recover} $pkgdir/usr/lib/nethack/

  # FS#43414: /var/games should be owned by root:games.
  chown -R root:games $pkgdir/var/games/
  chown root:games $pkgdir/usr/lib/nethack/nethack
  #chmod 02755 $pkgdir/usr/lib/nethack/nethack

  install -Dm644 doc/Guidebook.txt $pkgdir/usr/share/doc/nethack/Guidebook.txt
  install -Dm644 dat/license $pkgdir/usr/share/licenses/nethack/LICENSE
}
