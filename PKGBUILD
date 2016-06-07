# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Sascha Lüdecke <sascha@meta-x.de>
# Contributor: Jamie <dyscoria@googlemail.com>

pkgname=nethack-x11
pkgver=3.6.0
pkgrel=1
pkgdesc='Single-player roguelike dungeon exploration game (X11 version)'
arch=('x86_64' 'i686')
url='http://nethack.org/'
license=('custom')
depends=('libxaw')
makedepends=('setconf' 'gendesk')
conflicts=('nethack')
backup=('etc/nethackrc'
        'var/games/nethack/logfile'
        'var/games/nethack/xlogfile'
        'var/games/nethack/perm'
        'var/games/nethack/record'
        'usr/games/nethack/sysconf')
source=("http://downloads.sourceforge.net/nethack/nethack-${pkgver//./}-src.tgz"
        'nethack-x11.patch'
        'nethack-x11.png::http://bugs.gentoo.org/attachment.cgi?id=86458')
sha256sums=('1ade698d8458b8d87a4721444cb73f178c74ed1b6fde537c12000f8edf2cb18a'
            'be227a980243dba79ffc2bf311462f7b7d369899253c89dbb1ada4bedb2a5017'
            'e1e0b059c617af04ee88bed4b03b73c02f022663e001c5485fe9900ca2d76295')

prepare() {
  cd "nethack-$pkgver"

  gendesk -n -f \
    --pkgname "$pkgname" \
    --pkgdesc "$pkgdesc" \
    --exec nethack \
    --genericname Nethack \
    --name 'Nethack (X11)'

  ####
  ###
  ##  Issues (upstream)
  #
  #   - the tty mode is somehow not working
  #   - the contents of NETHACKOPTIONS is possibly ignored
  #   - the tile size doubling in Xresources may not work
  #   - custom tile files in sysconf/nethackrc may not work
  #   - ~/.nethackrc is somehow not working
  ##
  ###
  ####

  patch -Np1 -i ../nethack-x11.patch
  sh sys/unix/setup.sh

  # Create /etc/nethackrc with OPTIONS=windowtype:X11
  setconf -a nethackrc OPTIONS 'windowtype:X11'

  # Add two new lines to nethack.sh
  sed -i \
    's|export HACKDIR|NETHACKOPTIONS=\nexport NETHACKOPTIONS\nexport HACKDIR|' \
    sys/unix/nethack.sh

  # Set HACKDIR
  setconf sys/unix/nethack.sh HACKDIR '/usr/games/nethack'

  # Set NETHACKOPTIONS
  setconf sys/unix/nethack.sh NETHACKOPTIONS '@/etc/nethackrc'

  # # Change Nethack.ad settings
  sed 's/variable/fixed/' -i win/X11/NetHack.ad
  sed 's/nh10/fixed/' -i win/X11/NetHack.ad
  sed 's/!NetHack.tile_file/NetHack.tile_file/' -i win/X11/NetHack.ad
}

build() {
  cd "nethack-$pkgver"

  export CC="gcc"
  export CFLAGS='-I../include -O2 -fomit-frame-pointer -w'
  export LFLAGS="-L/usr/lib -L/usr/lib/X11 -Xlinker -soname=_APP_"
  export LINK="gcc"

  # MAXIMUM HACK-FORCE, ENGAGED!
  sh -c "make all -j1"
}

package() {
  cd "nethack-$pkgver"

  install -d "$pkgdir/var/games/nethack"
  export CFLAGS="-I../include -O2 -fomit-frame-pointer"
  setconf Makefile VARDIR "$pkgdir/var/games/nethack"
  echo -e "install:\n\ttrue" > src/Makefile
  make -k PREFIX=$pkgdir/usr install
  install -Dm644 nethackrc "$pkgdir/etc/nethackrc"
  install -Dm644 dat/license "$pkgdir/usr/share/licenses/$pkgname/license"
  install -Dm644 win/X11/nethack.rc "$pkgdir/usr/share/doc/$pkgname/nethackrc"
  install -Dm644 doc/Guidebook.txt "$pkgdir/usr/share/doc/$pkgname/Guidebook.txt"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "../$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -g games -Dm644 sys/unix/sysconf "$pkgdir/usr/games/nethack/sysconf"
}

# vim:set ts=2 sw=2 et:
