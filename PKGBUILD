# Contributor: Nick <iglu.sitar at gmail dot com>
# Contributor: Daenyth <Daenyth+arch _AT_ gmail _DOT_ com>
# Contributor: wizzomafizzo <wizzomafizzo@gmail.com>
# Contributor: kevin <kevin@archlinux.org>
# Contributor: Christian Schmidt <mucknert@gmx.net>
# Contributor: Markus Meissner <markus@meissna.de>

pkgname=nethack-patch
pkgver=3.4.3
pkgrel=8
pkgdesc="A single player dungeon exploration game patched with UI enhancements"
arch=('i686' 'x86_64')
url="http://www.nethack.org/index.html"
license=('custom: nethack')
depends=('ncurses' 'gzip')
makedepends=(flex bison)
install=nethack.install
source=("http://downloads.sourceforge.net/nethack/nethack-343-src.tgz"
         nh343-menucolor.diff
         hpmon.diff
         dump-343.diff
         sortloot-343d.diff
         paranoid-343.diff
         nethack-3.4.3-gray-1.diff)
md5sums=('21479c95990eefe7650df582426457f9'
         'ade00f9cb51f1b0140557d329d56844c'
         'a8e5cab6a93100612d428f3973dc418f'
         'e61887eed94ecf4d3233bc6bc04bd7b5'
         '4b0e68547c081b0ca2204b9b7019459c'
         '8c9aeefd18faa754b32efa3fd09f7b19'
         '4d2576ef824b756b2b28ac333fb77535')
provides=("nethack=$pkgver")
conflicts=('nethack')
backup=(usr/share/nethack/record
        usr/share/nethack/logfile)

build() {
  # Add the patches to the source
  cd $srcdir/nethack-$pkgver/
  patch -Np1 -i $srcdir/nh343-menucolor.diff
  patch -Np1 -i $srcdir/hpmon.diff
  patch -Np1 -i $srcdir/dump-343.diff
  patch -Np1 -i $srcdir/sortloot-343d.diff
  patch -Np1 -i $srcdir/paranoid-343.diff
  patch -Np1 -i $srcdir/nethack-3.4.3-gray-1.diff

  # Run the setup script
  sh sys/unix/setup.sh

  # Enable the hpmon and dumplog patches    
  sed -e 's/#endif \/\* CONFIG_H \*\///' -i include/config.h
  echo '#define HPMON' >> include/config.h
  echo '#define DUMP_FN "/tmp/%n.nh"' >> include/config.h
  echo '#define SORTLOOT' >> include/config.h
  echo '#define PARANOID' >> include/config.h
  echo '#define AUTOPICKUP_EXCEPTIONS' >> include/config.h
  echo '#endif /* CONFIG_H */' >> include/config.h

  sed -e "s/\"wizard\"/\"root\"/" -i include/config.h

  # Configure the source for Arch
  sed -e '/define HACKDIR/ s|/usr/games/lib/nethackdir|/usr/share/nethack/|' \
      -e "/^#define COMPRESS\s/ s|/usr/bin/compress|$(which gzip)|" \
      -e '/^#define COMPRESS_EXTENSION/ s|".Z"|".gz"|' \
      -e 's|^/\* \(#define DLB\) \*/|\1|' -i include/config.h

  sed -e 's|^/\* \(#define LINUX\) \*/|\1|' \
      -e 's|^/\* \(#define TIMED_DELAY\) \*/|\1|' -i include/unixconf.h

  sed -e 's|^# \(WINTTYLIB = -lncurses\)|\1|' \
      -e 's|^WINTTYLIB = -ltermlib|#&|' -i src/Makefile

  sed -e '/^GAMEDIR\s*=/ s|/games/.*$|/usr/share/$(GAME)|' \
      -e '/^GAMEUID\s*=/ s|games|root|' \
      -e '/^GAMEGRP\s*=/ s|bin|root|' \
      -e '/^SHELLDIR\s*=/ s|/games|/usr/bin|' -i Makefile

  sed -e "/^MANDIR\s*=/s|/usr/man/man6|$pkgdir/usr/share/man/man6|" -i doc/Makefile

  # Build and install the package
  make || return 1
}

package() {
  cd $srcdir/nethack-$pkgver/

  install -dm755 $pkgdir/usr/share/{man/man6,doc/nethack}
  make PREFIX=$pkgdir install manpages

  # Patch the bin script to work
  sed -e "s|HACKDIR=$pkgdir/|HACKDIR=/|" \
      -e 's|HACK=$HACKDIR|HACK=/usr/lib/nethack|' -i $pkgdir/usr/bin/nethack

  install -dm755 $pkgdir/usr/lib/nethack
  mv $pkgdir/usr/share/nethack/{nethack,recover} $pkgdir/usr/lib/nethack/

  install -Dm644 doc/Guidebook.txt $pkgdir/usr/share/doc/nethack/Guidebook.txt

  install -Dm644 dat/license $pkgdir/usr/share/licenses/nethack/LICENSE
}

# vim:set ts=2 sw=2 et:
