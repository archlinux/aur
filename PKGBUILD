# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: Sascha Lüdecke <sascha@meta-x.de>
# Contributor: Jamie <dyscoria@googlemail.com>

pkgname=nethack-x11
pkgver=3.6.6
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
source=("https://nethack.org/download/${pkgver}/nethack-${pkgver//./}-src.tgz"
        'nethack-x11.patch'
        'warn_unused.patch'
        'nethack-x11.png::http://bugs.gentoo.org/attachment.cgi?id=86458')
sha256sums=('cfde0c3ab6dd7c22ae82e1e5a59ab80152304eb23fb06e3129439271e5643ed2'
            '685d68cbbd2c9854b52d71e53ca2c73c95adef43b79e7d36b6c244dc86f796e5'
            '6bbfb4cba6baa3b112cf5ae98593210736946f5778e8c252a925e699c02bbf2b'
            'e1e0b059c617af04ee88bed4b03b73c02f022663e001c5485fe9900ca2d76295')

prepare() {
  cd "NetHack-NetHack-${pkgver}_Released"

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

  patch -Np1 -i "$srcdir/warn_unused.patch"
  patch -Np1 -i "$srcdir/nethack-x11.patch"

  # Create /etc/nethackrc with OPTIONS=windowtype:X11
  setconf -a nethackrc OPTIONS 'windowtype:X11'

  # Add two new lines to nethack.sh
  sed -i \
    's|export HACKDIR|NETHACKOPTIONS=\nexport NETHACKOPTIONS\nexport HACKDIR|' \
    sys/unix/nethack.sh

  # Set HACKDIR and HACK
  setconf sys/unix/nethack.sh HACKDIR '/var/games/nethack/'
  setconf sys/unix/nethack.sh HACK '/usr/lib/nethack/nethack'

  # Set NETHACKOPTIONS
  setconf sys/unix/nethack.sh NETHACKOPTIONS '@/etc/nethackrc'

  # # Change Nethack.ad settings
  sed 's/variable/fixed/' -i win/X11/NetHack.ad
  sed 's/nh10/fixed/' -i win/X11/NetHack.ad
  sed 's/!NetHack.tile_file/NetHack.tile_file/' -i win/X11/NetHack.ad

  # From community/nethack
  sed -e '/^HACKDIR/ s|/games/lib/\$(GAME)dir|/var/games/nethack/|' \
      -e '/^SHELLDIR/ s|/games|/usr/bin|' \
      -e '/^VARDIRPERM/ s|0755|0775|' \
      -e '/^VARFILEPERM/ s|0600|0664|' \
      -e '/^GAMEPERM/ s|0755|02755|' \
      -e '/CURSES_GRAPHICS/ s|^|#|' \
      -e 's|\(DSYSCF_FILE=\)\\"[^"]*\\"|\1\\"/var/games/nethack/sysconf\\"|' \
      -e 's|\(DHACKDIR=\)\\"[^"]*\\"|\1\\"/var/games/nethack/\\"|' -i sys/unix/hints/linux

  sed -e "/^MANDIR\s*=/s|/usr/man/man6|$pkgdir/usr/share/man/man6|" -i sys/unix/Makefile.doc
}

build() {
  cd "NetHack-NetHack-${pkgver}_Released/sys/unix"
  sh setup.sh hints/linux
  
  cd ../..
  make
}

package() {
  cd "NetHack-NetHack-${pkgver}_Released"

  install -dm755 $pkgdir/usr/share/{man/man6,doc/nethack}
  install -dm775 $pkgdir/var/games/
  make PREFIX=$pkgdir -j1 install manpages # Multi-threaded builds fail.
  
  install -dm755 $pkgdir/usr/lib/nethack
  mv $pkgdir/var/games/nethack/{nethack,recover} $pkgdir/usr/lib/nethack/

  chown -R root:games $pkgdir/var/games/
  chown root:games $pkgdir/usr/lib/nethack/nethack

  install -Dm644 nethackrc "$pkgdir/etc/nethackrc"
  install -Dm644 dat/license "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 win/X11/nethack.rc "$pkgdir/usr/share/doc/$pkgname/nethackrc"
  install -Dm644 doc/Guidebook.txt "$pkgdir/usr/share/doc/$pkgname/Guidebook.txt"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "../$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -g games -Dm644 sys/unix/sysconf "$pkgdir/usr/games/nethack/sysconf"
}

# vim:set ts=2 sw=2 et:
