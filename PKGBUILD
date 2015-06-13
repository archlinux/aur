# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Jaroslav Lichtblau <tu@dragonlord.cz>

# ToME does not do ./configure to create its makefile, but has different
# makefiles for different operating systems. You are supposed to edit
# your preferences in the makefile for your system and then run
# make -f makefile.<system>.
#
# Quite a few things need to be done here, due to what was said above:
# 1) Change the lib directory to /usr/lib/tome2
# 2) Change the bin directory to /usr/bin
# 3) Change line 130 to enable ncurses support alongside X11 support
# 4) Change line 133 to show both ncurses and X11 libs
#

# todo:
# https://gitorious.org/tome2/tome2
# git://gitorious.org/tome2/tome2.git
# http://forums.te4.org/viewforum.php?f=28
# cleaner build options

pkgname=tome2
pkgver=235
pkgrel=1
pkgdesc="A dungeon crawler similar to Angband, based on the works of Tolkien."
arch=('i686' 'x86_64')
url="http://www.t-o-m-e.net"
license=('custom')
depends=('libx11' 'ncurses')
#source=(http://www.t-o-m-e.net/dl/src/tome-$pkgver-src.tar.bz2 \
source=(http://www.mirrorservice.org/sites/www.ibiblio.org/gentoo/distfiles/tome-$pkgver-src.tar.bz2 \
        LICENSE)

md5sums=('751ea71973413d3b54644cf86b20758f'
         '74183fd3880704df6ab64e4c2887b852')

build() {
  cd "$srcdir/tome-$pkgver-src/src"

  cp makefile.std makefile.std.chn

  sed -e 's@LIBDIR = ./lib/@LIBDIR = /usr/lib/tome2/@' \
  -e 's@BINDIR = /usr/local/games@BINDIR = /usr/bin/@' \
  -e '130s@-DUSE_X11@-DUSE_X11 -DUSE_GCU@' \
  -e '133s@-lX11@-lX11 -lncurses@' makefile.std.chn > makefile.std

  make --file=makefile.std
}

package() {
  cd "$srcdir/tome-$pkgver-src/src"
  install -d "$pkgdir/usr/lib"
  install -D -m755 "$srcdir/tome-$pkgver-src/src/tome" "$pkgdir/usr/bin/$pkgname"
  cp -R "$srcdir/tome-$pkgver-src/lib" "$pkgdir/usr/lib/$pkgname/"

  # scores file writable for all users
  chown root:users "$pkgdir/usr/lib/$pkgname/apex"
  chmod 774 "$pkgdir/usr/lib/$pkgname/apex"
  touch "$pkgdir/usr/lib/$pkgname/apex/scores.raw"
  chown root:users "$pkgdir/usr/lib/$pkgname/apex/scores.raw"
  chmod 664 "$pkgdir/usr/lib/$pkgname/apex/scores.raw"

  # data files writable for all users
  chmod 774 "$pkgdir/usr/lib/$pkgname/data"
  chown root:users "$pkgdir/usr/lib/$pkgname/data"
  touch "$pkgdir/usr/lib/$pkgname/data/"{ab_info,a_info,al_info,ba_info,d_info,e_info,f_info,k_info,ow_info,p_info,ra_info,re_info,r_info,set_info,s_info,st_info,tr_info,v_info,wf_info}.raw
  chown root:users "$pkgdir/usr/lib/$pkgname/data/"*
  chmod 664 "$pkgdir/usr/lib/$pkgname/data/"*

  # removing obsolete files
  find "$pkgdir/usr/lib/tome2" -type f -name "delete.me" -exec rm "{}" \;
  find "$pkgdir/usr/lib/tome2" -type f -name ".cvsignore" -exec rm "{}" \;

  # license
  install -D -m644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
