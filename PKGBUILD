# Maintainer: yuki-san <yuki.from.akita _at_ gmail.com>
# 
# nethack Maintainer : schuay <jakob.gruber _at_ gmail.com>
# nethack Contributor : kevin <kevin _at_ archlinux.org>
# nethack Contributor : Christian Schmidt <mucknert _at_ gmx.net>
# nethack Contributor : Markus Meissner <markus _at_ meissna.de>
# nethack Contributor : Nick Erdmann <erdmann _at_ date.upb.de>

pkgname=jnethack
pkgver=3.4.3_0.11
_nethackver=${pkgver/_*/}
pkgrel=5
pkgdesc='Japanized Nethack, A single player dungeon exploration game'
arch=('i686' 'x86_64')
url="http://jnethack.sourceforge.jp/"
license=('custom')
depends=('ncurses' 'gzip')
makedepends=('bzip2')
install=jnethack.install
options=(!makeflags)
source=("http://downloads.sourceforge.net/${pkgname#j}/${pkgname#j}-${_nethackver//./}-src.tgz"
        ${pkgname}-${pkgver//_/-}.diff.gz::"http://sourceforge.jp/frs/redir.php?f=%2Fjnethack%2F58545%2F${pkgname}-${pkgver//_/-}.diff.gz"
        "http://jnethack.sourceforge.jp/patch/utf8-ibm.patch"
        http://www.phys98.homeip.net/~ide/src/jnethack-3.4.3-0.10-yahpmon.patch.bz2
        jnethack-3.4.3-0.11-mc.diff)
md5sums=('21479c95990eefe7650df582426457f9'
         '2d7ddbc4772a1fcff9a607abff851a75'
         '33904a278b8c36cb5f17cf7a4db21a97'
         '2d3b58e7b71ef44589d7887434bde3f8'
         'b3b4de971fe61738f7de69802174d876')

prepare() {
  cd "$srcdir/${pkgname#j}-${_nethackver}"
  zcat "$srcdir"/${pkgname}-${pkgver//_/-}.diff.gz | patch -p1
  patch -p1 < "$srcdir/utf8-ibm.patch"
  bzcat "$srcdir/jnethack-3.4.3-0.10-yahpmon.patch.bz2" | patch -p1
  patch -p1 < "$srcdir/jnethack-3.4.3-0.11-mc.diff"
}

build(){
  cd "$srcdir/${pkgname#j}-${_nethackver}"
  sh sys/unix/setup.sh

  sed -e '/define HACKDIR/ s|/usr/games/lib/nethackdir|/var/games/nethack/|' \
      -e "/^#define COMPRESS\s/ s|/usr/bin/compress|$(which gzip)|" \
      -e '/^#define COMPRESS_EXTENSION/ s|".Z"|".gz"|' \
      -e 's|^/\* \(#define DLB\) \*/|\1|' -i include/config.h

  sed -e 's|^/\* \(#define SYSV\) \*/|\1|' \
      -e 's|^/\* \(#define LINUX\) \*/|\1|' \
      -e 's|^/\* \(#define TERMINFO\) \*/|\1|' \
      -e 's|^/\* \(#define TIMED_DELAY\) \*/|\1|' -i include/unixconf.h

  sed -e 's|^# \(WINTTYLIB = -lncurses\)|\1|' \
      -e 's|^WINTTYLIB = -ltermlib|#&|' \
      -e 's|^\(CFLAGS =\).*$|\1 -O2 -fomit-frame-pointer -I../include|' -i src/Makefile

  sed -e 's|^\(CFLAGS =\).*$|\1 -O2 -fomit-frame-pointer -I../include|' -i util/Makefile
  # we are setting up for setgid games, so modify all necessary permissions
  # to allow full access for groups

  sed -e '/^GAMEDIR\s*=/ s|/games/.*$|/var/games/$(GAME)|' \
      -e '/^GAMEUID\s*=/ s|games|root|' \
      -e '/^GAMEGRP\s*=/ s|bin|games|' \
      -e '/^GAMEPERM\s*=/ s|04755|02755|' \
      -e '/^FILEPERM\s*=/ s|0644|0664|' \
      -e '/^DIRPERM\s*=/ s|0755|0775|' \
      -e '/^SHELLDIR\s*=/ s|/games|/usr/bin|' -i Makefile

  sed -e "/^MANDIR\s*=/s|/usr/local/man/man6|$pkgdir/usr/share/man/man6|" -i doc/Makefile

  make
}
  
package() {
  cd "$srcdir/${pkgname#j}-${_nethackver}"

  install -dm755 $pkgdir/usr/share/{man/man6,doc/$pkgname}
  install -dm775 $pkgdir/var/games/
  make PREFIX=$pkgdir install manpages
  sed -e "s|HACKDIR=$pkgdir/|HACKDIR=/|" \
      -e 's|HACK=$HACKDIR|HACK=/usr/lib/jnethack|' \
      -i $pkgdir/usr/bin/jnethack

  install -dm755 $pkgdir/usr/lib/$pkgname
  mv $pkgdir/var/games/jnethack/{jnethack,recover} $pkgdir/usr/lib/$pkgname/

  install -Dm644 doc/Guidebook.txt $pkgdir/usr/share/doc/$pkgname/
  install -Dm644 doc/jGuidebook.txt $pkgdir/usr/share/doc/$pkgname/
      
  install -Dm644 dat/license $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
