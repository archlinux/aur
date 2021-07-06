# Maintainer: Takuro Onoue <kusanaginoturugi at gmail.com>
# Contributor: yuki-san <yuki.from.akita@gmail.com>

# nethack Maintainer : schuay <jakob.gruber@gmail.com>
# nethack Contributor : kevin <kevin@archlinux.org>
# nethack Contributor : Christian Schmidt <mucknert@gmx.net>
# nethack Contributor : Markus Meissner <markus@meissna.de>
# nethack Contributor : Nick Erdmann <erdmann@date.upb.de>
pkgname=jnethack
pkgver=3.6.6_0.2
_nethackver=${pkgver/_*/}
_srcver=366
pkgrel=1
pkgdesc='Japanized Nethack, A single player dungeon exploration game'
arch=('i686' 'x86_64')
url="http://jnethack.osdn.jp/"
license=('custom')
depends=('ncurses' 'gzip')
makedepends=('bzip2' 'nkf' )
install=jnethack.install
options=(!makeflags)
source=("https://osdn.net/dl/jnethack/${pkgname#j}-${_srcver}-src.tgz"
        "https://osdn.net/projects/jnethack/downloads/74756/${pkgname}-${_nethackver}-0.2.diff.gz")
md5sums=('6c9a75f556d24c66801d74d8727a602e'
         '1f6e19b44a4cee04a7ebda275b1ea90a')

prepare() {
  cd "$srcdir/NetHack-NetHack-${_nethackver}_Released"

  # Apply jnethack patch
  patch -p1 < ../${pkgname}-${_nethackver}-0.2.diff

  sed -e 's|^/\* \(#define LINUX\) \*/|\1|' \
      -e 's|^/\* \(#define TIMED_DELAY\) \*/|\1|' -i include/unixconf.h

  # we are setting up for setgid games, so modify all necessary permissions
  # to allow full access for groups

  sed -e '/^HACKDIR/ s|/games/lib/\$(GAME)dir|/var/games/jnethack/|' \
      -e '/^SHELLDIR/ s|/games|/usr/bin|' \
      -e '/^VARDIRPERM/ s|0755|0775|' \
      -e '/^VARFILEPERM/ s|0600|0664|' \
      -e '/^GAMEPERM/ s|0755|02755|' \
      -e 's|\(DSYSCF_FILE=\)\\"[^"]*\\"|\1\\"/var/games/jnethack/sysconf\\"|' \
      -e 's|\(DHACKDIR=\)\\"[^"]*\\"|\1\\"/var/games/jnethack/\\"|' -i sys/unix/hints/linux

  sed -e 's|^#GAMEUID.*|GAMEUID = root|' \
      -e 's|^#GAMEGRP.*|GAMEGRP = games|' \
      -e '/^FILEPERM\s*=/ s|0644|0664|' \
      -e '/^DIRPERM\s*=/ s|0755|0775|' -i sys/unix/Makefile.top

  sed -e "/^MANDIR\s*=/s|/usr/man/man6|$pkgdir/usr/share/man/man6|" -i sys/unix/Makefile.doc

  echo "CFLAGS+=-DSTATUS_VIA_WINDOWPORT -DSTATUS_COLORS" >> sys/unix/hints/linux
  find . -type f | xargs nkf -e --overwrite
}

build(){
  cd "$srcdir/NetHack-NetHack-${_nethackver}_Released"/sys/unix
  sh setup.sh hints/linux

  cd "$srcdir/NetHack-NetHack-${_nethackver}_Released"
  make
}

package() {
  cd "$srcdir/NetHack-NetHack-${_nethackver}_Released"

  install -dm755 $pkgdir/usr/share/{man/man6,doc/jnethack}
  install -dm775 $pkgdir/var/games/
  make PREFIX=$pkgdir install manpages # Multi-threaded builds fail.
  sed -e "s|HACKDIR=$pkgdir/|HACKDIR=/|" \
      -e 's|HACK=$HACKDIR|HACK=/usr/lib/jnethack|' \
      -i $pkgdir/usr/bin/jnethack

  install -dm755 $pkgdir/usr/lib/jnethack
  mv $pkgdir/var/games/jnethack/{jnethack,recover} $pkgdir/usr/lib/jnethack/

  # FS#43414: /var/games should be owned by root:games.
  chown -R root:games $pkgdir/var/games/
  chown root:games $pkgdir/usr/lib/jnethack/jnethack
  #chmod 02755 $pkgdir/usr/lib/nethack/nethack

  install -Dm644 doc/Guidebook.txt $pkgdir/usr/share/doc/$pkgname/Guidebook.txt
  install -Dm644 dat/license $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
