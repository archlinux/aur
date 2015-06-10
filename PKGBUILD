# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Jamie <dyscoria@googlemail.com>

pkgname=nethack-x11
pkgver=3.4.3
pkgrel=8
pkgdesc='Single-player roguelike dungeon exploration game'
arch=('x86_64' 'i686')
url='http://www.nethack.org/'
license=('custom')
depends=('libxaw')
makedepends=('gendesk' 'setconf')
conflicts=('nethack')
backup=('etc/nethackrc')
source=("http://downloads.sourceforge.net/nethack/nethack-343-src.tgz"
        'nethack-x11.patch'
        'nethack-x11.png::http://bugs.gentoo.org/attachment.cgi?id=86458')
sha256sums=('bb39c3d2a9ee2df4a0c8fdde708fbc63740853a7608d2f4c560b488124866fe4'
            '1b3857f2c1ae5e418ab26ab2ed5dbb9eb61c506f262b07e15e9464c3c6734452'
            'e1e0b059c617af04ee88bed4b03b73c02f022663e001c5485fe9900ca2d76295')

prepare() {
  cd "$srcdir/nethack-$pkgver"

  gendesk -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" --exec nethack \
    --name 'Nethack (X11)' --genericname Nethack

  sh sys/unix/setup.sh
  patch -Np1 -i ../nethack-x11.patch

  # Create /etc/nethackrc with OPTIONS=windowtype:X11
  touch nethackrc
  setconf -a nethackrc OPTIONS 'windowtype:X11'

  # Add two new lines to nethack.sh
  sed -i \
    's|export HACKDIR|NETHACKOPTIONS=\nexport NETHACKOPTIONS\nexport HACKDIR|' \
    sys/unix/nethack.sh

  # Set HACKDIR
  setconf sys/unix/nethack.sh HACKDIR '/usr/share/nethack'

  # Set NETHACKOPTIONS
  setconf sys/unix/nethack.sh NETHACKOPTIONS '@/etc/nethackrc'
}

build() {
  cd "$srcdir/nethack-$pkgver"

  make
}

package() {
  cd "$srcdir/nethack-$pkgver"

  make PREFIX="${pkgdir}/usr" install

  install -Dm644 nethackrc "$pkgdir/etc/nethackrc"
  install -Dm644 dat/license \
    "$pkgdir/usr/share/licenses/$pkgname/license"
  install -Dm644 win/X11/nethack.rc \
    "$pkgdir/usr/share/doc/$pkgname/nethackrc"
  install -Dm644 "$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "../$pkgname.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
}

# vim:set ts=2 sw=2 et:
